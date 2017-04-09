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
package EVE::ESI::Client::AllianceApi;

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
# get_alliances
#
# List all alliances
# 
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
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
    __PACKAGE__->method_documentation->{ 'get_alliances' } = { 
    	summary => 'List all alliances',
        params => $params,
        returns => 'ARRAY[int]',
        };
}
# @return ARRAY[int]
#
sub get_alliances {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/alliances/';

    my $_method = 'GET';
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
    if ( exists $args{'user_agent'}) {
        $query_params->{'user_agent'} = $self->{api_client}->to_query_value($args{'user_agent'});
    }

    # header params
    if ( exists $args{'x_user_agent'}) {
        $header_params->{'X-User-Agent'} = $self->{api_client}->to_header_value($args{'x_user_agent'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ARRAY[int]', $response);
    return $_response_object;
}

#
# get_alliances_alliance_id
#
# Get alliance information
# 
# @param int $alliance_id An Eve alliance ID (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'alliance_id' => {
        data_type => 'int',
        description => 'An Eve alliance ID',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
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
    __PACKAGE__->method_documentation->{ 'get_alliances_alliance_id' } = { 
    	summary => 'Get alliance information',
        params => $params,
        returns => 'GetAlliancesAllianceIdOk',
        };
}
# @return GetAlliancesAllianceIdOk
#
sub get_alliances_alliance_id {
    my ($self, %args) = @_;

    # verify the required parameter 'alliance_id' is set
    unless (exists $args{'alliance_id'}) {
      croak("Missing the required parameter 'alliance_id' when calling get_alliances_alliance_id");
    }

    # parse inputs
    my $_resource_path = '/alliances/{alliance_id}/';

    my $_method = 'GET';
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
    if ( exists $args{'user_agent'}) {
        $query_params->{'user_agent'} = $self->{api_client}->to_query_value($args{'user_agent'});
    }

    # header params
    if ( exists $args{'x_user_agent'}) {
        $header_params->{'X-User-Agent'} = $self->{api_client}->to_header_value($args{'x_user_agent'});
    }

    # path params
    if ( exists $args{'alliance_id'}) {
        my $_base_variable = "{" . "alliance_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'alliance_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('GetAlliancesAllianceIdOk', $response);
    return $_response_object;
}

#
# get_alliances_alliance_id_corporations
#
# List alliance's corporations
# 
# @param int $alliance_id An EVE alliance ID (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'alliance_id' => {
        data_type => 'int',
        description => 'An EVE alliance ID',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
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
    __PACKAGE__->method_documentation->{ 'get_alliances_alliance_id_corporations' } = { 
    	summary => 'List alliance&#39;s corporations',
        params => $params,
        returns => 'ARRAY[int]',
        };
}
# @return ARRAY[int]
#
sub get_alliances_alliance_id_corporations {
    my ($self, %args) = @_;

    # verify the required parameter 'alliance_id' is set
    unless (exists $args{'alliance_id'}) {
      croak("Missing the required parameter 'alliance_id' when calling get_alliances_alliance_id_corporations");
    }

    # parse inputs
    my $_resource_path = '/alliances/{alliance_id}/corporations/';

    my $_method = 'GET';
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
    if ( exists $args{'user_agent'}) {
        $query_params->{'user_agent'} = $self->{api_client}->to_query_value($args{'user_agent'});
    }

    # header params
    if ( exists $args{'x_user_agent'}) {
        $header_params->{'X-User-Agent'} = $self->{api_client}->to_header_value($args{'x_user_agent'});
    }

    # path params
    if ( exists $args{'alliance_id'}) {
        my $_base_variable = "{" . "alliance_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'alliance_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ARRAY[int]', $response);
    return $_response_object;
}

#
# get_alliances_alliance_id_icons
#
# Get alliance icon
# 
# @param int $alliance_id An EVE alliance ID (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'alliance_id' => {
        data_type => 'int',
        description => 'An EVE alliance ID',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
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
    __PACKAGE__->method_documentation->{ 'get_alliances_alliance_id_icons' } = { 
    	summary => 'Get alliance icon',
        params => $params,
        returns => 'GetAlliancesAllianceIdIconsOk',
        };
}
# @return GetAlliancesAllianceIdIconsOk
#
sub get_alliances_alliance_id_icons {
    my ($self, %args) = @_;

    # verify the required parameter 'alliance_id' is set
    unless (exists $args{'alliance_id'}) {
      croak("Missing the required parameter 'alliance_id' when calling get_alliances_alliance_id_icons");
    }

    # parse inputs
    my $_resource_path = '/alliances/{alliance_id}/icons/';

    my $_method = 'GET';
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
    if ( exists $args{'user_agent'}) {
        $query_params->{'user_agent'} = $self->{api_client}->to_query_value($args{'user_agent'});
    }

    # header params
    if ( exists $args{'x_user_agent'}) {
        $header_params->{'X-User-Agent'} = $self->{api_client}->to_header_value($args{'x_user_agent'});
    }

    # path params
    if ( exists $args{'alliance_id'}) {
        my $_base_variable = "{" . "alliance_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'alliance_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('GetAlliancesAllianceIdIconsOk', $response);
    return $_response_object;
}

#
# get_alliances_names
#
# Get alliance names
# 
# @param ARRAY[int] $alliance_ids A comma separated list of alliance IDs (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'alliance_ids' => {
        data_type => 'ARRAY[int]',
        description => 'A comma separated list of alliance IDs',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
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
    __PACKAGE__->method_documentation->{ 'get_alliances_names' } = { 
    	summary => 'Get alliance names',
        params => $params,
        returns => 'ARRAY[GetAlliancesNames200Ok]',
        };
}
# @return ARRAY[GetAlliancesNames200Ok]
#
sub get_alliances_names {
    my ($self, %args) = @_;

    # verify the required parameter 'alliance_ids' is set
    unless (exists $args{'alliance_ids'}) {
      croak("Missing the required parameter 'alliance_ids' when calling get_alliances_names");
    }

    # parse inputs
    my $_resource_path = '/alliances/names/';

    my $_method = 'GET';
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
    if ( exists $args{'alliance_ids'}) {
        $query_params->{'alliance_ids'} = $self->{api_client}->to_query_value($args{'alliance_ids'});
    }

    # query params
    if ( exists $args{'datasource'}) {
        $query_params->{'datasource'} = $self->{api_client}->to_query_value($args{'datasource'});
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
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ARRAY[GetAlliancesNames200Ok]', $response);
    return $_response_object;
}

1;