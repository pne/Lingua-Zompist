# vim:set filetype=perl:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use Test::More tests => 498;
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
form_ok('badhir', scrifel('badhir'), [ qw( badhru badhreu badhre badhrum badhro badhr� ) ]);
form_ok('elirec', scrifel('elirec'), [ qw( elircao elirceo elirce elircom elirco elircu ) ]);

form_ok('ocan', scrifel('ocan'), [ qw( osnai osnei osne osnam osno osnu ) ]);
form_ok('zhechir', scrifel('zhechir'), [ qw( zhedru zhedreu zhedre zhedrum zhedro zhedr� ) ]);
form_ok('cuchec', scrifel('cuchec'), [ qw( cushcao cushceo cushce cushcom cushco cushcu ) ]);
form_ok('l�dan', scrifel('l�dan'), [ qw( l�znai l�znei l�zne l�znam l�zno l�znu ) ]);
form_ok('legan', scrifel('legan'), [ qw( lezhnai lezhnei lezhne lezhnam lezhno lezhnu ) ]);
form_ok('emec', scrifel('emec'), [ qw( encao enceo ence encom enco encu ) ]);
form_ok('visanir', scrifel('visanir'), [ qw( visandru visandreu visandre visandrum visandro visandr� ) ]);
form_ok('rizir', scrifel('rizir'), [ qw( ridru ridreu ridre ridrum ridro ridr� ) ]);
form_ok('mizec', scrifel('mizec'), [ qw( mizhao mizheo mizhe mizhom mizho mizhu ) ]);
form_ok('meclir', scrifel('meclir'), [ qw( m�cliru meclireu m�clire m�clirum m�cliro meclir� ) ]);
form_ok('ivrec', scrifel('ivrec'), [ qw( ivricao ivriceo �vrice �vricom �vrico �vricu ) ]);

form_ok('esan', scrifel('esan'), [ qw( fuai fuei fue/esne fuam fuo fueu/esnu ) ]);

# test the general replacements
form_ok('aaacan', scrifel('aaacan'), [ qw( aaasnai aaasnei aaasne aaasnam aaasno aaasnu ) ]);
form_ok('aaachan', scrifel('aaachan'), [ qw( aaadnai aaadnei aaadne aaadnam aaadno aaadnu ) ]);
# don't confuse with a form of 'dan'
form_ok('aaaden', scrifel('aaaden'), [ qw( aaaznai aaaznei aaazne aaaznam aaazno aaaznu ) ]);
form_ok('aaagan', scrifel('aaagan'), [ qw( aaazhnai aaazhnei aaazhne aaazhnam aaazhno aaazhnu ) ]);

form_ok('aaachir', scrifel('aaachir'), [ qw( aaadru aaadreu aaadre aaadrum aaadro aaadr� ) ]);
form_ok('aaamir', scrifel('aaamir'), [ qw( aaambru aaambreu aaambre aaambrum aaambro aaambr� ) ]);
form_ok('aaanir', scrifel('aaanir'), [ qw( aaandru aaandreu aaandre aaandrum aaandro aaandr� ) ]);
form_ok('aaazir', scrifel('aaazir'), [ qw( aaadru aaadreu aaadre aaadrum aaadro aaadr� ) ]);

form_ok('aaacec', scrifel('aaacec'), [ qw( aaascao aaasceo aaasce aaascom aaasco aaascu ) ]);
form_ok('aaachec', scrifel('aaachec'), [ qw( aaashcao aaashceo aaashce aaashcom aaashco aaashcu ) ]);
form_ok('aaamec', scrifel('aaamec'), [ qw( aaancao aaanceo aaance aaancom aaanco aaancu ) ]);
form_ok('aaasec', scrifel('aaasec'), [ qw( aaashao aaasheo aaashe aaashom aaasho aaashu ) ]);
form_ok('aaazec', scrifel('aaazec'), [ qw( aaazhao aaazheo aaazhe aaazhom aaazho aaazhu ) ]);

# test the unstressed vowel insertion
form_ok('aaaccclan', scrifel('aaaccclan'), [ qw( aaaccclinai aaaccclinei aa�cccline aa�ccclinam aa�ccclino aa�ccclinu ) ]);
form_ok('aaacccran', scrifel('aaacccran'), [ qw( aaacccrinai aaacccrinei aa�cccrine aa�cccrinam aa�cccrino aa�cccrinu ) ]);
form_ok('eeeccclan', scrifel('eeeccclan'), [ qw( eeeccclinai eeeccclinei ee�cccline ee�ccclinam ee�ccclino ee�ccclinu ) ]);
form_ok('eeecccran', scrifel('eeecccran'), [ qw( eeecccrinai eeecccrinei ee�cccrine ee�cccrinam ee�cccrino ee�cccrinu ) ]);
form_ok('iiiccclan', scrifel('iiiccclan'), [ qw( iiiccclinai iiiccclinei ii�cccline ii�ccclinam ii�ccclino ii�ccclinu ) ]);
form_ok('iiicccran', scrifel('iiicccran'), [ qw( iiicccrinai iiicccrinei ii�cccrine ii�cccrinam ii�cccrino ii�cccrinu ) ]);
form_ok('oooccclan', scrifel('oooccclan'), [ qw( oooccclinai oooccclinei oo�cccline oo�ccclinam oo�ccclino oo�ccclinu ) ]);
form_ok('ooocccran', scrifel('ooocccran'), [ qw( ooocccrinai ooocccrinei oo�cccrine oo�cccrinam oo�cccrino oo�cccrinu ) ]);
form_ok('uuuccclan', scrifel('uuuccclan'), [ qw( uuuccclinai uuuccclinei uu�cccline uu�ccclinam uu�ccclino uu�ccclinu ) ]);
form_ok('uuucccran', scrifel('uuucccran'), [ qw( uuucccrinai uuucccrinei uu�cccrine uu�cccrinam uu�cccrino uu�cccrinu ) ]);

form_ok('aaaccclen', scrifel('aaaccclen'), [ qw( aaaccclinai aaaccclinei aa�cccline aa�ccclinam aa�ccclino aa�ccclinu ) ]);
form_ok('aaacccren', scrifel('aaacccren'), [ qw( aaacccrinai aaacccrinei aa�cccrine aa�cccrinam aa�cccrino aa�cccrinu ) ]);
form_ok('eeeccclen', scrifel('eeeccclen'), [ qw( eeeccclinai eeeccclinei ee�cccline ee�ccclinam ee�ccclino ee�ccclinu ) ]);
form_ok('eeecccren', scrifel('eeecccren'), [ qw( eeecccrinai eeecccrinei ee�cccrine ee�cccrinam ee�cccrino ee�cccrinu ) ]);
form_ok('iiiccclen', scrifel('iiiccclen'), [ qw( iiiccclinai iiiccclinei ii�cccline ii�ccclinam ii�ccclino ii�ccclinu ) ]);
form_ok('iiicccren', scrifel('iiicccren'), [ qw( iiicccrinai iiicccrinei ii�cccrine ii�cccrinam ii�cccrino ii�cccrinu ) ]);
form_ok('oooccclen', scrifel('oooccclen'), [ qw( oooccclinai oooccclinei oo�cccline oo�ccclinam oo�ccclino oo�ccclinu ) ]);
form_ok('ooocccren', scrifel('ooocccren'), [ qw( ooocccrinai ooocccrinei oo�cccrine oo�cccrinam oo�cccrino oo�cccrinu ) ]);
form_ok('uuuccclen', scrifel('uuuccclen'), [ qw( uuuccclinai uuuccclinei uu�cccline uu�ccclinam uu�ccclino uu�ccclinu ) ]);
form_ok('uuucccren', scrifel('uuucccren'), [ qw( uuucccrinai uuucccrinei uu�cccrine uu�cccrinam uu�cccrino uu�cccrinu ) ]);

form_ok('aaaccclir', scrifel('aaaccclir'), [ qw( aa�cccliru aaaccclireu aa�ccclire aa�ccclirum aa�cccliro aaaccclir� ) ]);
form_ok('aaacccrir', scrifel('aaacccrir'), [ qw( aa�cccriru aaacccrireu aa�cccrire aa�cccrirum aa�cccriro aaacccrir� ) ]);
form_ok('eeeccclir', scrifel('eeeccclir'), [ qw( ee�cccliru eeeccclireu ee�ccclire ee�ccclirum ee�cccliro eeeccclir� ) ]);
form_ok('eeecccrir', scrifel('eeecccrir'), [ qw( ee�cccriru eeecccrireu ee�cccrire ee�cccrirum ee�cccriro eeecccrir� ) ]);
form_ok('iiiccclir', scrifel('iiiccclir'), [ qw( ii�cccliru iiiccclireu ii�ccclire ii�ccclirum ii�cccliro iiiccclir� ) ]);
form_ok('iiicccrir', scrifel('iiicccrir'), [ qw( ii�cccriru iiicccrireu ii�cccrire ii�cccrirum ii�cccriro iiicccrir� ) ]);
form_ok('oooccclir', scrifel('oooccclir'), [ qw( oo�cccliru oooccclireu oo�ccclire oo�ccclirum oo�cccliro oooccclir� ) ]);
form_ok('ooocccrir', scrifel('ooocccrir'), [ qw( oo�cccriru ooocccrireu oo�cccrire oo�cccrirum oo�cccriro ooocccrir� ) ]);
form_ok('uuuccclir', scrifel('uuuccclir'), [ qw( uu�cccliru uuuccclireu uu�ccclire uu�ccclirum uu�cccliro uuuccclir� ) ]);
form_ok('uuucccrir', scrifel('uuucccrir'), [ qw( uu�cccriru uuucccrireu uu�cccrire uu�cccrirum uu�cccriro uuucccrir� ) ]);

form_ok('aaacccler', scrifel('aaacccler'), [ qw( aa�cccliru aaaccclireu aa�ccclire aa�ccclirum aa�cccliro aaaccclir� ) ]);
form_ok('aaacccrer', scrifel('aaacccrer'), [ qw( aa�cccriru aaacccrireu aa�cccrire aa�cccrirum aa�cccriro aaacccrir� ) ]);
form_ok('eeecccler', scrifel('eeecccler'), [ qw( ee�cccliru eeeccclireu ee�ccclire ee�ccclirum ee�cccliro eeeccclir� ) ]);
form_ok('eeecccrer', scrifel('eeecccrer'), [ qw( ee�cccriru eeecccrireu ee�cccrire ee�cccrirum ee�cccriro eeecccrir� ) ]);
form_ok('iiicccler', scrifel('iiicccler'), [ qw( ii�cccliru iiiccclireu ii�ccclire ii�ccclirum ii�cccliro iiiccclir� ) ]);
form_ok('iiicccrer', scrifel('iiicccrer'), [ qw( ii�cccriru iiicccrireu ii�cccrire ii�cccrirum ii�cccriro iiicccrir� ) ]);
form_ok('ooocccler', scrifel('ooocccler'), [ qw( oo�cccliru oooccclireu oo�ccclire oo�ccclirum oo�cccliro oooccclir� ) ]);
form_ok('ooocccrer', scrifel('ooocccrer'), [ qw( oo�cccriru ooocccrireu oo�cccrire oo�cccrirum oo�cccriro ooocccrir� ) ]);
form_ok('uuucccler', scrifel('uuucccler'), [ qw( uu�cccliru uuuccclireu uu�ccclire uu�ccclirum uu�cccliro uuuccclir� ) ]);
form_ok('uuucccrer', scrifel('uuucccrer'), [ qw( uu�cccriru uuucccrireu uu�cccrire uu�cccrirum uu�cccriro uuucccrir� ) ]);

form_ok('aaaccclec', scrifel('aaaccclec'), [ qw( aaaccclicao aaacccliceo aa�ccclice aa�ccclicom aa�ccclico aa�ccclicu ) ]);
form_ok('aaacccrec', scrifel('aaacccrec'), [ qw( aaacccricao aaacccriceo aa�cccrice aa�cccricom aa�cccrico aa�cccricu ) ]);
form_ok('eeeccclec', scrifel('eeeccclec'), [ qw( eeeccclicao eeecccliceo ee�ccclice ee�ccclicom ee�ccclico ee�ccclicu ) ]);
form_ok('eeecccrec', scrifel('eeecccrec'), [ qw( eeecccricao eeecccriceo ee�cccrice ee�cccricom ee�cccrico ee�cccricu ) ]);
form_ok('iiiccclec', scrifel('iiiccclec'), [ qw( iiiccclicao iiicccliceo ii�ccclice ii�ccclicom ii�ccclico ii�ccclicu ) ]);
form_ok('iiicccrec', scrifel('iiicccrec'), [ qw( iiicccricao iiicccriceo ii�cccrice ii�cccricom ii�cccrico ii�cccricu ) ]);
form_ok('oooccclec', scrifel('oooccclec'), [ qw( oooccclicao ooocccliceo oo�ccclice oo�ccclicom oo�ccclico oo�ccclicu ) ]);
form_ok('ooocccrec', scrifel('ooocccrec'), [ qw( ooocccricao ooocccriceo oo�cccrice oo�cccricom oo�cccrico oo�cccricu ) ]);
form_ok('uuuccclec', scrifel('uuuccclec'), [ qw( uuuccclicao uuucccliceo uu�ccclice uu�ccclicom uu�ccclico uu�ccclicu ) ]);
form_ok('uuucccrec', scrifel('uuucccrec'), [ qw( uuucccricao uuucccriceo uu�cccrice uu�cccricom uu�cccrico uu�cccricu ) ]);


form_ok('dan', scrifel('dan'), [ qw( donai donei done donam dono donu ) ]);
form_ok('kies', scrifel('kies'), [ qw( kaivai kaivei kaive kaivam kaivo kaivu ) ]);

# I think 'fassec' should conjugate like this:
form_ok('fassec', scrifel('fassec'), [ qw( fashshao fashsheo fashshe fashshom fashsho fashshu ) ]);
# and 'shushchan' like this:
form_ok('shushchan', scrifel('shushchan'), [ qw( shushdai shushdei shushde shushdam shushdo shushdu ) ]);

# "numonten" did the wrong thing in the past -- o went to �
form_ok('numonten', scrifel('numonten'), [ qw( numontnai numontnei numontne numontnam numontno numontnu ) ]);
