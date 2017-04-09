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
package EVE::ESI::Client::WarsApi;

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
# get_wars
#
# List wars
# 
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param int $max_war_id Only return wars with ID smaller than this. (optional)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
        required => '0',
    },
    'max_war_id' => {
        data_type => 'int',
        description => 'Only return wars with ID smaller than this.',
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
    __PACKAGE__->method_documentation->{ 'get_wars' } = { 
    	summary => 'List wars',
        params => $params,
        returns => 'ARRAY[int]',
        };
}
# @return ARRAY[int]
#
sub get_wars {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/wars/';

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
    if ( exists $args{'max_war_id'}) {
        $query_params->{'max_war_id'} = $self->{api_client}->to_query_value($args{'max_war_id'});
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
# get_wars_war_id
#
# Get war information
# 
# @param int $war_id ID for a war (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'war_id' => {
        data_type => 'int',
        description => 'ID for a war',
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
    __PACKAGE__->method_documentation->{ 'get_wars_war_id' } = { 
    	summary => 'Get war information',
        params => $params,
        returns => 'GetWarsWarIdOk',
        };
}
# @return GetWarsWarIdOk
#
sub get_wars_war_id {
    my ($self, %args) = @_;

    # verify the required parameter 'war_id' is set
    unless (exists $args{'war_id'}) {
      croak("Missing the required parameter 'war_id' when calling get_wars_war_id");
    }

    # parse inputs
    my $_resource_path = '/wars/{war_id}/';

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
    if ( exists $args{'war_id'}) {
        my $_base_variable = "{" . "war_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'war_id'});
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
    my $_response_object = $self->{api_client}->deserialize('GetWarsWarIdOk', $response);
    return $_response_object;
}

#
# get_wars_war_id_killmails
#
# List kills for a war
# 
# @param int $war_id A valid war ID (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param int $page Which page to query, starting at 1, 2000 killmails per page. (optional, default to 1)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'war_id' => {
        data_type => 'int',
        description => 'A valid war ID',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
        required => '0',
    },
    'page' => {
        data_type => 'int',
        description => 'Which page to query, starting at 1, 2000 killmails per page.',
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
    __PACKAGE__->method_documentation->{ 'get_wars_war_id_killmails' } = { 
    	summary => 'List kills for a war',
        params => $params,
        returns => 'ARRAY[GetWarsWarIdKillmails200Ok]',
        };
}
# @return ARRAY[GetWarsWarIdKillmails200Ok]
#
sub get_wars_war_id_killmails {
    my ($self, %args) = @_;

    # verify the required parameter 'war_id' is set
    unless (exists $args{'war_id'}) {
      croak("Missing the required parameter 'war_id' when calling get_wars_war_id_killmails");
    }

    # parse inputs
    my $_resource_path = '/wars/{war_id}/killmails/';

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
    if ( exists $args{'page'}) {
        $query_params->{'page'} = $self->{api_client}->to_query_value($args{'page'});
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
    if ( exists $args{'war_id'}) {
        my $_base_variable = "{" . "war_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'war_id'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[GetWarsWarIdKillmails200Ok]', $response);
    return $_response_object;
}

1;