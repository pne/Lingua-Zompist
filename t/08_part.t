# vim:set filetype=perl sw=4 et:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 08_part.t'

#########################

use Test::More tests => 21;
use Carp;

BEGIN { use_ok 'Lingua::Zompist::Barakhinei', 'part' }

sub form_ok {
    # croak 'usage: form_ok($verb, $is, $should)' unless @_ >= 3;
    my($verb, $is, $should) = @_;

    is($is->[0], $should->[0], "present participle of $verb");
    is($is->[1], $should->[1], "past participle of $verb");
}

form_ok('elir�',  scalar(part('elir�',  1)), [ qw( eliril elir�l ) ]);
form_ok('rikha',  scalar(part('rikha',  2)), [ qw( rikh�  rikhu  ) ]);
form_ok('lel�',   scalar(part('lel�',   3)), [ qw( lel�   lelu   ) ]);
form_ok('b�shti', scalar(part('b�shti', 4)), [ qw( b�shti b�kchu ) ]);
form_ok('hab�',   scalar(part('hab�',   5)), [ qw( hab�   hab�l  ) ]);

# And now test the list context return by using [ ] to capture the output
form_ok('elir�',  [ part('elir�',  1) ], [ qw( eliril elir�l ) ]);
form_ok('rikha',  [ part('rikha',  2) ], [ qw( rikh�  rikhu  ) ]);
form_ok('lel�',   [ part('lel�',   3) ], [ qw( lel�   lelu   ) ]);
form_ok('b�shti', [ part('b�shti', 4) ], [ qw( b�shti b�kchu ) ]);
form_ok('hab�',   [ part('hab�',   5) ], [ qw( hab�   hab�l  ) ]);
