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
package EVE::ESI::Client::CalendarApi;

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
# get_characters_character_id_calendar
#
# List calendar event summaries
# 
# @param int $character_id The character to retrieve events from (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param int $from_event The event ID to retrieve events from (optional)
# @param string $token Access token to use, if preferred over a header (optional)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'character_id' => {
        data_type => 'int',
        description => 'The character to retrieve events from',
        required => '1',
    },
    'datasource' => {
        data_type => 'string',
        description => 'The server name you would like data from',
        required => '0',
    },
    'from_event' => {
        data_type => 'int',
        description => 'The event ID to retrieve events from',
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
    __PACKAGE__->method_documentation->{ 'get_characters_character_id_calendar' } = { 
    	summary => 'List calendar event summaries',
        params => $params,
        returns => 'ARRAY[GetCharactersCharacterIdCalendar200Ok]',
        };
}
# @return ARRAY[GetCharactersCharacterIdCalendar200Ok]
#
sub get_characters_character_id_calendar {
    my ($self, %args) = @_;

    # verify the required parameter 'character_id' is set
    unless (exists $args{'character_id'}) {
      croak("Missing the required parameter 'character_id' when calling get_characters_character_id_calendar");
    }

    # parse inputs
    my $_resource_path = '/characters/{character_id}/calendar/';

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
    if ( exists $args{'from_event'}) {
        $query_params->{'from_event'} = $self->{api_client}->to_query_value($args{'from_event'});
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

    # path params
    if ( exists $args{'character_id'}) {
        my $_base_variable = "{" . "character_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'character_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(evesso )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ARRAY[GetCharactersCharacterIdCalendar200Ok]', $response);
    return $_response_object;
}

#
# get_characters_character_id_calendar_event_id
#
# Get an event
# 
# @param int $character_id The character id requesting the event (required)
# @param int $event_id The id of the event requested (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $token Access token to use, if preferred over a header (optional)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'character_id' => {
        data_type => 'int',
        description => 'The character id requesting the event',
        required => '1',
    },
    'event_id' => {
        data_type => 'int',
        description => 'The id of the event requested',
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
    __PACKAGE__->method_documentation->{ 'get_characters_character_id_calendar_event_id' } = { 
    	summary => 'Get an event',
        params => $params,
        returns => 'GetCharactersCharacterIdCalendarEventIdOk',
        };
}
# @return GetCharactersCharacterIdCalendarEventIdOk
#
sub get_characters_character_id_calendar_event_id {
    my ($self, %args) = @_;

    # verify the required parameter 'character_id' is set
    unless (exists $args{'character_id'}) {
      croak("Missing the required parameter 'character_id' when calling get_characters_character_id_calendar_event_id");
    }

    # verify the required parameter 'event_id' is set
    unless (exists $args{'event_id'}) {
      croak("Missing the required parameter 'event_id' when calling get_characters_character_id_calendar_event_id");
    }

    # parse inputs
    my $_resource_path = '/characters/{character_id}/calendar/{event_id}/';

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

    # path params
    if ( exists $args{'character_id'}) {
        my $_base_variable = "{" . "character_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'character_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    # path params
    if ( exists $args{'event_id'}) {
        my $_base_variable = "{" . "event_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'event_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(evesso )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('GetCharactersCharacterIdCalendarEventIdOk', $response);
    return $_response_object;
}

#
# put_characters_character_id_calendar_event_id
#
# Respond to an event
# 
# @param int $character_id The character ID requesting the event (required)
# @param int $event_id The ID of the event requested (required)
# @param PutCharactersCharacterIdCalendarEventIdResponse $response The response value to set, overriding current value. (required)
# @param string $datasource The server name you would like data from (optional, default to tranquility)
# @param string $token Access token to use, if preferred over a header (optional)
# @param string $user_agent Client identifier, takes precedence over headers (optional)
# @param string $x_user_agent Client identifier, takes precedence over User-Agent (optional)
{
    my $params = {
    'character_id' => {
        data_type => 'int',
        description => 'The character ID requesting the event',
        required => '1',
    },
    'event_id' => {
        data_type => 'int',
        description => 'The ID of the event requested',
        required => '1',
    },
    'response' => {
        data_type => 'PutCharactersCharacterIdCalendarEventIdResponse',
        description => 'The response value to set, overriding current value.',
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
    __PACKAGE__->method_documentation->{ 'put_characters_character_id_calendar_event_id' } = { 
    	summary => 'Respond to an event',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub put_characters_character_id_calendar_event_id {
    my ($self, %args) = @_;

    # verify the required parameter 'character_id' is set
    unless (exists $args{'character_id'}) {
      croak("Missing the required parameter 'character_id' when calling put_characters_character_id_calendar_event_id");
    }

    # verify the required parameter 'event_id' is set
    unless (exists $args{'event_id'}) {
      croak("Missing the required parameter 'event_id' when calling put_characters_character_id_calendar_event_id");
    }

    # verify the required parameter 'response' is set
    unless (exists $args{'response'}) {
      croak("Missing the required parameter 'response' when calling put_characters_character_id_calendar_event_id");
    }

    # parse inputs
    my $_resource_path = '/characters/{character_id}/calendar/{event_id}/';

    my $_method = 'PUT';
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

    # path params
    if ( exists $args{'character_id'}) {
        my $_base_variable = "{" . "character_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'character_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    # path params
    if ( exists $args{'event_id'}) {
        my $_base_variable = "{" . "event_id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'event_id'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # body params
    if ( exists $args{'response'}) {
        $_body_data = $args{'response'};
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
