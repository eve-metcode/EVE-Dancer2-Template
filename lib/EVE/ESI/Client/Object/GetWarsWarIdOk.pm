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
package EVE::ESI::Client::Object::GetWarsWarIdOk;

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
                                  class => 'GetWarsWarIdOk',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'aggressor' => {
    	datatype => 'GetWarsWarIdAggressor',
    	base_name => 'aggressor',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'allies' => {
    	datatype => 'ARRAY[GetWarsWarIdAlly]',
    	base_name => 'allies',
    	description => 'allied corporations or alliances, each object contains either corporation_id or alliance_id',
    	format => '',
    	read_only => '',
    		},
    'declared' => {
    	datatype => 'DateTime',
    	base_name => 'declared',
    	description => 'Time that the war was declared',
    	format => '',
    	read_only => '',
    		},
    'defender' => {
    	datatype => 'GetWarsWarIdDefender',
    	base_name => 'defender',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'finished' => {
    	datatype => 'DateTime',
    	base_name => 'finished',
    	description => 'Time the war ended and shooting was no longer allowed',
    	format => '',
    	read_only => '',
    		},
    'id' => {
    	datatype => 'int',
    	base_name => 'id',
    	description => 'ID of the specified war',
    	format => '',
    	read_only => '',
    		},
    'mutual' => {
    	datatype => 'boolean',
    	base_name => 'mutual',
    	description => 'Was the war declared mutual by both parties',
    	format => '',
    	read_only => '',
    		},
    'open_for_allies' => {
    	datatype => 'boolean',
    	base_name => 'open_for_allies',
    	description => 'Is the war currently open for allies or not',
    	format => '',
    	read_only => '',
    		},
    'retracted' => {
    	datatype => 'DateTime',
    	base_name => 'retracted',
    	description => 'Time the war was retracted but both sides could still shoot each other',
    	format => '',
    	read_only => '',
    		},
    'started' => {
    	datatype => 'DateTime',
    	base_name => 'started',
    	description => 'Time when the war started and both sides could shoot each other',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'aggressor' => 'GetWarsWarIdAggressor',
    'allies' => 'ARRAY[GetWarsWarIdAlly]',
    'declared' => 'DateTime',
    'defender' => 'GetWarsWarIdDefender',
    'finished' => 'DateTime',
    'id' => 'int',
    'mutual' => 'boolean',
    'open_for_allies' => 'boolean',
    'retracted' => 'DateTime',
    'started' => 'DateTime'
} );

__PACKAGE__->attribute_map( {
    'aggressor' => 'aggressor',
    'allies' => 'allies',
    'declared' => 'declared',
    'defender' => 'defender',
    'finished' => 'finished',
    'id' => 'id',
    'mutual' => 'mutual',
    'open_for_allies' => 'open_for_allies',
    'retracted' => 'retracted',
    'started' => 'started'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;