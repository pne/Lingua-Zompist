# vim:set filetype=perl:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use Test::More tests => 192;
use Carp;

use Lingua::Zompist::Verdurian 'scrifel';

sub form_ok {
    croak 'usage: form_ok($verb, $is, $should)' unless @_ >= 3;
    my($verb, $is, $should) = @_;

    is($is->[0], $should->[0], "I.sg. of $verb");
    is($is->[1], $should->[1], "II.sg. of $verb");
    is($is->[2], $should->[2], "III.sg. of $verb");
    is($is->[3], $should->[3], "I.pl. of $verb");
    is($is->[4], $should->[4], "II.pl. of $verb");
    is($is->[5], $should->[5], "III.pl. of $verb");
}

form_ok('lelen', scrifel('lelen'), [ qw( lelnai lelnei lelne lelnam lelno lelnu ) ]);
form_ok('badhir', scrifel('badhir'), [ qw( badhru badhreu badhre badhrum badhro badhrü ) ]);
form_ok('elirec', scrifel('elirec'), [ qw( elircao elirceo elirce elircom elirco elircu ) ]);

form_ok('ocan', scrifel('ocan'), [ qw( osnai osnei osne osnam osno osnu ) ]);
form_ok('zhechir', scrifel('zhechir'), [ qw( zhedru zhedreu zhedre zhedrum zhedro zhedrü ) ]);
form_ok('cuchec', scrifel('cuchec'), [ qw( cushcao cushceo cushce cushcom cushco cushcu ) ]);
form_ok('lädan', scrifel('lädan'), [ qw( läznai läznei läzne läznam läzno läznu ) ]);
form_ok('legan', scrifel('legan'), [ qw( lezhnai lezhnei lezhne lezhnam lezhno lezhnu ) ]);
form_ok('emec', scrifel('emec'), [ qw( encao enceo ence encom enco encu ) ]);
form_ok('visanir', scrifel('visanir'), [ qw( visandru visandreu visandre visandrum visandro visandrü ) ]);
form_ok('rizir', scrifel('rizir'), [ qw( ridru ridreu ridre ridrum ridro ridrü ) ]);
form_ok('mizec', scrifel('mizec'), [ qw( mizhao mizheo mizhe mizhom mizho mizhu ) ]);
form_ok('meclir', scrifel('meclir'), [ qw( mécliru meclireu méclire méclirum mécliro meclirü ) ]);
form_ok('ivrec', scrifel('ivrec'), [ qw( ivricao ivriceo ívrice ívricom ívrico ívricu ) ]);

form_ok('esan', scrifel('esan'), [ qw( fuai fuei fue/esne fuam fuo fueu/esneu ) ]);

# test the general replacements
form_ok('aaacan', scrifel('aaacan'), [ qw( aaasnai aaasnei aaasne aaasnam aaasno aaasnu ) ]);
form_ok('aaachan', scrifel('aaachan'), [ qw( aaadnai aaadnei aaadne aaadnam aaadno aaadnu ) ]);
# don't confuse with a form of 'dan'
form_ok('aaaden', scrifel('aaaden'), [ qw( aaaznai aaaznei aaazne aaaznam aaazno aaaznu ) ]);
form_ok('aaagan', scrifel('aaagan'), [ qw( aaazhnai aaazhnei aaazhne aaazhnam aaazhno aaazhnu ) ]);

form_ok('aaachir', scrifel('aaachir'), [ qw( aaadru aaadreu aaadre aaadrum aaadro aaadrü ) ]);
form_ok('aaamir', scrifel('aaamir'), [ qw( aaambru aaambreu aaambre aaambrum aaambro aaambrü ) ]);
form_ok('aaanir', scrifel('aaanir'), [ qw( aaandru aaandreu aaandre aaandrum aaandro aaandrü ) ]);
form_ok('aaazir', scrifel('aaazir'), [ qw( aaadru aaadreu aaadre aaadrum aaadro aaadrü ) ]);

form_ok('aaacec', scrifel('aaacec'), [ qw( aaascao aaasceo aaasce aaascom aaasco aaascu ) ]);
form_ok('aaachec', scrifel('aaachec'), [ qw( aaashcao aaashceo aaashce aaashcom aaashco aaashcu ) ]);
form_ok('aaamec', scrifel('aaamec'), [ qw( aaancao aaanceo aaance aaancom aaanco aaancu ) ]);
form_ok('aaasec', scrifel('aaasec'), [ qw( aaashao aaasheo aaashe aaashom aaasho aaashu ) ]);
form_ok('aaazec', scrifel('aaazec'), [ qw( aaazhao aaazheo aaazhe aaazhom aaazho aaazhu ) ]);

form_ok('dan', scrifel('dan'), [ qw( donai donei done donam dono donu ) ]);
form_ok('kies', scrifel('kies'), [ qw( kaivai kaivei kaive kaivam kaivo kaivu ) ]);

# I think 'fassec' should conjugate like this:
form_ok('fassec', scrifel('fassec'), [ qw( fashshao fashsheo fashshe fashshom fashsho fashshu ) ]);
# and 'shushchan' like this:
form_ok('shushchan', scrifel('shushchan'), [ qw( shushdai shushdei shushde shushdam shushdo shushdu ) ]);
