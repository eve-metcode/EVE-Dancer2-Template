#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use EVE::Dancer2::DEV;

EVE::Dancer2::DEV->to_app;

use Plack::Builder;

builder {
    enable 'Deflater';
    EVE::Dancer2::DEV->to_app;
}



=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use EVE::Dancer2::DEV;
use Plack::Builder;

builder {
    enable 'Deflater';
    EVE::Dancer2::DEV->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use EVE::Dancer2::DEV;
use EVE::Dancer2::DEV_admin;

builder {
    mount '/'      => EVE::Dancer2::DEV->to_app;
    mount '/admin'      => EVE::Dancer2::DEV_admin->to_app;
}

=end comment

=cut

