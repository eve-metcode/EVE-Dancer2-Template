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
package EVE::ESI::Client::Object::GetCorporationsCorporationIdOk;

require 5.6.0;
use strict;
use warnings;
use utf8;
use JSON qw(decode_json);
use Data::Dumper;
use Module::Runtime qw(use_module);
use Log::Any qw($log);
use Date::Parse;
use DateTime;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#200 ok object
#
# NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
# REF: https://github.com/swagger-api/swagger-codegen
#

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
__PACKAGE__->mk_classdata('attribute_map' => {});
__PACKAGE__->mk_classdata('swagger_types' => {});
__PACKAGE__->mk_classdata('method_documentation' => {}); 
__PACKAGE__->mk_classdata('class_documentation' => {});

# new object
sub new { 
    my ($class, %args) = @_; 

	my $self = bless {}, $class;
	
	foreach my $attribute (keys %{$class->attribute_map}) {
		my $args_key = $class->attribute_map->{$attribute};
		$self->$attribute( $args{ $args_key } );
	}
	
	return $self;
}  

# return perl hash
sub to_hash {
    return decode_json(JSON->new->convert_blessed->encode( shift ));
}

# used by JSON for serialization
sub TO_JSON { 
    my $self = shift;
    my $_data = {};
    foreach my $_key (keys %{$self->attribute_map}) {
        if (defined $self->{$_key}) {
            $_data->{$self->attribute_map->{$_key}} = $self->{$_key};
        }
    }
    return $_data;
}

# from Perl hashref
sub from_hash {
    my ($self, $hash) = @_;

    # loop through attributes and use swagger_types to deserialize the data
    while ( my ($_key, $_type) = each %{$self->swagger_types} ) {
    	my $_json_attribute = $self->attribute_map->{$_key}; 
        if ($_type =~ /^array\[/i) { # array
            my $_subclass = substr($_type, 6, -1);
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize($_subclass, $_element);
            }
            $self->{$_key} = \@_array;
        } elsif (exists $hash->{$_json_attribute}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{$_json_attribute});
        } else {
        	$log->debugf("Warning: %s (%s) does not exist in input hash\n", $_key, $_json_attribute);
        }
    }
  
    return $self;
}

# deserialize non-array data
sub _deserialize {
    my ($self, $type, $data) = @_;
    $log->debugf("deserializing %s with %s",Dumper($data), $type);
        
    if ($type eq 'DateTime') {
        return DateTime->from_epoch(epoch => str2time($data));
    } elsif ( grep( /^$type$/, ('int', 'double', 'string', 'boolean'))) {
        return $data;
    } else { # hash(model)
        my $_instance = eval "EVE::ESI::Client::Object::$type->new()";
        return $_instance->from_hash($data);
    }
}



__PACKAGE__->class_documentation({description => '200 ok object',
                                  class => 'GetCorporationsCorporationIdOk',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'alliance_id' => {
    	datatype => 'int',
    	base_name => 'alliance_id',
    	description => 'id of alliance that corporation is a member of, if any',
    	format => '',
    	read_only => '',
    		},
    'ceo_id' => {
    	datatype => 'int',
    	base_name => 'ceo_id',
    	description => 'ceo_id integer',
    	format => '',
    	read_only => '',
    		},
    'corporation_description' => {
    	datatype => 'string',
    	base_name => 'corporation_description',
    	description => 'corporation_description string',
    	format => '',
    	read_only => '',
    		},
    'corporation_name' => {
    	datatype => 'string',
    	base_name => 'corporation_name',
    	description => 'the full name of the corporation',
    	format => '',
    	read_only => '',
    		},
    'creation_date' => {
    	datatype => 'DateTime',
    	base_name => 'creation_date',
    	description => 'creation_date string',
    	format => '',
    	read_only => '',
    		},
    'creator_id' => {
    	datatype => 'int',
    	base_name => 'creator_id',
    	description => 'creator_id integer',
    	format => '',
    	read_only => '',
    		},
    'faction' => {
    	datatype => 'string',
    	base_name => 'faction',
    	description => 'faction string',
    	format => '',
    	read_only => '',
    		},
    'member_count' => {
    	datatype => 'int',
    	base_name => 'member_count',
    	description => 'member_count integer',
    	format => '',
    	read_only => '',
    		},
    'tax_rate' => {
    	datatype => 'double',
    	base_name => 'tax_rate',
    	description => 'tax_rate number',
    	format => '',
    	read_only => '',
    		},
    'ticker' => {
    	datatype => 'string',
    	base_name => 'ticker',
    	description => 'the short name of the corporation',
    	format => '',
    	read_only => '',
    		},
    'url' => {
    	datatype => 'string',
    	base_name => 'url',
    	description => 'url string',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'alliance_id' => 'int',
    'ceo_id' => 'int',
    'corporation_description' => 'string',
    'corporation_name' => 'string',
    'creation_date' => 'DateTime',
    'creator_id' => 'int',
    'faction' => 'string',
    'member_count' => 'int',
    'tax_rate' => 'double',
    'ticker' => 'string',
    'url' => 'string'
} );

__PACKAGE__->attribute_map( {
    'alliance_id' => 'alliance_id',
    'ceo_id' => 'ceo_id',
    'corporation_description' => 'corporation_description',
    'corporation_name' => 'corporation_name',
    'creation_date' => 'creation_date',
    'creator_id' => 'creator_id',
    'faction' => 'faction',
    'member_count' => 'member_count',
    'tax_rate' => 'tax_rate',
    'ticker' => 'ticker',
    'url' => 'url'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
