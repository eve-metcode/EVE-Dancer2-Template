=begin comment

EVE Swagger Interface

An OpenAPI for EVE Online

OpenAPI spec version: 0.4.2.dev22

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end comment

=cut

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
package EVE::ESI::Client::UserInterfaceApi;

require 5.6.0;
use strict;
use warnings;
use utf8; 
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use EVE::ESI::Client::ApiClient;

use base "Class::Data::Inheritable";

__PACKAGE__->mk_classdata('method_documentation' => {});

sub new {
    my $class = shift;
    my $api_client;

    if ($_[0] && ref $_[0] && ref $_[0] eq 'EVE::ESI::Client::ApiClient' ) {
        $api_client = $_[0];
    } else {
        $api_client = EVE::ESI::Client::ApiClient->new(@_);
    }

    bless { api_client => $api_client }, $class;

}


#
# post_ui_autopilot_waypoint
#
# Set Autopilot Waypoint
# 
# @param boolean $add_to_beginning Whether this solar system should be added to the beginning of all waypoints (required)
# @param boolean $clear_other_waypoints Whether clean other waypoints beforing adding this one (required)
# @param int $destination_id The destination to travel to, can be solar system, station or structure&#39;s id (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $token Access token to use, if preferred over a header (optional)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'add_to_beginning' => {
        data_type => 'boolean',
        description => 'Whether this solar system should be added to the beginning of all waypoints',
        required => '1',
    },
    'clear_other_waypoints' => {
        data_type => 'boolean',
        description => 'Whether clean other waypoints beforing adding this one',
        required => '1',
    },
    'destination_id' => {
        data_type => 'int',
        description => 'The destination to travel to, can be solar system, station or structure&#39;s id',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
        required => '0',
    },
    'token' => {
        data_type => 'string',
        description => 'Access token to use, if preferred over a header',
        required => '0',
    },
    'user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over headers',
        required => '0',
    },
    'x_user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over User-Agent',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'post_ui_autopilot_waypoint' } = { 
    	summary => 'Set Autopilot Waypoint',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub post_ui_autopilot_waypoint {
    my ($self, %args) = @_;

    # verify the required parameter 'add_to_beginning' is set
    unless (exists $args{'add_to_beginning'}) {
      croak("Missing the required parameter 'add_to_beginning' when calling post_ui_autopilot_waypoint");
    }

    # verify the required parameter 'clear_other_waypoints' is set
    unless (exists $args{'clear_other_waypoints'}) {
      croak("Missing the required parameter 'clear_other_waypoints' when calling post_ui_autopilot_waypoint");
    }

    # verify the required parameter 'destination_id' is set
    unless (exists $args{'destination_id'}) {
      croak("Missing the required parameter 'destination_id' when calling post_ui_autopilot_waypoint");
    }

    # parse inputs
    my $_resource_path = '/ui/autopilot/waypoint/';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'add_to_beginning'}) {
        $query_params->{'add_to_beginning'} = $self->{api_client}->to_query_value($args{'add_to_beginning'});
    }

    # query params
    if ( exists $args{'clear_other_waypoints'}) {
        $query_params->{'clear_other_waypoints'} = $self->{api_client}->to_query_value($args{'clear_other_waypoints'});
    }

    # query params
    if ( exists $args{'datasource'}) {
        $query_params->{'datasource'} = $self->{api_client}->to_query_value($args{'datasource'});
    }

    # query params
    if ( exists $args{'destination_id'}) {
        $query_params->{'destination_id'} = $self->{api_client}->to_query_value($args{'destination_id'});
    }

    # query params
    if ( exists $args{'token'}) {
        $query_params->{'token'} = $self->{api_client}->to_query_value($args{'token'});
    }

    # query params
    if ( exists $args{'user_agent'}) {
        $query_params->{'user_agent'} = $self->{api_client}->to_query_value($args{'user_agent'});
    }

    # header params
    if ( exists $args{'x_user_agent'}) {
        $header_params->{'X-User-Agent'} = $self->{api_client}->to_header_value($args{'x_user_agent'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(evesso )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# post_ui_openwindow_contract
#
# Open Contract Window
# 
# @param int $contract_id The contract to open (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $token Access token to use, if preferred over a header (optional)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'contract_id' => {
        data_type => 'int',
        description => 'The contract to open',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
        required => '0',
    },
    'token' => {
        data_type => 'string',
        description => 'Access token to use, if preferred over a header',
        required => '0',
    },
    'user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over headers',
        required => '0',
    },
    'x_user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over User-Agent',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'post_ui_openwindow_contract' } = { 
    	summary => 'Open Contract Window',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub post_ui_openwindow_contract {
    my ($self, %args) = @_;

    # verify the required parameter 'contract_id' is set
    unless (exists $args{'contract_id'}) {
      croak("Missing the required parameter 'contract_id' when calling post_ui_openwindow_contract");
    }

    # parse inputs
    my $_resource_path = '/ui/openwindow/contract/';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'contract_id'}) {
        $query_params->{'contract_id'} = $self->{api_client}->to_query_value($args{'contract_id'});
    }

    # query params
    if ( exists $args{'datasource'}) {
        $query_params->{'datasource'} = $self->{api_client}->to_query_value($args{'datasource'});
    }

    # query params
    if ( exists $args{'token'}) {
        $query_params->{'token'} = $self->{api_client}->to_query_value($args{'token'});
    }

    # query params
    if ( exists $args{'user_agent'}) {
        $query_params->{'user_agent'} = $self->{api_client}->to_query_value($args{'user_agent'});
    }

    # header params
    if ( exists $args{'x_user_agent'}) {
        $header_params->{'X-User-Agent'} = $self->{api_client}->to_header_value($args{'x_user_agent'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(evesso )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# post_ui_openwindow_information
#
# Open Information Window
# 
# @param int $target_id The target to open (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $token Access token to use, if preferred over a header (optional)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'target_id' => {
        data_type => 'int',
        description => 'The target to open',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
        required => '0',
    },
    'token' => {
        data_type => 'string',
        description => 'Access token to use, if preferred over a header',
        required => '0',
    },
    'user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over headers',
        required => '0',
    },
    'x_user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over User-Agent',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'post_ui_openwindow_information' } = { 
    	summary => 'Open Information Window',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub post_ui_openwindow_information {
    my ($self, %args) = @_;

    # verify the required parameter 'target_id' is set
    unless (exists $args{'target_id'}) {
      croak("Missing the required parameter 'target_id' when calling post_ui_openwindow_information");
    }

    # parse inputs
    my $_resource_path = '/ui/openwindow/information/';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'datasource'}) {
        $query_params->{'datasource'} = $self->{api_client}->to_query_value($args{'datasource'});
    }

    # query params
    if ( exists $args{'target_id'}) {
        $query_params->{'target_id'} = $self->{api_client}->to_query_value($args{'target_id'});
    }

    # query params
    if ( exists $args{'token'}) {
        $query_params->{'token'} = $self->{api_client}->to_query_value($args{'token'});
    }

    # query params
    if ( exists $args{'user_agent'}) {
        $query_params->{'user_agent'} = $self->{api_client}->to_query_value($args{'user_agent'});
    }

    # header params
    if ( exists $args{'x_user_agent'}) {
        $header_params->{'X-User-Agent'} = $self->{api_client}->to_header_value($args{'x_user_agent'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(evesso )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# post_ui_openwindow_marketdetails
#
# Open Market Details
# 
# @param int $type_id The item type to open in market window (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $token Access token to use, if preferred over a header (optional)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'type_id' => {
        data_type => 'int',
        description => 'The item type to open in market window',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
        required => '0',
    },
    'token' => {
        data_type => 'string',
        description => 'Access token to use, if preferred over a header',
        required => '0',
    },
    'user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over headers',
        required => '0',
    },
    'x_user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over User-Agent',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'post_ui_openwindow_marketdetails' } = { 
    	summary => 'Open Market Details',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub post_ui_openwindow_marketdetails {
    my ($self, %args) = @_;

    # verify the required parameter 'type_id' is set
    unless (exists $args{'type_id'}) {
      croak("Missing the required parameter 'type_id' when calling post_ui_openwindow_marketdetails");
    }

    # parse inputs
    my $_resource_path = '/ui/openwindow/marketdetails/';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'datasource'}) {
        $query_params->{'datasource'} = $self->{api_client}->to_query_value($args{'datasource'});
    }

    # query params
    if ( exists $args{'token'}) {
        $query_params->{'token'} = $self->{api_client}->to_query_value($args{'token'});
    }

    # query params
    if ( exists $args{'type_id'}) {
        $query_params->{'type_id'} = $self->{api_client}->to_query_value($args{'type_id'});
    }

    # query params
    if ( exists $args{'user_agent'}) {
        $query_params->{'user_agent'} = $self->{api_client}->to_query_value($args{'user_agent'});
    }

    # header params
    if ( exists $args{'x_user_agent'}) {
        $header_params->{'X-User-Agent'} = $self->{api_client}->to_header_value($args{'x_user_agent'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(evesso )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# post_ui_openwindow_newmail
#
# Open New Mail Window
# 
# @param PostUiOpenwindowNewmailNewMail $new_mail The details of mail to create (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $token Access token to use, if preferred over a header (optional)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'new_mail' => {
        data_type => 'PostUiOpenwindowNewmailNewMail',
        description => 'The details of mail to create',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
        required => '0',
    },
    'token' => {
        data_type => 'string',
        description => 'Access token to use, if preferred over a header',
        required => '0',
    },
    'user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over headers',
        required => '0',
    },
    'x_user_agent' => {
        data_type => 'string',
        description => 'Client identifier, takes precedence over User-Agent',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'post_ui_openwindow_newmail' } = { 
    	summary => 'Open New Mail Window',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub post_ui_openwindow_newmail {
    my ($self, %args) = @_;

    # verify the required parameter 'new_mail' is set
    unless (exists $args{'new_mail'}) {
      croak("Missing the required parameter 'new_mail' when calling post_ui_openwindow_newmail");
    }

    # parse inputs
    my $_resource_path = '/ui/openwindow/newmail/';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'datasource'}) {
        $query_params->{'datasource'} = $self->{api_client}->to_query_value($args{'datasource'});
    }

    # query params
    if ( exists $args{'token'}) {
        $query_params->{'token'} = $self->{api_client}->to_query_value($args{'token'});
    }

    # query params
    if ( exists $args{'user_agent'}) {
        $query_params->{'user_agent'} = $self->{api_client}->to_query_value($args{'user_agent'});
    }

    # header params
    if ( exists $args{'x_user_agent'}) {
        $header_params->{'X-User-Agent'} = $self->{api_client}->to_header_value($args{'x_user_agent'});
    }

    my $_body_data;
    # body params
    if ( exists $args{'new_mail'}) {
        $_body_data = $args{'new_mail'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(evesso )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

1;