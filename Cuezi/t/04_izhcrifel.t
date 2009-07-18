# vim:set filetype=perl encoding=utf-8 fileencoding=utf-8 sw=4 et keymap=cuezi:
#########################

use Test::More tests => 1;
use Carp;

ok(1);

__END__

BEGIN { use_ok 'Lingua::Zompist::Cuezi', 'izhcrifel'; }

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

form_ok('LIUBEC', izhcrifel('LIUBEC'), [ qw( LIUBERI  LIUBERIUS LIUBERU  LIUBERUM LIUBERUS LIUBERIUNT ) ]);
form_ok('LAUDAN', izhcrifel('LAUDAN'), [ qw( LAUDERIO LAUDERIOS LAUDERAE LAUDEROM LAUDEROS LAUDERIONT ) ]);
form_ok('LEILEN', izhcrifel('LEILEN'), [ qw( LEILERIO LEILERIOS LEILERAE LEILEROM LEILERES LEILERIONT ) ]);
form_ok('CLAGER', izhcrifel('CLAGER'), [ qw( CLAGIRIE CLAGIRIES CLAGIRE  CLAGIREM CLAGIRES CLAGIRIENT ) ]);
form_ok('NURIR',  izhcrifel('NURIR' ), [ qw( NURIRIE  NURIRIES  NURIRAE  NURIREM  NURIRES  NURIRIENT  ) ]);

form_ok('SUDRIR', izhcrifel('SUDRIR'), [ qw( SUDDIRIE SUDDIRIES SUDDIRAE SUDDIREM SUDDIRES SUDDIRIENT ) ]);

form_ok('ESAN',   izhcrifel('ESAN'  ), [ qw( FURIO    FURIOS    FURAE    FUROM    FUROS    FURIONT    ) ]);
form_ok('EPESAN', izhcrifel('EPESAN'), [ qw( EUSERIO  EUSERIOS  EPERAE   EUSEROM  EUSEROS  EUSERIONT  ) ]);

# test general forms
form_ok('GGGEC',  izhcrifel('GGGEC' ), [ qw( GGGERI   GGGERIUS  GGGERU   GGGERUM  GGGERUS  GGGERIUNT  ) ]);
form_ok('GGGAN',  izhcrifel('GGGAN' ), [ qw( GGGERIO  GGGERIOS  GGGERAE  GGGEROM  GGGEROS  GGGERIONT  ) ]);
form_ok('GGGEN',  izhcrifel('GGGEN' ), [ qw( GGGERIO  GGGERIOS  GGGERAE  GGGEROM  GGGERES  GGGERIONT  ) ]);
form_ok('GGGER',  izhcrifel('GGGER' ), [ qw( GGGIRIE  GGGIRIES  GGGIRE   GGGIREM  GGGIRES  GGGIRIENT  ) ]);
form_ok('GGGIR',  izhcrifel('GGGIR' ), [ qw( GGGIRIE  GGGIRIES  GGGIRAE  GGGIREM  GGGIRES  GGGIRIENT  ) ]);

form_ok('BBBREC', izhcrifel('BBBREC'), [ qw( BBBBERI  BBBBERIUS BBBBERU  BBBBERUM BBBBERUS BBBBERIUNT ) ]);
form_ok('PPPREC', izhcrifel('PPPREC'), [ qw( PPPPERI  PPPPERIUS PPPPERU  PPPPERUM PPPPERUS PPPPERIUNT ) ]);
form_ok('DDDREC', izhcrifel('DDDREC'), [ qw( DDDDERI  DDDDERIUS DDDDERU  DDDDERUM DDDDERUS DDDDERIUNT ) ]);
form_ok('TTTREC', izhcrifel('TTTREC'), [ qw( TTTTERI  TTTTERIUS TTTTERU  TTTTERUM TTTTERUS TTTTERIUNT ) ]);
form_ok('GGGREC', izhcrifel('GGGREC'), [ qw( GGGGERI  GGGGERIUS GGGGERU  GGGGERUM GGGGERUS GGGGERIUNT ) ]);
form_ok('KKKREC', izhcrifel('KKKREC'), [ qw( KKKKERI  KKKKERIUS KKKKERU  KKKKERUM KKKKERUS KKKKERIUNT ) ]);
form_ok('CCCREC', izhcrifel('CCCREC'), [ qw( CCCCERI  CCCCERIUS CCCCERU  CCCCERUM CCCCERUS CCCCERIUNT ) ]);
form_ok('FFFREC', izhcrifel('FFFREC'), [ qw( FFFFERI  FFFFERIUS FFFFERU  FFFFERUM FFFFERUS FFFFERIUNT ) ]);
form_ok('VVVREC', izhcrifel('VVVREC'), [ qw( VVVVERI  VVVVERIUS VVVVERU  VVVVERUM VVVVERUS VVVVERIUNT ) ]);
form_ok('RRRREC', izhcrifel('RRRREC'), [ qw( RRRRERI  RRRRERIUS RRRRERU  RRRRERUM RRRRERUS RRRRERIUNT ) ]);
form_ok('SSSREC', izhcrifel('SSSREC'), [ qw( SSSSERI  SSSSERIUS SSSSERU  SSSSERUM SSSSERUS SSSSERIUNT ) ]);
form_ok('ZZZREC', izhcrifel('ZZZREC'), [ qw( ZZZZERI  ZZZZERIUS ZZZZERU  ZZZZERUM ZZZZERUS ZZZZERIUNT ) ]);
form_ok('MMMREC', izhcrifel('MMMREC'), [ qw( MMMMERI  MMMMERIUS MMMMERU  MMMMERUM MMMMERUS MMMMERIUNT ) ]);
form_ok('NNNREC', izhcrifel('NNNREC'), [ qw( NNNNERI  NNNNERIUS NNNNERU  NNNNERUM NNNNERUS NNNNERIUNT ) ]);
form_ok('LLLREC', izhcrifel('LLLREC'), [ qw( LLLLERI  LLLLERIUS LLLLERU  LLLLERUM LLLLERUS LLLLERIUNT ) ]);
form_ok('THREC',  izhcrifel('THREC' ), [ qw( THTHERI  THTHERIUS THTHERU  THTHERUM THTHERUS THTHERIUNT ) ]);
form_ok('DHREC',  izhcrifel('DHREC' ), [ qw( DHDHERI  DHDHERIUS DHDHERU  DHDHERUM DHDHERUS DHDHERIUNT ) ]);
form_ok('KHREC',  izhcrifel('KHREC' ), [ qw( KHKHERI  KHKHERIUS KHKHERU  KHKHERUM KHKHERUS KHKHERIUNT ) ]);

form_ok('BBBRAN', izhcrifel('BBBRAN'), [ qw( BBBBERIO BBBBERIOS BBBBERAE BBBBEROM BBBBEROS BBBBERIONT ) ]);
form_ok('PPPRAN', izhcrifel('PPPRAN'), [ qw( PPPPERIO PPPPERIOS PPPPERAE PPPPEROM PPPPEROS PPPPERIONT ) ]);
form_ok('DDDRAN', izhcrifel('DDDRAN'), [ qw( DDDDERIO DDDDERIOS DDDDERAE DDDDEROM DDDDEROS DDDDERIONT ) ]);
form_ok('TTTRAN', izhcrifel('TTTRAN'), [ qw( TTTTERIO TTTTERIOS TTTTERAE TTTTEROM TTTTEROS TTTTERIONT ) ]);
form_ok('GGGRAN', izhcrifel('GGGRAN'), [ qw( GGGGERIO GGGGERIOS GGGGERAE GGGGEROM GGGGEROS GGGGERIONT ) ]);
form_ok('KKKRAN', izhcrifel('KKKRAN'), [ qw( KKKKERIO KKKKERIOS KKKKERAE KKKKEROM KKKKEROS KKKKERIONT ) ]);
form_ok('CCCRAN', izhcrifel('CCCRAN'), [ qw( CCCCERIO CCCCERIOS CCCCERAE CCCCEROM CCCCEROS CCCCERIONT ) ]);
form_ok('FFFRAN', izhcrifel('FFFRAN'), [ qw( FFFFERIO FFFFERIOS FFFFERAE FFFFEROM FFFFEROS FFFFERIONT ) ]);
form_ok('VVVRAN', izhcrifel('VVVRAN'), [ qw( VVVVERIO VVVVERIOS VVVVERAE VVVVEROM VVVVEROS VVVVERIONT ) ]);
form_ok('RRRRAN', izhcrifel('RRRRAN'), [ qw( RRRRERIO RRRRERIOS RRRRERAE RRRREROM RRRREROS RRRRERIONT ) ]);
form_ok('SSSRAN', izhcrifel('SSSRAN'), [ qw( SSSSERIO SSSSERIOS SSSSERAE SSSSEROM SSSSEROS SSSSERIONT ) ]);
form_ok('ZZZRAN', izhcrifel('ZZZRAN'), [ qw( ZZZZERIO ZZZZERIOS ZZZZERAE ZZZZEROM ZZZZEROS ZZZZERIONT ) ]);
form_ok('MMMRAN', izhcrifel('MMMRAN'), [ qw( MMMMERIO MMMMERIOS MMMMERAE MMMMEROM MMMMEROS MMMMERIONT ) ]);
form_ok('NNNRAN', izhcrifel('NNNRAN'), [ qw( NNNNERIO NNNNERIOS NNNNERAE NNNNEROM NNNNEROS NNNNERIONT ) ]);
form_ok('LLLRAN', izhcrifel('LLLRAN'), [ qw( LLLLERIO LLLLERIOS LLLLERAE LLLLEROM LLLLEROS LLLLERIONT ) ]);
form_ok('THRAN',  izhcrifel('THRAN' ), [ qw( THTHERIO THTHERIOS THTHERAE THTHEROM THTHEROS THTHERIONT ) ]);
form_ok('DHRAN',  izhcrifel('DHRAN' ), [ qw( DHDHERIO DHDHERIOS DHDHERAE DHDHEROM DHDHEROS DHDHERIONT ) ]);
form_ok('KHRAN',  izhcrifel('KHRAN' ), [ qw( KHKHERIO KHKHERIOS KHKHERAE KHKHEROM KHKHEROS KHKHERIONT ) ]);

form_ok('BBBREN', izhcrifel('BBBREN'), [ qw( BBBBERIO BBBBERIOS BBBBERAE BBBBEROM BBBBERES BBBBERIONT ) ]);
form_ok('PPPREN', izhcrifel('PPPREN'), [ qw( PPPPERIO PPPPERIOS PPPPERAE PPPPEROM PPPPERES PPPPERIONT ) ]);
form_ok('DDDREN', izhcrifel('DDDREN'), [ qw( DDDDERIO DDDDERIOS DDDDERAE DDDDEROM DDDDERES DDDDERIONT ) ]);
form_ok('TTTREN', izhcrifel('TTTREN'), [ qw( TTTTERIO TTTTERIOS TTTTERAE TTTTEROM TTTTERES TTTTERIONT ) ]);
form_ok('GGGREN', izhcrifel('GGGREN'), [ qw( GGGGERIO GGGGERIOS GGGGERAE GGGGEROM GGGGERES GGGGERIONT ) ]);
form_ok('KKKREN', izhcrifel('KKKREN'), [ qw( KKKKERIO KKKKERIOS KKKKERAE KKKKEROM KKKKERES KKKKERIONT ) ]);
form_ok('CCCREN', izhcrifel('CCCREN'), [ qw( CCCCERIO CCCCERIOS CCCCERAE CCCCEROM CCCCERES CCCCERIONT ) ]);
form_ok('FFFREN', izhcrifel('FFFREN'), [ qw( FFFFERIO FFFFERIOS FFFFERAE FFFFEROM FFFFERES FFFFERIONT ) ]);
form_ok('VVVREN', izhcrifel('VVVREN'), [ qw( VVVVERIO VVVVERIOS VVVVERAE VVVVEROM VVVVERES VVVVERIONT ) ]);
form_ok('RRRREN', izhcrifel('RRRREN'), [ qw( RRRRERIO RRRRERIOS RRRRERAE RRRREROM RRRRERES RRRRERIONT ) ]);
form_ok('SSSREN', izhcrifel('SSSREN'), [ qw( SSSSERIO SSSSERIOS SSSSERAE SSSSEROM SSSSERES SSSSERIONT ) ]);
form_ok('ZZZREN', izhcrifel('ZZZREN'), [ qw( ZZZZERIO ZZZZERIOS ZZZZERAE ZZZZEROM ZZZZERES ZZZZERIONT ) ]);
form_ok('MMMREN', izhcrifel('MMMREN'), [ qw( MMMMERIO MMMMERIOS MMMMERAE MMMMEROM MMMMERES MMMMERIONT ) ]);
form_ok('NNNREN', izhcrifel('NNNREN'), [ qw( NNNNERIO NNNNERIOS NNNNERAE NNNNEROM NNNNERES NNNNERIONT ) ]);
form_ok('LLLREN', izhcrifel('LLLREN'), [ qw( LLLLERIO LLLLERIOS LLLLERAE LLLLEROM LLLLERES LLLLERIONT ) ]);
form_ok('THREN',  izhcrifel('THREN' ), [ qw( THTHERIO THTHERIOS THTHERAE THTHEROM THTHERES THTHERIONT ) ]);
form_ok('DHREN',  izhcrifel('DHREN' ), [ qw( DHDHERIO DHDHERIOS DHDHERAE DHDHEROM DHDHERES DHDHERIONT ) ]);
form_ok('KHREN',  izhcrifel('KHREN' ), [ qw( KHKHERIO KHKHERIOS KHKHERAE KHKHEROM KHKHERES KHKHERIONT ) ]);

form_ok('BBBRER', izhcrifel('BBBRER'), [ qw( BBBBIRIE BBBBIRIES BBBBIRE  BBBBIREM BBBBIRES BBBBIRIENT ) ]);
form_ok('PPPRER', izhcrifel('PPPRER'), [ qw( PPPPIRIE PPPPIRIES PPPPIRE  PPPPIREM PPPPIRES PPPPIRIENT ) ]);
form_ok('DDDRER', izhcrifel('DDDRER'), [ qw( DDDDIRIE DDDDIRIES DDDDIRE  DDDDIREM DDDDIRES DDDDIRIENT ) ]);
form_ok('TTTRER', izhcrifel('TTTRER'), [ qw( TTTTIRIE TTTTIRIES TTTTIRE  TTTTIREM TTTTIRES TTTTIRIENT ) ]);
form_ok('GGGRER', izhcrifel('GGGRER'), [ qw( GGGGIRIE GGGGIRIES GGGGIRE  GGGGIREM GGGGIRES GGGGIRIENT ) ]);
form_ok('KKKRER', izhcrifel('KKKRER'), [ qw( KKKKIRIE KKKKIRIES KKKKIRE  KKKKIREM KKKKIRES KKKKIRIENT ) ]);
form_ok('CCCRER', izhcrifel('CCCRER'), [ qw( CCCCIRIE CCCCIRIES CCCCIRE  CCCCIREM CCCCIRES CCCCIRIENT ) ]);
form_ok('FFFRER', izhcrifel('FFFRER'), [ qw( FFFFIRIE FFFFIRIES FFFFIRE  FFFFIREM FFFFIRES FFFFIRIENT ) ]);
form_ok('VVVRER', izhcrifel('VVVRER'), [ qw( VVVVIRIE VVVVIRIES VVVVIRE  VVVVIREM VVVVIRES VVVVIRIENT ) ]);
form_ok('RRRRER', izhcrifel('RRRRER'), [ qw( RRRRIRIE RRRRIRIES RRRRIRE  RRRRIREM RRRRIRES RRRRIRIENT ) ]);
form_ok('SSSRER', izhcrifel('SSSRER'), [ qw( SSSSIRIE SSSSIRIES SSSSIRE  SSSSIREM SSSSIRES SSSSIRIENT ) ]);
form_ok('ZZZRER', izhcrifel('ZZZRER'), [ qw( ZZZZIRIE ZZZZIRIES ZZZZIRE  ZZZZIREM ZZZZIRES ZZZZIRIENT ) ]);
form_ok('MMMRER', izhcrifel('MMMRER'), [ qw( MMMMIRIE MMMMIRIES MMMMIRE  MMMMIREM MMMMIRES MMMMIRIENT ) ]);
form_ok('NNNRER', izhcrifel('NNNRER'), [ qw( NNNNIRIE NNNNIRIES NNNNIRE  NNNNIREM NNNNIRES NNNNIRIENT ) ]);
form_ok('LLLRER', izhcrifel('LLLRER'), [ qw( LLLLIRIE LLLLIRIES LLLLIRE  LLLLIREM LLLLIRES LLLLIRIENT ) ]);
form_ok('THRER',  izhcrifel('THRER' ), [ qw( THTHIRIE THTHIRIES THTHIRE  THTHIREM THTHIRES THTHIRIENT ) ]);
form_ok('DHRER',  izhcrifel('DHRER' ), [ qw( DHDHIRIE DHDHIRIES DHDHIRE  DHDHIREM DHDHIRES DHDHIRIENT ) ]);
form_ok('KHRER',  izhcrifel('KHRER' ), [ qw( KHKHIRIE KHKHIRIES KHKHIRE  KHKHIREM KHKHIRES KHKHIRIENT ) ]);

form_ok('BBBRIR', izhcrifel('BBBRIR'), [ qw( BBBBIRIE BBBBIRIES BBBBIRAE BBBBIREM BBBBIRES BBBBIRIENT ) ]);
form_ok('PPPRIR', izhcrifel('PPPRIR'), [ qw( PPPPIRIE PPPPIRIES PPPPIRAE PPPPIREM PPPPIRES PPPPIRIENT ) ]);
form_ok('DDDRIR', izhcrifel('DDDRIR'), [ qw( DDDDIRIE DDDDIRIES DDDDIRAE DDDDIREM DDDDIRES DDDDIRIENT ) ]);
form_ok('TTTRIR', izhcrifel('TTTRIR'), [ qw( TTTTIRIE TTTTIRIES TTTTIRAE TTTTIREM TTTTIRES TTTTIRIENT ) ]);
form_ok('GGGRIR', izhcrifel('GGGRIR'), [ qw( GGGGIRIE GGGGIRIES GGGGIRAE GGGGIREM GGGGIRES GGGGIRIENT ) ]);
form_ok('KKKRIR', izhcrifel('KKKRIR'), [ qw( KKKKIRIE KKKKIRIES KKKKIRAE KKKKIREM KKKKIRES KKKKIRIENT ) ]);
form_ok('CCCRIR', izhcrifel('CCCRIR'), [ qw( CCCCIRIE CCCCIRIES CCCCIRAE CCCCIREM CCCCIRES CCCCIRIENT ) ]);
form_ok('FFFRIR', izhcrifel('FFFRIR'), [ qw( FFFFIRIE FFFFIRIES FFFFIRAE FFFFIREM FFFFIRES FFFFIRIENT ) ]);
form_ok('VVVRIR', izhcrifel('VVVRIR'), [ qw( VVVVIRIE VVVVIRIES VVVVIRAE VVVVIREM VVVVIRES VVVVIRIENT ) ]);
form_ok('RRRRIR', izhcrifel('RRRRIR'), [ qw( RRRRIRIE RRRRIRIES RRRRIRAE RRRRIREM RRRRIRES RRRRIRIENT ) ]);
form_ok('SSSRIR', izhcrifel('SSSRIR'), [ qw( SSSSIRIE SSSSIRIES SSSSIRAE SSSSIREM SSSSIRES SSSSIRIENT ) ]);
form_ok('ZZZRIR', izhcrifel('ZZZRIR'), [ qw( ZZZZIRIE ZZZZIRIES ZZZZIRAE ZZZZIREM ZZZZIRES ZZZZIRIENT ) ]);
form_ok('MMMRIR', izhcrifel('MMMRIR'), [ qw( MMMMIRIE MMMMIRIES MMMMIRAE MMMMIREM MMMMIRES MMMMIRIENT ) ]);
form_ok('NNNRIR', izhcrifel('NNNRIR'), [ qw( NNNNIRIE NNNNIRIES NNNNIRAE NNNNIREM NNNNIRES NNNNIRIENT ) ]);
form_ok('LLLRIR', izhcrifel('LLLRIR'), [ qw( LLLLIRIE LLLLIRIES LLLLIRAE LLLLIREM LLLLIRES LLLLIRIENT ) ]);
form_ok('THRIR',  izhcrifel('THRIR' ), [ qw( THTHIRIE THTHIRIES THTHIRAE THTHIREM THTHIRES THTHIRIENT ) ]);
form_ok('DHRIR',  izhcrifel('DHRIR' ), [ qw( DHDHIRIE DHDHIRIES DHDHIRAE DHDHIREM DHDHIRES DHDHIRIENT ) ]);
form_ok('KHRIR',  izhcrifel('KHRIR' ), [ qw( KHKHIRIE KHKHIRIES KHKHIRAE KHKHIREM KHKHIRES KHKHIRIENT ) ]);