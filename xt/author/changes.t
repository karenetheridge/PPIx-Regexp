package main;

use 5.010;

use strict;
use warnings;

use Test::More 0.88;	# Because of done_testing();

BEGIN {
    eval {
	require Test::CPAN::Changes;
	Test::CPAN::Changes->import();
	1;
    } or do {
	plan	skip_all => 'Unable to load Test::CPAN::Changes';
	exit;
    };
}

changes_ok();

1;

# ex: set textwidth=72 :
