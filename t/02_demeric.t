# vim:set filetype=perl:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 02_demeric.t'

#########################

use Test::More tests => 134;
use Carp;

BEGIN { use_ok 'Lingua::Zompist::Barakhinei', 'demeric' }

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

form_ok('elir�',  demeric('elir�',  1), [ qw( elira elir�  elir�  eliru  eliru  elir�n  ) ]);
form_ok('rikha',  demeric('rikha',  2), [ qw( rikh� rikh�  rikh�  rikha  rikhu  rikh�n  ) ]);
form_ok('lel�',   demeric('lel�',   3), [ qw( lel�  lel�   lel�   lela   lelu   lel�n   ) ]);
form_ok('b�shti', demeric('b�shti', 4), [ qw( b�ch  b�sht� b�shti b�kchu b�kchu b�sht�n ) ]);
form_ok('hab�',   demeric('hab�',   5), [ qw( hap   hab�   hab�   habu   habu   habun   ) ]);

form_ok('groch�', demeric('groch�', 1), [ qw( groga groch� groch� grogu  grogu  grog�n  ) ]);
form_ok('foka',   demeric('foka',   2), [ qw( fok�  foch�  foch�  foka   foku   fok�n   ) ]);
form_ok('noch�',  demeric('noch�',  3), [ qw( nog�  noch�  noch�  nocha  nochu  noch�n  ) ]);
form_ok('faichi', demeric('faichi', 4), [ qw( faok  faoch� faichi faoku  faoku  faich�n ) ]);
form_ok('klach�', demeric('klach�', 5), [ qw( klak  klach� klach� klagu  klagu  klagun  ) ]);

form_ok('eza',     demeric('eza'    ), [ qw( s�      s�    �     eza     ezu     s�n      ) ]);
form_ok('epeza',   demeric('epeza'  ), [ qw( �z�     �z�   ep�   epeza   epezu   �z�n     ) ]);
form_ok('foli',    demeric('foli'   ), [ qw( ful     ful   fut   folu    folu    fol�n    ) ]);
form_ok('lhib�',   demeric('lhib�'  ), [ qw( lhua    lh�   lhu   lhubu   lhubu   l�n      ) ]);
form_ok('kedh�',   demeric('kedh�'  ), [ qw( kedh�   kedh� kedhu kedha   kedhu   k�n      ) ]);
form_ok('nh�',     demeric('nh�'    ), [ qw( nhe     ni    ni    nheza   nhezu   nh�n     ) ]);
form_ok('shkriv�', demeric('shkriv�'), [ qw( shkriva shkri shkri shkrivu shkrivu shkriv�n ) ]);
form_ok('shtan�',  demeric('shtan�' ), [ qw( sht�    sht�  sht�  shtana  shtanu  sht�n    ) ]);
form_ok('f�li',    demeric('f�li'   ), [ qw( f�l     f�l   f�l   f�lu    f�lu    f�l�n    ) ]);
form_ok('hizi',    demeric('hizi'   ), [ qw( huz     hu    hut   hizu    hizu    hiz�n    ) ]);
form_ok('oi',      demeric('oi'     ), [ qw( oh      fi    fit   ou      ou      o�n      ) ]);

is(demeric('chura', 2)->[1], 'chir�', 'II.sg of chura');
form_ok('sid�', demeric('sid�', 5), [ qw( sidh sid� sid� sidhu sidhu sidhun ) ]);
