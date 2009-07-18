# vim:set filetype=perl sw=4 et:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 09_noun.t'

#########################

use Test::More tests => 367;
use Carp;

BEGIN { use_ok 'Lingua::Zompist::Barakhinei', 'noun' }

sub form_ok ($$$) {
    # croak 'usage: form_ok($noun, $is, $should)' unless @_ >= 3;
    my($noun, $is, $should) = @_;

    is($is->[0], $should->[0], "nom.sg. of $noun");
    is($is->[1], $should->[1], "acc.sg. of $noun");
    is($is->[2], $should->[2], "dat.sg. of $noun");
    is($is->[3], $should->[3], "gen.sg. of $noun");
    is($is->[4], $should->[4], "nom.pl. of $noun");
    is($is->[5], $should->[5], "acc./dat.pl. of $noun");
    is($is->[6], $should->[6], "gen.pl. of $noun");
}

form_ok('eli', noun('eli'), [ qw( eli eli elia elio eliri elir� elirich ) ]);
form_ok('l�nd', noun('l�nd'), [ qw( l�nd l�nd l�nda l�ndo l�ndi l�nd� l�ndich ) ]);
form_ok('�shta', noun('�shta'), [ qw( �shta �sht �shta �shto �sht� �sht� �shtach ) ]);

form_ok('kal', noun('kal'), [ qw( kal kalu kalu kalo kalo kaloi kaloch ) ]);
form_ok('shkor', noun('shkor'), [ qw( shkor shkoru shkoru shkoro shkoru shkor� shkorich ) ]);
form_ok('n�shti', noun('n�shti'), [ qw( n�shti n�shti n�shti n�shtio n�kchu n�kch� n�kchich ) ]);
form_ok('manu', noun('manu'), [ qw( manu man manu mano mani man� manich ) ]);
form_ok('shp�', noun('shp�'), [ qw( shp� shp� shp� shpach shpao shpaoi shpaoch ) ]);

form_ok('chir', noun('chir'), [ qw( chir chira chir� chirach chir� chir�i chirech ) ]);
form_ok('nor', noun('nor'), [ qw( nor nore nor� norech nor� nor�i norech ) ]);
form_ok('medhi', noun('medhi'), [ qw( medhi medhi medhi� medhich medhi� medhia medhiech ) ]);
form_ok('elor�', noun('elor�'), [ qw( elor� elore elor� elorech elori� eloria eloriech ) ]);
form_ok('kabr�', noun('kabr�'), [ qw( kabr� kabra kabr� kabrach kabrach� kabracha kabrachech ) ]);

#is(noun('elor�')->[0], 'elor�',   's.nom. of elor�');
#is(noun('elor�')->[4], 'elorini', 'pl.nom. of elor�');

# Now with explicit gender
form_ok('eli', noun('eli', 'masc'), [ qw( eli eli elia elio eliri elir� elirich ) ]);
form_ok('l�nd', noun('l�nd', 'masc'), [ qw( l�nd l�nd l�nda l�ndo l�ndi l�nd� l�ndich ) ]);
form_ok('�shta', noun('�shta', 'masc'), [ qw( �shta �sht �shta �shto �sht� �sht� �shtach ) ]);

form_ok('kal', noun('kal', 'neut'), [ qw( kal kalu kalu kalo kalo kaloi kaloch ) ]);
form_ok('shkor', noun('shkor', 'neut'), [ qw( shkor shkoru shkoru shkoro shkoru shkor� shkorich ) ]);
form_ok('n�shti', noun('n�shti', 'neut'), [ qw( n�shti n�shti n�shti n�shtio n�kchu n�kch� n�kchich ) ]);
form_ok('manu', noun('manu', 'neut'), [ qw( manu man manu mano mani man� manich ) ]);
form_ok('shp�', noun('shp�', 'neut'), [ qw( shp� shp� shp� shpach shpao shpaoi shpaoch ) ]);

form_ok('chir', noun('chir', 'fem'), [ qw( chir chira chir� chirach chir� chir�i chirech ) ]);
form_ok('nor', noun('nor', 'fem'), [ qw( nor nore nor� norech nor� nor�i norech ) ]);
form_ok('medhi', noun('medhi', 'fem'), [ qw( medhi medhi medhi� medhich medhi� medhia medhiech ) ]);
form_ok('elor�', noun('elor�', 'fem'), [ qw( elor� elore elor� elorech elori� eloria eloriech ) ]);
form_ok('kabr�', noun('kabr�', 'fem'), [ qw( kabr� kabra kabr� kabrach kabrach� kabracha kabrachech ) ]);

#is(noun('elor�', 'masc')->[0], 'elor�',   's.nom. of elor�');
#is(noun('elor�', 'masc')->[4], 'elorini', 'pl.nom. of elor�');

# Now with explicit plural
form_ok('eli', noun('eli', undef, 'eliri'), [ qw( eli eli elia elio eliri elir� elirich ) ]);
form_ok('l�nd', noun('l�nd', undef, 'l�ndi'), [ qw( l�nd l�nd l�nda l�ndo l�ndi l�nd� l�ndich ) ]);
form_ok('�shta', noun('�shta', undef, '�sht�'), [ qw( �shta �sht �shta �shto �sht� �sht� �shtach ) ]);

form_ok('kal', noun('kal', undef, 'kalo'), [ qw( kal kalu kalu kalo kalo kaloi kaloch ) ]);
form_ok('shkor', noun('shkor', undef, 'shkoru'), [ qw( shkor shkoru shkoru shkoro shkoru shkor� shkorich ) ]);
form_ok('n�shti', noun('n�shti', undef, 'n�kchu'), [ qw( n�shti n�shti n�shti n�shtio n�kchu n�kch� n�kchich ) ]);
form_ok('manu', noun('manu', undef, 'mani'), [ qw( manu man manu mano mani man� manich ) ]);
form_ok('shp�', noun('shp�', undef, 'shpao'), [ qw( shp� shp� shp� shpach shpao shpaoi shpaoch ) ]);

form_ok('chir', noun('chir', undef, 'chir�'), [ qw( chir chira chir� chirach chir� chir�i chirech ) ]);
form_ok('nor', noun('nor', undef, 'nor�'), [ qw( nor nore nor� norech nor� nor�i norech ) ]);
form_ok('medhi', noun('medhi', undef, 'medhi�'), [ qw( medhi medhi medhi� medhich medhi� medhia medhiech ) ]);
form_ok('elor�', noun('elor�', undef, 'elori�'), [ qw( elor� elore elor� elorech elori� eloria eloriech ) ]);
form_ok('kabr�', noun('kabr�', undef, 'kabrach�'), [ qw( kabr� kabra kabr� kabrach kabrach� kabracha kabrachech ) ]);

#is(noun('elor�', undef, 'elorini')->[0], 'elor�',   's.nom. of elor�');
#is(noun('elor�', undef, 'elorini')->[4], 'elorini', 'pl.nom. of elor�');

# Now with explicit gender and plural
form_ok('eli', noun('eli', 'masc', 'eliri'), [ qw( eli eli elia elio eliri elir� elirich ) ]);
form_ok('l�nd', noun('l�nd', 'masc', 'l�ndi'), [ qw( l�nd l�nd l�nda l�ndo l�ndi l�nd� l�ndich ) ]);
form_ok('�shta', noun('�shta', 'masc', '�sht�'), [ qw( �shta �sht �shta �shto �sht� �sht� �shtach ) ]);

form_ok('kal', noun('kal', 'neut', 'kalo'), [ qw( kal kalu kalu kalo kalo kaloi kaloch ) ]);
form_ok('shkor', noun('shkor', 'neut', 'shkoru'), [ qw( shkor shkoru shkoru shkoro shkoru shkor� shkorich ) ]);
form_ok('n�shti', noun('n�shti', 'neut', 'n�kchu'), [ qw( n�shti n�shti n�shti n�shtio n�kchu n�kch� n�kchich ) ]);
form_ok('manu', noun('manu', 'neut', 'mani'), [ qw( manu man manu mano mani man� manich ) ]);
form_ok('shp�', noun('shp�', 'neut', 'shpao'), [ qw( shp� shp� shp� shpach shpao shpaoi shpaoch ) ]);

form_ok('chir', noun('chir', 'fem', 'chir�'), [ qw( chir chira chir� chirach chir� chir�i chirech ) ]);
form_ok('nor', noun('nor', 'fem', 'nor�'), [ qw( nor nore nor� norech nor� nor�i norech ) ]);
form_ok('medhi', noun('medhi', 'fem', 'medhi�'), [ qw( medhi medhi medhi� medhich medhi� medhia medhiech ) ]);
form_ok('elor�', noun('elor�', 'fem', 'elori�'), [ qw( elor� elore elor� elorech elori� eloria eloriech ) ]);
form_ok('kabr�', noun('kabr�', 'fem', 'kabrach�'), [ qw( kabr� kabra kabr� kabrach kabrach� kabracha kabrachech ) ]);

is(noun('elor�', 'masc', 'elorini')->[0], 'elor�',   's.nom. of elor�');
is(noun('elor�', 'masc', 'elorini')->[4], 'elorini', 'pl.nom. of elor�');
