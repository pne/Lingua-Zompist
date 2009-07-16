# vim:set filetype=perl:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 06_buscrifel.t'

#########################

use Test::More tests => 37;
use Carp;

BEGIN { use_ok 'Lingua::Zompist::Barakhinei', 'buscrifel' }

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

form_ok('elir�',  buscrifel('elir�',  1), [ qw( elirka  elirch� elirch� elirku  elirku  elirk�n  ) ]);
form_ok('rikha',  buscrifel('rikha',  2), [ qw( rikhn�  rikhn�  rikhn�  rikhna  rikhnu  rikhn�n  ) ]);
form_ok('lel�',   buscrifel('lel�',   3), [ qw( leln�   leln�   leln�   lelna   lelnu   leln�n   ) ]);
form_ok('b�shti', buscrifel('b�shti', 4), [ qw( b�shtir b�shtir b�shtri b�shtru b�shtru b�shtr�n ) ]);
form_ok('hab�',   buscrifel('hab�',   5), [ qw( habir   habir   habri   habru   habru   habr�n   ) ]);

#form_ok('groch�', izhcrifel('groch�', 1), [ qw( grochi groch� grok   grog�  grog�  groch�n ) ]);
#form_ok('foka',   izhcrifel('foka',   2), [ qw( fochi  fochi  fok�   foku   fok�   foch�n  ) ]);
#form_ok('noch�',  izhcrifel('noch�',  3), [ qw( nochi  nochi  nog�   nogu   nog�   noch�n  ) ]);
#form_ok('faichi', izhcrifel('faichi', 4), [ qw( faichi faich� faok�  faich� faich� faich�n ) ]);
#form_ok('klach�', izhcrifel('klach�', 5), [ qw( klachi klach� klach  klach� klach� klach�n ) ]);

form_ok('eza',  buscrifel('eza'), [ qw( �shka �shk� �shk� �shka �shku �shk�n ) ]);

#form_ok('epeza', izhcrifel('epeza'), [ qw( �zi   �zi   ep� �zu   �z�   �z�n   ) ]);
#form_ok('kedh�', izhcrifel('kedh�'), [ qw( kedhi kedhi ki� kedhu kedh� kedh�n ) ]);

#form_ok('foli',    izhcrifel('foli'   ), [ qw( ful     ful   fut   folu    folu    fol�n    ) ]);
#form_ok('lhib�',   izhcrifel('lhib�'  ), [ qw( lhua    lh�   lhu   lhubu   lhubu   l�n      ) ]);
#form_ok('nh�',     izhcrifel('nh�'    ), [ qw( nhe     ni    ni    nheza   nhezu   nh�      ) ]);
#form_ok('shkriv�', izhcrifel('shkriv�'), [ qw( shkriva shkri shkri shkrivu shkrivu shkriv�n ) ]);
#form_ok('shtan�',  izhcrifel('shtan�' ), [ qw( sht�    sht�  sht�  shtana  shtanu  sht�n    ) ]);
#form_ok('f�li',    izhcrifel('f�li'   ), [ qw( f�l     f�l   f�l   f�lu    f�lu    f�l�n    ) ]);
#form_ok('hizi',    izhcrifel('hizi'   ), [ qw( huz     hu    hut   hizu    hizu    hiz�n    ) ]);
#form_ok('oi',      izhcrifel('oi'     ), [ qw( oh      fi    fit   ou      ou      o�n      ) ]);
