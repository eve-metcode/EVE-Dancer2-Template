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
package EVE::ESI::Client::RoutesApi;

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
# get_route_origin_destination
#
# Get route
# 
# @param int $destination destination solar system ID (required)
# @param int $origin origin solar system ID (required)
# @param ARRAY[int] $avoid avoid solar system ID(s) (optional)
# @param ARRAY[ARRAY[int]] $connections connected solar system pairs (optional)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $flag route security preference (optional, default to shortest)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'destination' => {
        data_type => 'int',
        description => 'destination solar system ID',
        required => '1',
    },
    'origin' => {
        data_type => 'int',
        description => 'origin solar system ID',
        required => '1',
    },
    'avoid' => {
        data_type => 'ARRAY[int]',
        description => 'avoid solar system ID(s)',
        required => '0',
    },
    'connections' => {
        data_type => 'ARRAY[ARRAY[int]]',
        description => 'connected solar system pairs',
        required => '0',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
        required => '0',
    },
    'flag' => {
        data_type => 'string',
        description => 'route security preference',
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
    __PACKAGE__->method_documentation->{ 'get_route_origin_destination' } = { 
    	summary => 'Get route',
        params => $params,
        returns => 'ARRAY[int]',
        };
}
# @return ARRAY[int]
#
sub get_route_origin_destination {
    my ($self, %args) = @_;

    # verify the required parameter 'destination' is set
    unless (exists $args{'destination'}) {
      croak("Missing the required parameter 'destination' when calling get_route_origin_destination");
    }

    # verify the required parameter 'origin' is set
    unless (exists $args{'origin'}) {
      croak("Missing the required parameter 'origin' when calling get_route_origin_destination");
    }

    # parse inputs
    my $_resource_path = '/route/{origin}/{destination}/';

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
    if ( exists $args{'avoid'}) {
        $query_params->{'avoid'} = $self->{api_client}->to_query_value($args{'avoid'});
    }

    # query params
    if ( exists $args{'connections'}) {
        $query_params->{'connections'} = $self->{api_client}->to_query_value($args{'connections'});
    }

    # query params
    if ( exists $args{'datasource'}) {
        $query_params->{'datasource'} = $self->{api_client}->to_query_value($args{'datasource'});
    }

    # query params
    if ( exists $args{'flag'}) {
        $query_params->{'flag'} = $self->{api_client}->to_query_value($args{'flag'});
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
    if ( exists $args{'destination'}) {
        my $_base_variable = "{" . "destination" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'destination'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    # path params
    if ( exists $args{'origin'}) {
        my $_base_variable = "{" . "origin" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'origin'});
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

1;