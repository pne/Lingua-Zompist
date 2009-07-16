# vim:set filetype=perl sw=4 et:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use Test::More tests => 72;
use Carp;

use Lingua::Zompist::Verdurian 'part';

sub form_ok {
    croak 'usage: form_ok($verb, $is, $should)' unless @_ >= 3;
    my($verb, $is, $should) = @_;

    is($is->[0], $should->[0], "present participle of $verb");
    is($is->[1], $should->[1], "past participle of $verb");
    is($is->[2], $should->[2], "gerund of $verb");
}

form_ok('lelen', scalar(part('lelen')), [ qw( lelec lelul lel�m ) ]);
form_ok('badhir', scalar(part('badhir')), [ qw( badhec badhul badh�m ) ]);
form_ok('elirec', scalar(part('elirec')), [ qw( elir� elirul elir�m ) ]);

form_ok('esan', scalar(part('esan')), [ qw( esec esul es�m ) ]);

# test the general replacements
form_ok('xxxan', scalar(part('xxxan')), [ qw( xxxec xxxul xxx�m ) ]);
form_ok('xxxen', scalar(part('xxxen')), [ qw( xxxec xxxul xxx�m ) ]);
form_ok('xxxir', scalar(part('xxxir')), [ qw( xxxec xxxul xxx�m ) ]);
form_ok('xxxer', scalar(part('xxxer')), [ qw( xxxec xxxul xxx�m ) ]);
form_ok('xxxec', scalar(part('xxxec')), [ qw( xxx�  xxxul xxx�m ) ]);

form_ok('dan', scalar(part('dan')), [ qw( dec dul d�m ) ]);

TODO: {
    local $TODO = 'kies has no participle yet';

    form_ok('kies', scalar(part('kies')), [ qw( kaivec kaivul kaiv�m ) ]);
}

# I think 'fassec' should conjugate like this:
form_ok('fassec', scalar(part('fassec')), [ qw( fass� fassul fass�m ) ]);


# And now test the list context return by using [ ] to capture the output
form_ok('lelen', [ part('lelen') ], [ qw( lelec lelul lel�m ) ]);
form_ok('badhir', [ part('badhir') ], [ qw( badhec badhul badh�m ) ]);
form_ok('elirec', [ part('elirec') ], [ qw( elir� elirul elir�m ) ]);

form_ok('esan', [ part('esan') ], [ qw( esec esul es�m ) ]);

# test the general replacements
form_ok('xxxan', [ part('xxxan') ], [ qw( xxxec xxxul xxx�m ) ]);
form_ok('xxxen', [ part('xxxen') ], [ qw( xxxec xxxul xxx�m ) ]);
form_ok('xxxir', [ part('xxxir') ], [ qw( xxxec xxxul xxx�m ) ]);
form_ok('xxxer', [ part('xxxer') ], [ qw( xxxec xxxul xxx�m ) ]);
form_ok('xxxec', [ part('xxxec') ], [ qw( xxx�  xxxul xxx�m ) ]);

form_ok('dan', [ part('dan') ], [ qw( dec dul d�m ) ]);
TODO: {
    local $TODO = 'kies has no participle yet';

    form_ok('kies', [ part('kies') ], [ qw( kaivec kaivul kaiv�m ) ]);
}

# I think 'fassec' should conjugate like this:
form_ok('fassec', [ part('fassec') ], [ qw( fass� fassul fass�m ) ]);
