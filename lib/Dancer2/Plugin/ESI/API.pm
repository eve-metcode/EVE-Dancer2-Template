package Dancer2::Plugin::ESI::API;

use strict;
use warnings;
 
use Dancer2::Plugin;

use EVE::ESI::Client::ApiFactory;;
use Dancer2::Plugin::Auth::ESI::SSO;

plugin_keywords 'esiApi';

sub esiApi {
    my $plugin = shift;

    # get the authentication token from the session
    my $token = getAuthToken;

    # exit if we didn't get a valid token
    return undef unless $token;

    # create the API instance

    my $api = EVE::ESI::Client::ApiFactory->new(access_token => $token);
    
    # return the API
    return $api;
}

1;