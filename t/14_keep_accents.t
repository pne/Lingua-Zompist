# vim:set filetype=perl sw=4 et:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 14.t'

#########################

use Test::More tests => 290;
use Carp;

BEGIN {use_ok 'Lingua::Zompist::Verdurian', 'noun', 'adj'; }

sub noun_form_ok {
    croak 'usage: noun_form_ok($noun, $is, $should)' unless @_ == 3;
    my($noun, $is, $should) = @_;

    is($is->[0], $should->[0], "nom.sg. of $noun");
    is($is->[1], $should->[1], "gen.sg. of $noun");
    is($is->[2], $should->[2], "acc.sg. of $noun");
    is($is->[3], $should->[3], "dat.sg. of $noun");
    is($is->[4], $should->[4], "nom.pl. of $noun");
    is($is->[5], $should->[5], "gen.pl. of $noun");
    is($is->[6], $should->[6], "acc.pl. of $noun");
    is($is->[7], $should->[7], "dat.pl. of $noun");
}

sub adj_form_ok {
    croak 'usage: adj_form_ok($adj, $is, $should)' unless @_ == 3;
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

# Test default (should be on)

is($Lingua::Zompist::Verdurian::keep_accents, 1, 'keep_accents == 1');

noun_form_ok('lav�sia', noun('lav�sia'), [ qw( lav�sia lav�s� lav�siam lav�sian
                                               lav�si� lav�si� lav�sem lav�sen ) ]);
noun_form_ok('bars�c', noun('bars�c'), [ qw( bars�c bars�cei bars�c barsuc�n
                                             bars�s� bars�si� bars�si bars�sin ) ]);
noun_form_ok('ecel�g', noun('ecel�g'), [ qw( ecel�g ecel�gei ecel�g ecelog�n
                                             ecel�zhi ecel�zhi� ecel�zhi ecel�zhin ) ]);
noun_form_ok('etal�g', noun('etal�g'), [ qw( etal�g etal�gei etal�g etalog�n
                                             etal�zhi etal�zhi� etal�zhi etal�zhin ) ]);
noun_form_ok('p�', noun('p�'), [ qw( p� p�i p� p�n p� pi� p�m p�n ) ]);
noun_form_ok('akn�', noun('akn�'), [ qw( akn� akn�i akn�m akn�n
                                         akn�i akno� akn�m akn�in ) ]);
noun_form_ok('ggg�', noun('ggg�'), [ qw( ggg� ggg�i ggg�m ggg�n
                                         ggg�i gggo� ggg�m ggg�in ) ]);
noun_form_ok('ggg�', noun('ggg�'), [ qw( ggg� ggg�i ggg�m ggg�n
                                         ggg� gggu� ggg�m ggg�in ) ]);
noun_form_ok('ggg�y', noun('ggg�y'), [ qw( ggg�y ggg�i ggg�im gggi�n
                                           ggg�� ggg�� ggg�om ggg�uin ) ]);
noun_form_ok('ggg�', noun('ggg�'), [ qw( ggg� ggg�i ggg� ggg�n
                                         ggg� gggi� ggg�m ggg�n ) ]);
adj_form_ok('mun�n�', adj('mun�n�'), [ [ qw( mun�n� mun�n�i mun�n� munen�n
                                             mun�n�i mun�n�� munen�m mun�n�in ) ],
                                       [ qw( mun�na mun�ne mun�na mun�nan
                                             mun�n� mun�ni� mun�nem mun�nen ) ] ]);


# explicit keep on

$Lingua::Zompist::Verdurian::keep_accents = 1;

noun_form_ok('lav�sia', noun('lav�sia'), [ qw( lav�sia lav�s� lav�siam lav�sian
                                               lav�si� lav�si� lav�sem lav�sen ) ]);
noun_form_ok('bars�c', noun('bars�c'), [ qw( bars�c bars�cei bars�c barsuc�n
                                             bars�s� bars�si� bars�si bars�sin ) ]);
noun_form_ok('ecel�g', noun('ecel�g'), [ qw( ecel�g ecel�gei ecel�g ecelog�n
                                             ecel�zhi ecel�zhi� ecel�zhi ecel�zhin ) ]);
noun_form_ok('etal�g', noun('etal�g'), [ qw( etal�g etal�gei etal�g etalog�n
                                             etal�zhi etal�zhi� etal�zhi etal�zhin ) ]);
noun_form_ok('p�', noun('p�'), [ qw( p� p�i p� p�n p� pi� p�m p�n ) ]);
noun_form_ok('akn�', noun('akn�'), [ qw( akn� akn�i akn�m akn�n
                                         akn�i akno� akn�m akn�in ) ]);
noun_form_ok('ggg�', noun('ggg�'), [ qw( ggg� ggg�i ggg�m ggg�n
                                         ggg�i gggo� ggg�m ggg�in ) ]);
noun_form_ok('ggg�', noun('ggg�'), [ qw( ggg� ggg�i ggg�m ggg�n
                                         ggg� gggu� ggg�m ggg�in ) ]);
noun_form_ok('ggg�y', noun('ggg�y'), [ qw( ggg�y ggg�i ggg�im gggi�n
                                           ggg�� ggg�� ggg�om ggg�uin ) ]);
noun_form_ok('ggg�', noun('ggg�'), [ qw( ggg� ggg�i ggg� ggg�n
                                         ggg� gggi� ggg�m ggg�n ) ]);
adj_form_ok('mun�n�', adj('mun�n�'), [ [ qw( mun�n� mun�n�i mun�n� munen�n
                                             mun�n�i mun�n�� munen�m mun�n�in ) ],
                                       [ qw( mun�na mun�ne mun�na mun�nan
                                             mun�n� mun�ni� mun�nem mun�nen ) ] ]);

# explicit keep off

$Lingua::Zompist::Verdurian::keep_accents = 0;

noun_form_ok('lav�sia', noun('lav�sia'), [ qw( lav�sia lav�s� lav�siam lav�sian
                                               lav�si� lav�si� lavisem lavisen ) ]);
noun_form_ok('bars�c', noun('bars�c'), [ qw( bars�c bars�cei bars�c barsuc�n
                                             barsus� bars�si� barsusi barsusin ) ]);
noun_form_ok('ecel�g', noun('ecel�g'), [ qw( ecel�g ecel�gei ecel�g ecelog�n
                                             ecelozhi ecel�zhi� ecelozhi ecelozhin ) ]);
noun_form_ok('etal�g', noun('etal�g'), [ qw( etal�g etal�gei etal�g etalog�n
                                             etalozhi etal�zhi� etalozhi etalozhin ) ]);
noun_form_ok('p�', noun('p�'), [ qw( p� pei p� p�n p� pi� p�m p�n ) ]);
noun_form_ok('akn�', noun('akn�'), [ qw( akn� aknei akn�m akn�n
                                         aknoi akno� akn�m aknoin ) ]);
noun_form_ok('ggg�', noun('ggg�'), [ qw( ggg� gggei ggg�m ggg�n
                                         gggoi gggo� ggg�m gggoin ) ]);
noun_form_ok('ggg�', noun('ggg�'), [ qw( ggg� gggui ggg�m ggg�n
                                         ggg� gggu� ggg�m ggguin ) ]);
noun_form_ok('ggg�y', noun('ggg�y'), [ qw( ggg�y gggii gggiim gggi�n
                                           gggi� ggg�� gggiom ggg�uin ) ]);
noun_form_ok('ggg�', noun('ggg�'), [ qw( ggg� gggei ggg� ggg�n
                                         ggg� gggi� ggg�m ggg�n ) ]);
adj_form_ok('mun�n�', adj('mun�n�'), [ [ qw( mun�n� mun�n�i mun�n� munen�n
                                             mun�n�i mun�n�� munen�m mun�n�in ) ],
                                       [ qw( munena munene munena munenan
                                             munen� mun�ni� munenem munenen ) ] ]);
