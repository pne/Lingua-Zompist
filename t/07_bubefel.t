# vim:set filetype=perl:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use Test::More tests => 61;
use Carp;

BEGIN { use_ok 'Lingua::Zompist::Cadhinor', 'bubefel'; }

sub form_ok {
    croak 'usage: form_ok($verb, $is, $should)' unless @_ >= 3;
    my($verb, $is, $should) = @_;

    is($is->[0], undef,        "I.sg. of $verb");
    is($is->[1], $should->[0], "II.sg. of $verb");
    is($is->[2], $should->[1], "III.sg. of $verb");
    is($is->[3], undef,        "I.pl. of $verb");
    is($is->[4], $should->[2], "II.pl. of $verb");
    is($is->[5], $should->[3], "III.pl. of $verb");
}

form_ok('DUMEC',  bubefel('DUMEC' ), [ qw( DUME  DUMUAS  DUMEL  DUMUANT  ) ]);
form_ok('KEKAN',  bubefel('KEKAN' ), [ qw( KEKI  KEKUAT  KEKIL  KEKUANT  ) ]);
form_ok('NOMEN',  bubefel('NOMEN' ), [ qw( NOMI  NOMUAT  NOMIL  NOMUANT  ) ]);
form_ok('CLAGER', bubefel('CLAGER'), [ qw( CLAGU CLAGAS  CLAGUL CLAGANT  ) ]);
form_ok('PARIR',  bubefel('PARIR' ), [ qw( PARU  PARUAT  PARUL  PARUANT  ) ]);

# test general forms
form_ok('GGGEC',  bubefel('GGGEC' ), [ qw( GGGE  GGGUAS  GGGEL  GGGUANT  ) ]);
form_ok('GGGAN',  bubefel('GGGAN' ), [ qw( GGGI  GGGUAT  GGGIL  GGGUANT  ) ]);
form_ok('GGGEN',  bubefel('GGGEN' ), [ qw( GGGI  GGGUAT  GGGIL  GGGUANT  ) ]);
form_ok('GGGER',  bubefel('GGGER' ), [ qw( GGGU  GGGAS   GGGUL  GGGANT   ) ]);
form_ok('GGGIR',  bubefel('GGGIR' ), [ qw( GGGU  GGGUAT  GGGUL  GGGUANT  ) ]);
