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
package EVE::ESI::Client::Object::GetSovereigntyStructures200Ok;

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
                                  class => 'GetSovereigntyStructures200Ok',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'alliance_id' => {
    	datatype => 'int',
    	base_name => 'alliance_id',
    	description => 'The alliance that owns the structure. ',
    	format => '',
    	read_only => '',
    		},
    'solar_system_id' => {
    	datatype => 'int',
    	base_name => 'solar_system_id',
    	description => 'Solar system in which the structure is located. ',
    	format => '',
    	read_only => '',
    		},
    'structure_id' => {
    	datatype => 'int',
    	base_name => 'structure_id',
    	description => 'Unique item ID for this structure.',
    	format => '',
    	read_only => '',
    		},
    'structure_type_id' => {
    	datatype => 'int',
    	base_name => 'structure_type_id',
    	description => 'A reference to the type of structure this is. ',
    	format => '',
    	read_only => '',
    		},
    'vulnerability_occupancy_level' => {
    	datatype => 'double',
    	base_name => 'vulnerability_occupancy_level',
    	description => 'The occupancy level for the next or current vulnerability window. This takes into account all development indexes and capital system bonuses. Also known as Activity Defense Multiplier from in the client. It increases the time that attackers must spend using their entosis links on the structure. ',
    	format => '',
    	read_only => '',
    		},
    'vulnerable_end_time' => {
    	datatype => 'DateTime',
    	base_name => 'vulnerable_end_time',
    	description => 'The time at which the next or current vulnerability window ends. At the end of a vulnerability window the next window is recalculated and locked in along with the vulnerabilityOccupancyLevel. If the structure is not in 100% entosis control of the defender, it will go in to &#39;overtime&#39; and stay vulnerable for as long as that situation persists. Only once the defenders have 100% entosis control and has the vulnerableEndTime passed does the vulnerability interval expire and a new one is calculated. ',
    	format => '',
    	read_only => '',
    		},
    'vulnerable_start_time' => {
    	datatype => 'DateTime',
    	base_name => 'vulnerable_start_time',
    	description => 'The next time at which the structure will become vulnerable. Or the start time of the current window if current time is between this and vulnerableEndTime. ',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'alliance_id' => 'int',
    'solar_system_id' => 'int',
    'structure_id' => 'int',
    'structure_type_id' => 'int',
    'vulnerability_occupancy_level' => 'double',
    'vulnerable_end_time' => 'DateTime',
    'vulnerable_start_time' => 'DateTime'
} );

__PACKAGE__->attribute_map( {
    'alliance_id' => 'alliance_id',
    'solar_system_id' => 'solar_system_id',
    'structure_id' => 'structure_id',
    'structure_type_id' => 'structure_type_id',
    'vulnerability_occupancy_level' => 'vulnerability_occupancy_level',
    'vulnerable_end_time' => 'vulnerable_end_time',
    'vulnerable_start_time' => 'vulnerable_start_time'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
