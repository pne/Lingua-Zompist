# vim:set filetype=perl:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use Test::More tests => 192;
use Carp;

use Lingua::Zompist::Verdurian 'izhcrifel';

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

form_ok('lelen', izhcrifel('lelen'), [ qw( lelnerai lelnerei lelnere lelneram lelnero lelneru ) ]);
form_ok('badhir', izhcrifel('badhir'), [ qw( badhreu badhreeu badhree badhreum badhreo badhreü ) ]);
form_ok('elirec', izhcrifel('elirec'), [ qw( elircerao elircereo elircere elircerom elircero elirceru ) ]);

form_ok('ocan', izhcrifel('ocan'), [ qw( osnerai osnerei osnere osneram osnero osneru ) ]);
form_ok('zhechir', izhcrifel('zhechir'), [ qw( zhedreu zhedreeu zhedree zhedreum zhedreo zhedreü ) ]);
form_ok('cuchec', izhcrifel('cuchec'), [ qw( cushcerao cushcereo cushcere cushcerom cushcero cushceru ) ]);
form_ok('lädan', izhcrifel('lädan'), [ qw( läznerai läznerei läznere läzneram läznero läzneru ) ]);
form_ok('legan', izhcrifel('legan'), [ qw( lezhnerai lezhnerei lezhnere lezhneram lezhnero lezhneru ) ]);
form_ok('emec', izhcrifel('emec'), [ qw( encerao encereo encere encerom encero enceru ) ]);
form_ok('visanir', izhcrifel('visanir'), [ qw( visandreu visandreeu visandree visandreum visandreo visandreü ) ]);
form_ok('rizir', izhcrifel('rizir'), [ qw( ridreu ridreeu ridree ridreum ridreo ridreü ) ]);
form_ok('mizec', izhcrifel('mizec'), [ qw( mizherao mizhereo mizhere mizherom mizhero mizheru ) ]);
form_ok('meclir', izhcrifel('meclir'), [ qw( meclireu meclireeu mecliree meclireum meclireo meclireü ) ]);
form_ok('ivrec', izhcrifel('ivrec'), [ qw( ivricerao ivricereo ivricere ivricerom ivricero ivriceru ) ]);

form_ok('esan', izhcrifel('esan'), [ qw( esnerai esnerei esnere esneram esnero esneru ) ]);

# test the general replacements
form_ok('aaacan', izhcrifel('aaacan'), [ qw( aaasnerai aaasnerei aaasnere aaasneram aaasnero aaasneru ) ]);
form_ok('aaachan', izhcrifel('aaachan'), [ qw( aaadnerai aaadnerei aaadnere aaadneram aaadnero aaadneru ) ]);
# don't confuse with a form of 'dan'
form_ok('aaaden', izhcrifel('aaaden'), [ qw( aaaznerai aaaznerei aaaznere aaazneram aaaznero aaazneru ) ]);
form_ok('aaagan', izhcrifel('aaagan'), [ qw( aaazhnerai aaazhnerei aaazhnere aaazhneram aaazhnero aaazhneru ) ]);

form_ok('aaachir', izhcrifel('aaachir'), [ qw( aaadreu aaadreeu aaadree aaadreum aaadreo aaadreü ) ]);
form_ok('aaamir', izhcrifel('aaamir'), [ qw( aaambreu aaambreeu aaambree aaambreum aaambreo aaambreü ) ]);
form_ok('aaanir', izhcrifel('aaanir'), [ qw( aaandreu aaandreeu aaandree aaandreum aaandreo aaandreü ) ]);
form_ok('aaazir', izhcrifel('aaazir'), [ qw( aaadreu aaadreeu aaadree aaadreum aaadreo aaadreü ) ]);

form_ok('aaacec', izhcrifel('aaacec'), [ qw( aaascerao aaascereo aaascere aaascerom aaascero aaasceru ) ]);
form_ok('aaachec', izhcrifel('aaachec'), [ qw( aaashcerao aaashcereo aaashcere aaashcerom aaashcero aaashceru ) ]);
form_ok('aaamec', izhcrifel('aaamec'), [ qw( aaancerao aaancereo aaancere aaancerom aaancero aaanceru ) ]);
form_ok('aaasec', izhcrifel('aaasec'), [ qw( aaasherao aaashereo aaashere aaasherom aaashero aaasheru ) ]);
form_ok('aaazec', izhcrifel('aaazec'), [ qw( aaazherao aaazhereo aaazhere aaazherom aaazhero aaazheru ) ]);

form_ok('dan', izhcrifel('dan'), [ qw( donerai donerei donere doneram donero doneru ) ]);
form_ok('kies', izhcrifel('kies'), [ qw( kaiverai kaiverei kaivere kaiveram kaivero kaiveru ) ]);

# I think 'fassec' should conjugate like this:
form_ok('fassec', izhcrifel('fassec'), [ qw( fashsherao fashshereo fashshere fashsherom fashshero fashsheru ) ]);
# and 'shushchan' like this:
form_ok('shushchan', izhcrifel('shushchan'), [ qw( shushderai shushderei shushdere shushderam shushdero shushderu ) ]);
