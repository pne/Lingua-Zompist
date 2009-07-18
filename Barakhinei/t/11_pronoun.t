# vim:set filetype=perl sw=4 et:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 11_pronoun.t'

#########################

use Test::More tests => 56;
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

sub sg_form_ok {
    # croak 'usage: form_ok($noun, $is, $should)' unless @_ >= 3;
    my($noun, $is, $should) = @_;

    is($is->[0], $should->[0], "nom. of $noun");
    is($is->[1], $should->[1], "acc. of $noun");
    is($is->[2], $should->[2], "dat. of $noun");
    is($is->[3], $should->[3], "gen. of $noun");
}


# Personal pronouns

form_ok('s�',  noun('s�' ), [ qw( s�  s�th s�  (eri)  ta   t� (tand�) ) ]);
form_ok('l�',  noun('l�' ), [ qw( l�  �k   l�  (leri) mukh m� (mund�) ) ]);
form_ok('�t',  noun('�t' ), [ qw( �t  �t�  �ta  �ti   k�   k� (kand�) ) ]);
form_ok('tot', noun('tot'), [ qw( tot t�   tota toti  k�   k� (kand�) ) ]);
form_ok('z�',  noun('z�' ), [ '', qw( z�th zeu zei ), '', qw( zaa zai ) ]);
sg_form_ok('ta',   noun('ta'  ), [ qw( ta   t�   tao (tand�) ) ]);
sg_form_ok('mukh', noun('mukh'), [ qw( mukh m�   m�  (mund�) ) ]);
sg_form_ok('k�',   noun('k�'  ), [ qw( k�   k�   k�  (kand�) ) ]);
sg_form_ok('k�t',  noun('k�t' ), [ qw( k�t  k�t� k�ta k�ti   ) ]);
sg_form_ok('za',   noun('za'  ), [ '', qw( zaa zau zai ) ]);
