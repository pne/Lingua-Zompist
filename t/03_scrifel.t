# vim:set filetype=perl:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 03_scrifel.t'

#########################

use Test::More tests => 81;
use Carp;

BEGIN { use_ok 'Lingua::Zompist::Barakhinei', 'scrifel' }

sub form_ok {
    # croak 'usage: form_ok($verb, $is, $should)' unless @_ >= 3;
    my($verb, $is, $should) = @_;

    is($is->[0], $should->[0], "I.sg. of $verb");
    is($is->[1], $should->[1], "II.sg. of $verb");
    is($is->[2], $should->[2], "III.sg. of $verb");
    is($is->[3], $should->[3], "I.pl. of $verb");
    is($is->[4], $should->[4], "II.pl. of $verb");
    is($is->[5], $should->[5], "III.pl. of $verb");
}

form_ok('elir�',  scrifel('elir�',  1), [ qw( eliri  elir�  elir   elir�  elir�  elir�n  ) ]);
form_ok('rikha',  scrifel('rikha',  2), [ qw( rikhi  rikhi  rikh�  rikhu  rikh�  rikh�n  ) ]);
form_ok('lel�',   scrifel('lel�',   3), [ qw( leli   leli   lel�   lelu   lel�   lel�n   ) ]);
form_ok('b�shti', scrifel('b�shti', 4), [ qw( b�shti b�sht� b�sht� b�sht� b�sht� b�sht�n ) ]);
form_ok('hab�',   scrifel('hab�',   5), [ qw( habi   hab�   hap    hab�   hab�   hab�n   ) ]);

form_ok('groch�', scrifel('groch�', 1), [ qw( grochi groch� grok   grog�  grog�  groch�n ) ]);
form_ok('foka',   scrifel('foka',   2), [ qw( fochi  fochi  fok�   foku   fok�   foch�n  ) ]);
form_ok('noch�',  scrifel('noch�',  3), [ qw( nochi  nochi  nog�   nogu   nog�   noch�n  ) ]);
form_ok('faichi', scrifel('faichi', 4), [ qw( faichi faich� faok�  faich� faich� faich�n ) ]);
form_ok('klach�', scrifel('klach�', 5), [ qw( klachi klach� klach  klach� klach� klach�n ) ]);

form_ok('eza',   scrifel('eza'  ), [ qw( fuch  fuch  f�  fu    fu�   f�n    ) ]);
form_ok('epeza', scrifel('epeza'), [ qw( �zi   �zi   ep� �zu   �z�   �z�n   ) ]);
form_ok('kedh�', scrifel('kedh�'), [ qw( kedhi kedhi ki� kedhu kedh� kedh�n ) ]);

is(scrifel('t�sht�', 1)->[2], 't�ch',  'III.sg of t�sht�');
is(scrifel('rhed�',  1)->[2], 'rhedh', 'III.sg of rhed�' );

#form_ok('foli',    scrifel('foli'   ), [ qw( ful     ful   fut   folu    folu    fol�n    ) ]);
#form_ok('lhib�',   scrifel('lhib�'  ), [ qw( lhua    lh�   lhu   lhubu   lhubu   l�n      ) ]);
#form_ok('nh�',     scrifel('nh�'    ), [ qw( nhe     ni    ni    nheza   nhezu   nh�      ) ]);
#form_ok('shkriv�', scrifel('shkriv�'), [ qw( shkriva shkri shkri shkrivu shkrivu shkriv�n ) ]);
#form_ok('shtan�',  scrifel('shtan�' ), [ qw( sht�    sht�  sht�  shtana  shtanu  sht�n    ) ]);
#form_ok('f�li',    scrifel('f�li'   ), [ qw( f�l     f�l   f�l   f�lu    f�lu    f�l�n    ) ]);
#form_ok('hizi',    scrifel('hizi'   ), [ qw( huz     hu    hut   hizu    hizu    hiz�n    ) ]);
#form_ok('oi',      scrifel('oi'     ), [ qw( oh      fi    fit   ou      ou      o�n      ) ]);
