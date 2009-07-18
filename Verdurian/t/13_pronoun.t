# vim:set filetype=perl sw=4 et:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use Test::More tests => 160;
use Carp;

use Lingua::Zompist::Verdurian 'noun';

sub form_ok {
    croak 'usage: form_ok($noun, $is, $should)' unless @_ >= 3;
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

sub sg_form_ok {
    croak 'usage: form_ok($noun, $is, $should)' unless @_ >= 3;
    my($noun, $is, $should) = @_;

    is($is->[0], $should->[0], "nom. of $noun");
    is($is->[1], $should->[1], "gen. of $noun");
    is($is->[2], $should->[2], "acc. of $noun");
    is($is->[3], $should->[3], "dat. of $noun");
}


# Personal pronouns

form_ok('se', noun('se'), [ qw( se es� et sen
                                ta ta� tam tan ) ]);
form_ok('le', noun('le'), [ qw( le l� erh len
                                mu mu� m� mun ) ]);
form_ok('ilu', noun('ilu'), [ qw( ilu li� ilet ilun
                                  ca ca� cam can ) ]);
form_ok('ila', noun('ila'), [ qw( ila liue ilat ilan
                                  ca ca� cam can ) ]);
form_ok('il', noun('il'), [ qw( il li� iler ilon
                                ca ca� cam can ) ]);
form_ok('ze', noun('ze'), [ qw( ze zi� zet zen
                                za za� zam zan ) ]);
sg_form_ok('tu', noun('tu'), [ qw( tu tu� tu/t� tun ) ]);
sg_form_ok('ta', noun('ta'), [ qw( ta ta� tam tan ) ]);
sg_form_ok('mu', noun('mu'), [ qw( mu mu� m�  mun ) ]);
sg_form_ok('ca', noun('ca'), [ qw( ca ca� cam can ) ]);
sg_form_ok('za', noun('za'), [ qw( za za� zam zan ) ]);


# Relative and interrogative pronouns

form_ok('ke', noun('ke'), [ qw( ke k� ket ken
                                ka� ka�ne ka�m ka�n ) ]);
sg_form_ok('kio', noun('kio'), [ qw( kio kiei kiom kion ) ]);
sg_form_ok('eto', noun('eto'), [ qw( eto et� eto eton ) ]);
sg_form_ok('tot', noun('tot'), [ qw( tot tot� tot tot�n ) ]);
sg_form_ok('fsya', noun('fsya'), [ qw( fsya fsye fsya fsyan ) ]);
sg_form_ok('fs�', noun('fs�'), [ qw( fs� fs�i fs� fs�n ) ]);
sg_form_ok('kt�', noun('kt�'), [ qw( kt� kt�i kt� kt�n ) ]);
sg_form_ok('zdesy', noun('zdesy'), [ qw( zdesy zdesii zdesy zdes�n ) ]);
sg_form_ok('cechel', noun('cechel'), [ qw( cechel cechelei cechel cechel�n ) ]);
sg_form_ok('nish', noun('nish'), [ qw( nish nishei nish nish�n ) ]);

# and derived forms of the above

sg_form_ok('ifkio', noun('ifkio'), [ qw( ifkio ifkiei ifkiom ifkion ) ]);
sg_form_ok('nibkio', noun('nibkio'), [ qw( nibkio nibkiei nibkiom nibkion ) ]);
form_ok('nibke', noun('nibke'), [ qw( nibke nibk� nibket nibken
                                      nibka� nibka�ne nibka�m nibka�n ) ]);
form_ok('ifke', noun('ifke'), [ qw( ifke ifk� ifket ifken
                                    ifka� ifka�ne ifka�m ifka�n ) ]);
sg_form_ok('n�cto', noun('n�cto'), [ qw( n�cto n�ct� n�cto n�cton ) ]);
sg_form_ok('nikto', noun('nikto'), [ qw( nikto nikt� nikto nikton ) ]);
sg_form_ok('shto', noun('shto'), [ qw( shto sht� shto shton ) ]);
sg_form_ok('nibc�', noun('nibc�'), [ qw( nibc� nibc�i nibc� nibc�n ) ]);
sg_form_ok('tic�', noun('tic�'), [ qw( tic� tic�i tic� tic�n ) ]);
sg_form_ok('ifc�', noun('ifc�'), [ qw( ifc� ifc�i ifc� ifc�n ) ]);

# fsuda and nikud� don't decline
