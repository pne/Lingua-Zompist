# vim:set filetype=perl sw=4 et:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use Test::More tests => 80;
use Carp;

use Lingua::Zompist::Verdurian 'adj';

sub form_ok {
    croak 'usage: form_ok($adj, $is, $should)' unless @_ >= 3;
    my($adj, $is, $should) = @_;

    is($is->[0][0], $should->[0][0], "masc.nom.sg. of $adj");
    is($is->[0][1], $should->[0][1], "masc.gen.sg. of $adj");
    is($is->[0][2], $should->[0][2], "masc.acc.sg. of $adj");
    is($is->[0][3], $should->[0][3], "masc.dat.sg. of $adj");
    is($is->[0][4], $should->[0][4], "masc.nom.pl. of $adj");
    is($is->[0][5], $should->[0][5], "masc.gen.pl. of $adj");
    is($is->[0][6], $should->[0][6], "masc.acc.pl. of $adj");
    is($is->[0][7], $should->[0][7], "masc.dat.pl. of $adj");
    is($is->[1][0], $should->[1][0], "fem.nom.sg. of $adj");
    is($is->[1][1], $should->[1][1], "fem.gen.sg. of $adj");
    is($is->[1][2], $should->[1][2], "fem.acc.sg. of $adj");
    is($is->[1][3], $should->[1][3], "fem.dat.sg. of $adj");
    is($is->[1][4], $should->[1][4], "fem.nom.pl. of $adj");
    is($is->[1][5], $should->[1][5], "fem.gen.pl. of $adj");
    is($is->[1][6], $should->[1][6], "fem.acc.pl. of $adj");
    is($is->[1][7], $should->[1][7], "fem.dat.pl. of $adj");
}


# No paradigmatic adjective given, so test generic forms

form_ok('ggg', adj('ggg'), [ [ qw( ggg gggei ggg ggg�n
                                   ggg� gggi� gggi gggin ) ],
                             [ qw( ggga ggge ggga gggan
                                   ggg� gggi� gggem gggen ) ] ]);
form_ok('ggge', adj('ggge'), [ [ qw( ggge gggei gggem gggen
                                     ggg� ggge� gggem gggein ) ],
                               [ qw( ggg� ggg�i ggg� gggen
                                     ggg� gggi� gggem gggen ) ] ]);
form_ok('gggy', adj('gggy'), [ [ qw( gggy gggii gggim ggg�n
                                     ggg� gggu� gggom ggguin ) ],
                               [ qw( gggy gggye gggya gggyan
                                     ggg� gggyi� gggyem gggyen ) ] ]);
form_ok('ggg�', adj('ggg�'), [ [ qw( ggg� ggg�i ggg� ggg�n
                                     ggg�i ggg�� ggg�m ggg�in ) ],
                               [ qw( ggga ggge ggga gggan
                                     ggg� gggi� gggem gggen ) ] ]);

# final accent remains on the ending
form_ok('mun�n�', adj('mun�n�'), [ [ qw( mun�n� mun�n�i mun�n� munen�n
                                         mun�n�i mun�n�� munen�m mun�n�in ) ],
                                   [ qw( mun�na mun�ne mun�na mun�nan
                                         mun�n� mun�ni� mun�nem mun�nen ) ] ]);
