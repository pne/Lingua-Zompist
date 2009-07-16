# vim:set filetype=perl sw=4 et:
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use Test::More tests => 664;
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

form_ok('redh', noun('redh'), [ qw( redh redhei redh redh�n
                                    redh� redhi� redhi redhin ) ]);
form_ok('dasco', noun('dasco'), [ qw( dasco dascei dascam dascon
                                      dascoi dasco� dascom dascoin ) ]);
form_ok('dalu', noun('dalu'), [ qw( dalu dalui dalum dalun
                                    dal� dalu� dalom daluin ) ]);
form_ok('katy', noun('katy'), [ qw( katy katii katim kat�n
                                    kat� katu� katom katuin ) ]);
form_ok('ciy', noun('ciy'), [ qw( ciy cii ciim ci�n
                                    ci� ci� ciom ciuin ) ]);
form_ok('esta', noun('esta'), [ qw( esta estei esta estan
                                    estai esta� estam estain ) ]);

form_ok('rana', noun('rana'), [ qw( rana rane rana ranan
                                    ran� rani� ranem ranen ) ]);
form_ok('lav�sia', noun('lav�sia'), [ qw( lav�sia lav�s� lav�siam lav�sian
                                          lav�si� lav�si� lavisem lavisen ) ]);
form_ok('casi', noun('casi'), [ qw( casi cas� casa casin
                                    cas� casi� casem casin ) ]);
form_ok('leve', noun('leve'), [ qw( leve levei leva leven
                                    lev� levi� levem leven ) ]);
form_ok('gur�', noun('gur�'), [ qw( gur� gur�i gur� guren
                                    gur� guri� gurem guren ) ]);

# final accent remains on the ending
form_ok('akn�', noun('akn�'), [ qw( akn� aknei akn�m akn�n
                                    aknoi akno� akn�m aknoin ) ]);
form_ok('pis�', noun('pis�'), [ qw( pis� pis� pis� pis�n
                                    pis� pisi� pis�m pis�n ) ]);

# irregular plural stem
# First those from morphology.htm (as of 2001-10-22)
form_ok('br�ca', noun('br�ca'), [ qw( br�ca br�ce br�ca br�can
                                      br�s� br�si� br�sem br�sen ) ]);
form_ok('kud', noun('kud'), [ qw( kud kudei kud kud�n
                                  kuz� kuzi� kuzi kuzin ) ]);
form_ok('log', noun('log'), [ qw( log logei log log�n
                                  lozhi lozhi� lozhi lozhin ) ]);
form_ok('rhit', noun('rhit'), [ qw( rhit rhitei rhit rhit�n
                                    rhichi rhichi� rhichi rhichin ) ]);
form_ok('verat', noun('verat'), [ qw( verat veratei verat verat�n
                                      veradhi veradhi� veradhi veradhin ) ]);

# Now those from the source code
# (These are derived from the dictionary)
# Some checks might be made twice; oh well :)
form_ok('aklog', noun('aklog'), [ qw( aklog aklogei aklog aklog�n
                                      aklozhi aklozhi� aklozhi aklozhin ) ]);
form_ok('�nselcud', noun('�nselcud'), [ qw( �nselcud �nselcudei �nselcud anselcud�n
                                            �nselcuz� �nselcuzi� �nselcuzi �nselcuzin ) ]);
form_ok('bars�c', noun('bars�c'), [ qw( bars�c bars�cei bars�c barsuc�n
                                        barsus� bars�si� barsusi barsusin ) ]);
form_ok('belac', noun('belac'), [ qw( belac belacei belac belac�n
                                      belas� belasi� belasi belasin ) ]);
form_ok('boc', noun('boc'), [ qw( boc bocei boc boc�n
                                  bos� bosi� bosi bosin ) ]);
form_ok('br�ca', noun('br�ca'), [ qw( br�ca br�ce br�ca br�can
                                      br�s� br�si� br�sem br�sen ) ]);
form_ok('b�t', noun('b�t'), [ qw( b�t b�tei b�t b�t�n
                                  b�s� b�si� b�si b�sin ) ]);
form_ok('chedesnaga', noun('chedesnaga'), [ qw( chedesnaga chedesnage chedesnaga chedesnagan
                                                chedesnazhi chedesnazhi� chedesnazhem chedesnazhen ) ]);
form_ok('chuca', noun('chuca'), [ qw( chuca chuce chuca chucan
                                      chus� chusi� chusem chusen ) ]);
form_ok('dosic', noun('dosic'), [ qw( dosic dosicei dosic dosic�n
                                      dosis� dosisi� dosisi dosisin ) ]);
form_ok('drac', noun('drac'), [ qw( drac dracei drac drac�n
                                    dras� drasi� drasi drasin ) ]);
form_ok('dushic', noun('dushic'), [ qw( dushic dushicei dushic dushic�n
                                        dushis� dushisi� dushisi dushisin ) ]);
form_ok('dhac', noun('dhac'), [ qw( dhac dhacei dhac dhac�n
                                    dhas� dhasi� dhasi dhasin ) ]);
form_ok('dhiec', noun('dhiec'), [ qw( dhiec dhiecei dhiec dhiec�n
                                      dhies� dhiesi� dhiesi dhiesin ) ]);
form_ok('ecel�g', noun('ecel�g'), [ qw( ecel�g ecel�gei ecel�g ecelog�n
                                        ecelozhi ecel�zhi� ecelozhi ecelozhin ) ]);
form_ok('etal�g', noun('etal�g'), [ qw( etal�g etal�gei etal�g etalog�n
                                        etalozhi etal�zhi� etalozhi etalozhin ) ]);
form_ok('ferica', noun('ferica'), [ qw( ferica ferice ferica ferican
                                        feris� ferisi� ferisem ferisen ) ]);
form_ok('fifachic', noun('fifachic'), [ qw( fifachic fifachicei fifachic fifachic�n
                                            fifachis� fifachisi� fifachisi fifachisin ) ]);
form_ok('formica', noun('formica'), [ qw( formica formice formica formican
                                          formis� formisi� formisem formisen ) ]);
form_ok('gl�ca', noun('gl�ca'), [ qw( gl�ca gl�ce gl�ca gl�can
                                      gl�s� gl�si� gl�sem gl�sen ) ]);
form_ok('gorat', noun('gorat'), [ qw( gorat goratei gorat gorat�n
                                      goradhi goradhi� goradhi goradhin ) ]);
form_ok('grak', noun('grak'), [ qw( grak grakei grak grak�n
                                    grah� grahi� grahi grahin ) ]);
form_ok('gut', noun('gut'), [ qw( gut gutei gut gut�n
                                  gudhi gudhi� gudhi gudhin ) ]);
form_ok('huca', noun('huca'), [ qw( huca huce huca hucan
                                    hus� husi� husem husen ) ]);
form_ok('kt�log', noun('kt�log'), [ qw( kt�log kt�logei kt�log kt�log�n
                                        kt�lozhi kt�lozhi� kt�lozhi kt�lozhin ) ]);
form_ok('kud', noun('kud'), [ qw( kud kudei kud kud�n
                                  kuz� kuzi� kuzi kuzin ) ]);
form_ok('lertlog', noun('lertlog'), [ qw( lertlog lertlogei lertlog lertlog�n
                                          lertlozhi lertlozhi� lertlozhi lertlozhin ) ]);
form_ok('log', noun('log'), [ qw( log logei log log�n
                                  lozhi lozhi� lozhi lozhin ) ]);
form_ok('matica', noun('matica'), [ qw( matica matice matica matican
                                        matis� matisi� matisem matisen ) ]);
form_ok('meca', noun('meca'), [ qw( meca mece meca mecan
                                    mes� mesi� mesem mesen ) ]);
form_ok('mevlog', noun('mevlog'), [ qw( mevlog mevlogei mevlog mevlog�n
                                        mevlozhi mevlozhi� mevlozhi mevlozhin ) ]);
form_ok('morut', noun('morut'), [ qw( morut morutei morut morut�n
                                      morudhi morudhi� morudhi morudhin ) ]);
form_ok('naga', noun('naga'), [ qw( naga nage naga nagan
                                    nazhi nazhi� nazhem nazhen ) ]);
form_ok('nid', noun('nid'), [ qw( nid nidei nid nid�n
                                  niz� nizi� nizi nizin ) ]);
form_ok('pag', noun('pag'), [ qw( pag pagei pag pag�n
                                  pazhi pazhi� pazhi pazhin ) ]);
form_ok('prolog', noun('prolog'), [ qw( prolog prologei prolog prolog�n
                                        prolozhi prolozhi� prolozhi prolozhin ) ]);
form_ok('rak', noun('rak'), [ qw( rak rakei rak rak�n
                                  rah� rahi� rahi rahin ) ]);
form_ok('rog', noun('rog'), [ qw( rog rogei rog rog�n
                                  rozhi rozhi� rozhi rozhin ) ]);
form_ok('rhit', noun('rhit'), [ qw( rhit rhitei rhit rhit�n
                                    rhichi rhichi� rhichi rhichin ) ]);
form_ok('sfica', noun('sfica'), [ qw( sfica sfice sfica sfican
                                      sfis� sfisi� sfisem sfisen ) ]);
form_ok('shank', noun('shank'), [ qw( shank shankei shank shank�n
                                      shanh� shanhi� shanhi shanhin ) ]);
form_ok('smeric', noun('smeric'), [ qw( smeric smericei smeric smeric�n
                                        smeris� smerisi� smerisi smerisin ) ]);
form_ok('verat', noun('verat'), [ qw( verat veratei verat verat�n
                                      veradhi veradhi� veradhi veradhin ) ]);
form_ok('yag', noun('yag'), [ qw( yag yagei yag yag�n
                                  yazhi yazhi� yazhi yazhin ) ]);

# Test generic conjugation
form_ok('ggg', noun('ggg'), [ qw( ggg gggei ggg ggg�n
                                  ggg� gggi� gggi gggin ) ]);
form_ok('gggia', noun('gggia'), [ qw( gggia ggg� gggiam gggian
                                      gggi� gggi� gggem gggen ) ]);
form_ok('ggga', noun('ggga'), [ qw( ggga ggge ggga gggan
                                    ggg� gggi� gggem gggen ) ]);
form_ok('ggg�', noun('ggg�'), [ qw( ggg� ggg� ggg� ggg�n
                                    ggg� gggi� ggg�m ggg�n ) ]);
form_ok('gggo', noun('gggo'), [ qw( gggo gggei gggam gggon
                                    gggoi gggo� gggom gggoin ) ]);
form_ok('ggg�', noun('ggg�'), [ qw( ggg� gggei ggg�m ggg�n
                                    gggoi gggo� ggg�m gggoin ) ]);
form_ok('gggu', noun('gggu'), [ qw( gggu gggui gggum gggun
                                    ggg� gggu� gggom ggguin ) ]);
form_ok('ggg�', noun('ggg�'), [ qw( ggg� gggui ggg�m ggg�n
                                    ggg� gggu� ggg�m ggguin ) ]);
form_ok('gggiy', noun('gggiy'), [ qw( gggiy gggii gggiim gggi�n
                                      gggi� gggi� gggiom gggiuin ) ]);
form_ok('ggg�y', noun('ggg�y'), [ qw( ggg�y gggii gggiim gggi�n
                                      gggi� ggg�� gggiom ggg�uin ) ]);
form_ok('gggy', noun('gggy'), [ qw( gggy gggii gggim ggg�n
                                    ggg� gggu� gggom ggguin ) ]);
# Can't test generic masculine in -a, but see further down
form_ok('gggi', noun('gggi'), [ qw( gggi ggg� ggga gggin
                                    ggg� gggi� gggem gggin ) ]);
form_ok('ggg�', noun('ggg�'), [ qw( ggg� ggg� ggg� ggg�n
                                    ggg� gggi� ggg�m ggg�n ) ]);
form_ok('ggge', noun('ggge'), [ qw( ggge gggei ggga gggen
                                    ggg� gggi� gggem gggen ) ]);
form_ok('ggg�', noun('ggg�'), [ qw( ggg� gggei ggg� ggg�n
                                    ggg� gggi� ggg�m ggg�n ) ]);
form_ok('ggg�', noun('ggg�'), [ qw( ggg� ggg�i ggg� gggen
                                    ggg� gggi� gggem gggen ) ]);

# Test known masculine nouns in -a
form_ok('creza', noun('creza'), [ qw( creza crezei creza crezan
                                      crezai creza� crezam crezain ) ]);
form_ok('Erv�a', noun('Erv�a'), [ qw( Erv�a Erv�ei Erv�a Erv�an
                                      Erv�ai Erv�a� Erv�am Erv�ain ) ]);
form_ok('esta', noun('esta'), [ qw( esta estei esta estan
                                    estai esta� estam estain ) ]);
form_ok('hezhiosa', noun('hezhiosa'), [ qw( hezhiosa hezhiosei hezhiosa hezhiosan
                                            hezhiosai hezhiosa� hezhiosam hezhiosain ) ]);
form_ok('rhena', noun('rhena'), [ qw( rhena rhenei rhena rhenan
                                      rhenai rhena� rhenam rhenain ) ]);
