use strict;
use warnings;
use Test::More tests => 1;

BEGIN {
    $ENV{ANSI_COLORS_DISABLED} = 1;
    delete $ENV{DATAPRINTERRC};
    use File::HomeDir::Test;  # avoid user's .dataprinter
};

use Data::Printer filters => {
    -external => [ 'ClassicRegex' ],
};

my $regex = qr/foo.*bar/i;
is(
    p($regex),
   '\\ qr/foo.*bar/i',
   'regex filter looks good'
);
