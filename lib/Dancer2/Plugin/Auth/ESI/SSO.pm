package Dancer2::Plugin::Auth::ESI::SSO;

use strict;
use warnings;

use Dancer2::Plugin;

use Net::OAuth2::Profile::WebServer;
use JSON;

has 'scopes' => (
    is => 'ro',
    default => sub {
        $_[0]->config->{scopes} || []
    }
);

has 'client_id' => (
    is => 'ro',
    default => sub {
        $_[0]->config->{client_id}
    },
    required => 1,
);

has 'client_secret' => (
    is => 'ro',
    default => sub {
        $_[0]->config->{client_secret}
    },
    required => 1,    
);

has 'callback_path' => (
    is => 'ro',
    default => sub {
        $_[0]->config->{callback_path} || '/auth/callback'
    }
);

has 'user_attribute' => (
    is => 'ro',
    default => sub {
        $_[0]->config->{session}{user_attribute} || 'sso_user'
    }
);

has 'token_attribute' => (
    is => 'ro',
    default => sub {
        $_[0]->config->{session}{token_attribute} || 'sso_token'
    }
);

has 'oauth2' => (
    is => 'ro',
    builder => '_build_oauth2',
    lazy => 1,
);

plugin_keywords qw/
    auth_eve
    getAuthToken
/;

sub auth_eve {
    my ($plugin, %options) = @_;

    my $dsl = $plugin->dsl;
    my $params = $dsl->params;

    # check if we are called from the auth callback
    if ( $plugin->app->request->path eq $plugin->callback_path ) {
        # check if the correct paramters are returend
        my $code = $params->{code};
        if ( $code ) {
            my $token = $plugin->oauth2->get_access_token($code);
            # check if there was an error
            if ($token->error) {
                $token->dsl->error($token->error_description);
                $dsl->send_error("invalid oauth token",403);
                # exit here
                return;
            }
            # token looks good, save it to the current session
            $dsl->session($plugin->token_attribute,$token->session_freeze);

            # get the character information from the oauth endpoint
            my $result = $token->get('https://login.eveonline.com/oauth/verify');
            my $user_data = from_json($result->content);

            # save the user information to our session
            $dsl->session($plugin->user_attribute,$user_data);

            # handle the state parameter and redirect the user to the location he wanted
            $dsl->redirect($params->{state});
        }
    }

    # check if we are logged in already
    my $user = $plugin->dsl->session($plugin->user_attribute);
    unless ($user) {
        # we redirect our user to the login page
        $dsl->redirect($plugin->oauth2->authorize(
            redirect_uri => $dsl->uri_for($plugin->callback_path),
            state => $plugin->app->request->path
        ));
    }

    # TODO: check if the session is still valid?
}

sub getAuthToken {
    my ($plugin, %options) = @_;

    my $dsl = $plugin->dsl;
    my $session_token = $dsl->session($plugin->token_attribute);
    
    # check if the we have a valid token
    unless ($session_token) {
        $dsl->error('requests AuthToken without valid session');
        return undef;
    }
    # restore our token
    my $token = Net::OAuth2::AccessToken->session_thaw($session_token, profile => $plugin->oauth2);

    # return the base64 token
    return $token->access_token;
}

sub _build_oauth2 {
    my ($self) = @_;
    my $oauth2 = Net::OAuth2::Profile::WebServer->new(
        client_id       => $self->client_id,
        client_secret   => $self->client_secret,
        scope           => join(' ',@{$self->scopes}),
        site            => 'https://login.eveonline.com/',
        access_token_path => '/oauth/token',
        refresh_token_path => '/oauth/token',
    );
    return $oauth2;
}

1;