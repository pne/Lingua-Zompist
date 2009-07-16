package Lingua::Zompist::Verdurian;

use 5.005;
use strict;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Lingua::Zompist::Verdurian ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
    demeric
    scrifel
    izhcrifel
    ctanec
    epesec
    befel
    classimp
    part
    noun
    adj
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
	
);
$VERSION = '0.04';

my %verb = (demeric => \&demeric,
            scrifel => \&scrifel,
            izhcrifel => \&izhcrifel,
            ctanec => \&ctanec,
            epesec => \&epesec,
            befel => \&befel,
            classimp => \&classimp,
           );

my @persons = qw(se le il ta mu ca);

my @cases = qw(nom gen acc dat);

my @numbers = qw(sing pl);

my %endings = (
  N => [ qw( ai ei e am o u ) ],
  R => [ qw(  u eu e um o � ) ],
  C => [ qw( ao eo e om o u ) ],
);

# Some handy things for -i- insertion and moving stress
my $cons = qr/(?:[szcdr]h|[pbtdcgkfvszmnlr])/;
my $vow  = qr/[aeiouAEIOU]/; # plain vowels only
my %acc = (
  'a' => '�',
  'e' => '�',
  'i' => '�',
  'o' => '�',
  'u' => '�',
  'A' => '�',
  'E' => '�',
  'I' => '�',
  'O' => '�',
  'U' => '�',
);

my %unacc = (
  '�' => 'a',
  '�' => 'e',
  '�' => 'i',
  '�' => 'o',
  '�' => 'u',
  '�' => 'A',
  '�' => 'E',
  '�' => 'I',
  '�' => 'O',
  '�' => 'U',
);


my %demeric = (
  esan    => [ qw( ai ei e am eo eu ) ],
  fassec  => [ qw( fassao fasseo fas fassom fasso fassu ) ],
  kies    => [ qw( kiai kiei kiet kaiam kaio kaiu ) ],
  'l�bec' => [ qw( l�bao l�o l� l�bom l�bo l�bu ) ],
  mizec   => [ qw( mizao mizeo mis mizom mizo mizu ) ],
  shrifec => [ qw( shrifao shris shri shrifom shrifo shrifu ) ],
  zhanen  => [ qw( zhai zhes zhe zhanam zhano zhanu ) ],
  zhusir  => [ qw( zhui zhus zhu zhusum zhuso zhus� ) ],
);

sub demeric {
  my $verb = shift;
  my $stem = $verb;
  my $table;

  if($stem =~ s/^(\S+)(fassec|mizec|shrifec|zhanen|zhusir)$/$1/) {
    return [ map "$stem$_", @{$demeric{$2}} ];
  }

  return $demeric{$verb} if exists $demeric{$verb};

  if($stem =~ s/[ea]n$//) {
    $table = [ map "$stem$_", @{$endings{N}} ];
  } elsif($stem =~ s/[ie]r$//) {
    $table = [ map "$stem$_", @{$endings{R}} ];
  } elsif($stem =~ s/ec$//) {
    $table = [ map "$stem$_", @{$endings{C}} ];
  } else {
    return;
  }

  for(@$table) {
    s/zh(?=[aou][iom]?$)/g/;
  }

  return $table;
}

my %scrifel = (
  esan      => [ qw( fuai fuei fue/esne fuam fuo fueu/esnu ) ],
  fassec    => [ map "fashsh$_", @{$endings{C}} ],
  dan       => [ map "don$_",    @{$endings{N}} ],
  kies      => [ map "kaiv$_",   @{$endings{N}} ],
  shushchan => [ map "shushd$_", @{$endings{N}} ],
);

sub scrifel {
  my $verb = shift;
  my $stem = $verb;
  my $table;
  my $add = 0;  # did we have to add an -i-?

  return $scrifel{$verb} if exists $scrifel{$verb};

  if($stem =~ s/($cons[lr])([ea]n|[ie]r|ec)$/$1i$2/) {
    $add = 1;
  }

  if($stem =~ s/c[ea]n$/sn/  ||
     $stem =~ s/ch[ea]n$/dn/ ||
     $stem =~ s/d[ea]n$/zn/  ||
     $stem =~ s/g[ea]n$/zhn/ ||
     $stem =~ s/[ea]n$/n/) {
    $table = [ map "$stem$_", @{$endings{N}} ];
  } elsif($stem =~ s/ch[ie]r$/dr/ ||
          $stem =~ s/m[ie]r$/mbr/ ||
          $stem =~ s/n[ie]r$/ndr/ ||
          $stem =~ s/z[ie]r$/dr/  ||
          $stem =~ s/[ie]r$/r/) {
    $table = [ map "$stem$_", @{$endings{R}} ];
  } elsif($stem =~ s/cec$/sc/   ||
          $stem =~ s/chec$/shc/ ||
          $stem =~ s/mec$/nc/   ||
          $stem =~ s/sec$/sh/   ||
          $stem =~ s/zec$/zh/   ||
          $stem =~ s/ec$/c/) {
    $table = [ map "$stem$_", @{$endings{C}} ];
  } else {
    return;
  }

  if($add) {
    for(@$table) {
      # replace -VC+[lr]i[nrc]VC* with -V'C+[lr]i[nrc]VC*
      s{
        ($vow)        # a vowel, which we'll accent (to $1)
        (             # begin capturing to $2
          (?:$cons)+  # one or more consonants
                      # (never zero, since otherwise we wouldn't have had
                      # to insert the -i-)
	  [lr]        # one of 'l' or 'r'
          i           # the epenthetic -i- which must not receive the stress
          [nrc]       # endings are either -n-, -r-, or -c-
          $vow        # followed by only one (unstressed) vowel
          m?          # and possibly an -m (for the -am -um -om endings
                      # of the Ist person plural)
          $           # and finally end-of-string
        )             # end of $2
      }{$acc{$1}$2}ox;
    }
  }

  return $table;
}

my %izhcrifel = (
  fassec    => [ map "fashsher$_", @{$endings{C}} ],
  dan       => [ map "doner$_",    @{$endings{N}} ],
  kies      => [ map "kaiver$_",   @{$endings{N}} ],
  shushchan => [ map "shushder$_", @{$endings{N}} ],
);

sub izhcrifel {
  my $verb = shift;
  my $stem = $verb;
  my $table;
  my $add = 0;

  return $izhcrifel{$verb} if exists $izhcrifel{$verb};

  if($stem =~ s/($cons[lr])([ea]n|[ie]r|ec)$/$1i$2/) {
    $add = 1;
  }

  if($stem =~ s/c[ea]n$/sner/  ||
     $stem =~ s/ch[ea]n$/dner/ ||
     $stem =~ s/d[ea]n$/zner/  ||
     $stem =~ s/g[ea]n$/zhner/ ||
     $stem =~ s/[ea]n$/ner/) {
    $table = [ map "$stem$_", @{$endings{N}} ];
  } elsif($stem =~ s/ch[ie]r$/dre/ ||
          $stem =~ s/m[ie]r$/mbre/ ||
          $stem =~ s/n[ie]r$/ndre/ ||
          $stem =~ s/z[ie]r$/dre/  ||
          $stem =~ s/[ie]r$/re/) {
    $table = [ map "$stem$_", @{$endings{R}} ];
  } elsif($stem =~ s/cec$/scer/   ||
          $stem =~ s/chec$/shcer/ ||
          $stem =~ s/mec$/ncer/   ||
          $stem =~ s/sec$/sher/   ||
          $stem =~ s/zec$/zher/   ||
          $stem =~ s/ec$/cer/) {
    $table = [ map "$stem$_", @{$endings{C}} ];
  } else {
    return;
  }

  # Don't need to shift stress since the ending will always have at least
  # two vowels

  return $table;
}

my %ctanec = (
  fassec    => [ map "fasst$_",  @{$endings{C}} ],
  dan       => [ map "dom$_",    @{$endings{N}} ],
  kies      => [ map "kaim$_",   @{$endings{N}} ],
  shushchan => [ map "shushm$_", @{$endings{N}} ],
);

sub ctanec {
  my $verb = shift;
  my $stem = $verb;
  my $table;
  my $add = 0;

  return $ctanec{$verb} if exists $ctanec{$verb};

  if($stem =~ s/($cons$cons)([ea]n|[ie]r|ec)$/$1i$2/) {
    $add = 1;
  }

  if($stem =~ s/ch[ea]n$/dm/ ||
     $stem =~ s/g[ea]n$/zhm/ ||
     $stem =~ s/[ea]n$/m/) {
    $table = [ map "$stem$_", @{$endings{N}} ];
  } elsif($stem =~ s/ch[ie]r$/tret/ ||
          $stem =~ s/m[ie]r$/mbret/ ||
          $stem =~ s/n[ie]r$/ndret/ ||
          $stem =~ s/z[ie]r$/dret/  ||
          $stem =~ s/[ie]r$/ret/) {
    $table = [ map "$stem$_", @{$endings{R}} ];
  } elsif($stem =~ s/ec$/t/) {
    $table = [ map "$stem$_", @{$endings{C}} ];
  } else {
    return;
  }

  if($add) {
    for(@$table) {
      # replace -VC+[lr]i[mt]VC* with -V'C+[lr]i[nrc]VC*
      s{
        ($vow)        # a vowel, which we'll accent (to $1)
        (             # begin capturing to $2
          (?:$cons)+  # one or more consonants
                      # (never zero, since otherwise we wouldn't have had
                      # to insert the -i-)
	  [lr]        # one of 'l' or 'r'
          i           # the epenthetic -i- which must not receive the stress
          [mt]        # endings are either -m- or -t-
                      # (-ret- already has an extra vowel)
          $vow        # followed by only one (unstressed) vowel
          m?          # and possibly an -m (for the -am -um -om endings
                      # of the Ist person plural)
          $           # and finally end-of-string
        )             # end of $2
      }{$acc{$1}$2}ox;
    }
  }

  return $table;
}


my %epesec = (
  dan       => [ map "doncel$_",   @{$endings{N}} ],
  fassec    => [ map "fashshel$_", @{$endings{C}} ],
  kies      => [ map "keshel$_",   @{$endings{N}} ],
);

sub epesec {
  my $verb = shift;
  my $stem = $verb;
  my $table;
  my $add = 0;

  return $epesec{$verb} if exists $epesec{$verb};

  if($stem =~ s/($cons$cons)([ea]n|[ie]r|ec)$/$1i$2/) {
    $add = 1;
  }

  if($stem =~ s/c[ea]n$/scel/   ||
     $stem =~ s/ch[ea]n$/shcel/ ||
     $stem =~ s/m[ea]n$/ncel/   ||
     $stem =~ s/s[ea]n$/shel/   ||
     $stem =~ s/z[ea]n$/zhel/   ||
     $stem =~ s/[ea]n$/cel/) {
    $table = [ map "$stem$_", @{$endings{N}} ];
  } elsif($stem =~ s/c[ie]r$/scel/   ||
          $stem =~ s/ch[ie]r$/shcel/ ||
          $stem =~ s/m[ie]r$/ncel/   ||
          $stem =~ s/s[ie]r$/shel/   ||
          $stem =~ s/z[ie]r$/zhel/   ||
          $stem =~ s/[ie]r$/cel/) {
    $table = [ map "$stem$_", @{$endings{R}} ];
  } elsif($stem =~ s/cec$/scel/   ||
          $stem =~ s/chec$/shcel/ ||
          $stem =~ s/mec$/ncel/   ||
          $stem =~ s/sec$/shel/   ||
          $stem =~ s/zec$/zhel/   ||
          $stem =~ s/ec$/cel/) {
    $table = [ map "$stem$_", @{$endings{C}} ];
  } else {
    return;
  }

  # Don't need to shift stress since the ending will always have at least
  # two vowels

  return $table;
}

sub befel {
  my $verb = shift;
  my $stem = $verb;

  return if $verb eq 'kies'; # has no imperative, according to Mark

  if($stem =~ m/[ea]n$/) {
    return [ map "$stem$_", @{$endings{N}} ];
  } elsif($stem =~ m/[ie]r$/) {
    return [ map "$stem$_", @{$endings{R}} ];
  } elsif($stem =~ m/ec$/) {
    return [ map "$stem$_", @{$endings{C}} ];
  } else {
    return;
  }
}


# Form the so-called "classical imperative"
sub classimp {
  my $verb = shift;
  my $stem = $verb;

  return if $verb eq 'kies'; # has no imperative, according to Mark

  if($stem =~ s/[ea]n$//) {
    return [ undef, $stem . 'i', undef, undef, $stem . 'il', undef ];
  } elsif($stem =~ s/[ie]r$//) {
    return [ undef, $stem . 'u', undef, undef, $stem . 'ul', undef ];
  } elsif($stem =~ s/ec$//) {
    return [ undef, $stem . 'e', undef, undef, $stem . 'el', undef ];
  } else {
    return;
  }
}


my %part = (
  dan  => [ qw(donec  donul  don�m ) ],
  kies => [ qw(kaivec kaivul kaiv�m) ],
);


# Participles
sub part {
  my $verb = shift;

  my($present, $past, $gerund);

  if(exists $part{$verb}) {
    ($present, $past, $gerund) = @{ $part{$verb} };
  } else {
    return unless $verb =~ /(?:ec|[ea]n|[ie]r)$/;

    ($present, $past, $gerund) = ($verb) x 3;

    for($present) {
      s/ec$/�/ || s/(?:[ie]r|[ea]n)$/ec/;
    }

    for($past) {
      s/(?:ec|[ea]n|[ie]r)$/ul/;
    }

    for($gerund) {
      s/(?:ec|[ea]n|[ie]r)$/�m/;
    }
  }

  return wantarray ? ($present, $past, $gerund) : [ $present, $past, $gerund ];
}




my %masc = (
  creza => 1,
  'Erv�a' => 1,
  esta => 1,
  hezhiosa => 1,
  rhena => 1,
  didha => 1,
);

sub noun {
  my $noun = shift;
  my $stem = $noun;
  my $type = 'fem';
  my $table;

  $type = 'masc' if exists $masc{$noun};

  # is it the article?
  return [ qw( so  soei so  so�n so� soi� soi  soin ) ] if $noun eq 'so';
  return [ qw( soa soe  soa soan so� soi� soem soen ) ] if $noun eq 'soa';

  # is it a personal pronoun?
  return [ qw( se  es�  et    sen  ta ta� tam tan ) ] if $noun eq 'se';
  return [ qw( le  l�   erh   len  mu mu� m�  mun ) ] if $noun eq 'le';
  return [ qw( ilu li�  ilet  ilun ca ca� cam can ) ] if $noun eq 'ilu';
  return [ qw( ila liue ilat  ilan ca ca� cam can ) ] if $noun eq 'ila';
  return [ qw( il  li�  iler  ilon ca ca� cam can ) ] if $noun eq 'il';
  return [ qw( ze  zi�  zet   zen  za za� zam zan ) ] if $noun eq 'ze';
  return [ qw( tu  tu�  tu/t� tun ), (undef) x 4    ] if $noun eq 'tu';

  # relative or interrogative pronoun?
  if($stem =~ s/^((?:if|nib|ti)?k)e$/$1/) {
    return [ map "$stem$_", qw( e � et en a� a�ne a�m a�n ) ];
  } elsif($stem =~ s/^((?:if|nib|ti)?ki)o$/$1/) {
    return [ ( map "$stem$_", qw( o ei om on ) ), (undef) x 4 ];
  } elsif($stem =~ s/^((?:n�c|nik|sh|e)t)o$/$1/) {
    return [ ( map "$stem$_", qw( o � o on ) ), (undef) x 4 ];
  } elsif($noun eq 'tot') {
    return [ qw( tot tot� tot tot�n ), (undef) x 4 ];
  } elsif($noun eq 'fsya') {
    return [ qw( fsya fsye fsya fsyan ), (undef) x 4 ];
  } elsif($stem =~ s/^((?:if|nib|ti)c|kt|fs)�$/$1/) {
    return [ ( map "$stem$_", qw( � �i � �n ) ), (undef) x 4 ];
  } elsif($noun eq 'zdesy') {
    return [ qw( zdesy zdesii zdesy zdes�n ), (undef) x 4 ];
  } elsif($noun eq 'cechel') {
    return [ qw( cechel cechelei cechel cechel�n ), (undef) x 4 ];
  } elsif($noun eq 'nish') {
    return [ qw( nish nishei nish nish�n ), (undef) x 4 ];
  }

  # else treat it as a noun.

  # apparently, -consonant and -a are the most common, so put those
  # first, followed by the other masculine and then the feminine
  # declensions
  # must, however, put '-ia' before '-a' or we'll get confused.
  if($stem =~ m/[pbtdhcgkfvszmnlr]$/) {
    $table = [ map "$stem$_", '', 'ei', '', '�n', '�', 'i�', 'i', 'in' ];
  } elsif($type eq 'fem' && $stem =~ s/ia$//) {
    $table = [ map "$stem$_", qw( ia � iam ian i� i� em en ) ];
  } elsif($type eq 'fem' && $stem =~ s/a$//) {
    $table = [ map "$stem$_", qw( a e a an � i� em en ) ];
  } elsif($stem =~ s/o$//) {
    $table = [ map "$stem$_", qw( o ei am on oi o� om oin ) ];
  } elsif($stem =~ s/u$//) {
    $table = [ map "$stem$_", qw( u ui um un � u� om uin ) ];
  } elsif($stem =~ s/iy$//) {
    $table = [ map "$stem$_", qw( iy ii iim i�n i� i� iom iuin ) ];
  } elsif($stem =~ s/�y$//) {
    $table = [ map "$stem$_", qw( �y ii iim i�n i� �� iom �uin ) ];
  } elsif($stem =~ s/y$//) {
    $table = [ map "$stem$_", qw( y ii im �n � u� om uin ) ];
  } elsif($type eq 'masc' && $stem =~ s/a$//) {
    $table = [ map "$stem$_", qw( a ei a an ai a� am ain ) ];
  } elsif($stem =~ s/i$//) {
    $table = [ map "$stem$_", qw( i � a in � i� em in ) ];
  } elsif($stem =~ s/e$//) {
    $table = [ map "$stem$_", qw( e ei a en � i� em en ) ];
  } elsif($stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( � �i � en � i� em en ) ];
  } elsif($type eq 'fem' && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( � � � �n � i� �m �n ) ];
  } elsif($stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( � ei �m �n oi o� �m oin ) ];
  } elsif($stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( � ui �m �n � u� �m uin ) ];
  } elsif($type eq 'masc' && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( � ei � �n ai a� �m ain ) ];
  } elsif($stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( � � � �n � i� �m �n ) ];
  } elsif($stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( � ei � �n � i� �m �n ) ];
  } else {
    return;
  }

  # remove accents for words ending in �n or �n
  # and put in irregular plurals
  for(@$table) {
    if(/[��]n$/) {
      # remove all accents
      tr/����������/aeiouAEIOU/;
      # and put the last one back on
      s/an$/�n/;
      s/in$/�n/;
    }

    # c, ca -> s; d -> z; g, ga -> zh; t -> dh or ch or s
    my $c  = qr/c(?=(?:�|i[�n]?)$)/;
    my $ca = qr/c(?=(?:�|i�|e[mn])$)/;
    my $d  = qr/d(?=(?:�|i[�n]?)$)/;
    my $g  = qr/g(?=(?:�|i[�n]?)$)/;
    my $ga = qr/g(?=(?:�|i�|e[mn])$)/;
    my $k  = qr/k(?=(?:�|i[�n]?)$)/;
    my $t  = qr/t(?=(?:�|i[�n]?)$)/;

    s/^aklog�$/aklozhi/ ||
    s/^aklo$g/aklozh/o ||
    s/^�nselcu$d/�nselcuz/o ||
    s/^bars�$c/bars�s/o ||
    s/^bela$c/belas/o ||
    s/^bo$c/bos/o ||
    s/^br�$ca/br�s/o ||
    s/^b�$t/b�s/o ||
    s/^chedesnag�$/chedesnazhi/ ||
    s/^chedesna$ga/chedesnazh/o ||
    s/^chu$ca/chus/o ||
    s/^dosi$c/dosis/o ||
    s/^dra$c/dras/o ||
    s/^dushi$c/dushis/o ||
    s/^dha$c/dhas/o ||
    s/^dhie$c/dhies/o ||
    s/^ecel�g�$/ecelozhi/ ||
    s/^ecel�$g/ecel�zh/o ||
    s/^etal�g�$/etalozhi/ ||
    s/^etal�$g/etal�zh/o ||
    s/^feri$ca/feris/o ||
    s/^fifachi$c/fifachis/o ||
    s/^formi$ca/formis/o ||
    s/^gl�$ca/gl�s/o ||
    s/^gorat�$/goradhi/ ||
    s/^gora$t/goradh/o ||
    s/^gra$k/grah/o ||
    s/^gut�$/gudhi/ ||
    s/^gu$t/gudh/o ||
    s/^hu$ca/hus/o ||
    s/^kt�log�$/kt�lozhi/ ||
    s/^kt�lo$g/kt�lozh/o ||
    s/^ku$d/kuz/o ||
    s/^lertlog�$/lertlozhi/ ||
    s/^lertlo$g/lertlozh/o ||
    s/^log�$/lozhi/ ||
    s/^lo$g/lozh/o ||
    s/^mati$ca/matis/o ||
    s/^me$ca/mes/o ||
    s/^mevlog�$/mevlozhi/ ||
    s/^mevlo$g/mevlozh/o ||
    s/^morut�$/morudhi/ ||
    s/^moru$t/morudh/o ||
    s/^nag�$/nazhi/ ||
    s/^na$ga/nazh/o ||
    s/^ni$d/niz/o ||
    s/^pag�$/pazhi/ ||
    s/^pa$g/pazh/o ||
    s/^prolog�$/prolozhi/ ||
    s/^prolo$g/prolozh/o ||
    s/^ra$k/rah/o ||
    s/^rog�$/rozhi/ ||
    s/^ro$g/rozh/o ||
    s/^rhit�$/rhichi/ ||
    s/^rhi$t/rhich/o ||
    s/^sfi$ca/sfis/o ||
    s/^shan$k/shanh/o ||
    s/^smeri$c/smeris/o ||
    s/^verat�$/veradhi/ ||
    s/^vera$t/veradh/o ||
    s/^yag�$/yazhi/ ||
    s/^ya$g/yazh/o ||
    1;

    # remove unnecessary accents: if the accented vowel is
    # the penultimate vowel and the last vowel is not umlauted
    s/([����������])(?=[pbtdhcgkfvszmnlr]*[aeiou�][pbtdhcgkfvszmnlr]*$)/$unacc{$1}/;
  }

  return $table;
}


sub adj {
  my $adj = shift;
  my $stem = $adj;
  my $table;

  if($stem =~ m/[pbtdhcgkfvszmnlr]$/ || $stem eq 'so') {
    $table = [ [ map "$stem$_", '', 'ei', '', '�n', '�', 'i�', 'i', 'in' ],
               [ map "$stem$_", qw( a e a an � i� em en ) ] ];
  } elsif($stem =~ s/e$//) {
    $table = [ [ map "$stem$_", qw( e ei em en � e� em ein ) ],
               [ map "$stem$_", qw( � �i � en � i� em en ) ] ];
  } elsif($stem =~ s/y$//) {
    $table = [ [ map "$stem$_", qw( y ii im �n � u� om uin ) ],
               [ map "$stem$_", qw( y ye ya yan � yi� yem yen ) ] ];
  } elsif($stem =~ s/�$//) {
    $table = [ [ map "$stem$_", qw( � �i � �n �i �� �m �in ) ],
               [ map "$stem$_", qw( a e a an � i� em en ) ] ];
  } else {
    return;
  }

  # remove accents for words ending in �n or �n or �n or �m
  for(@$table) {
    for(@$_) {
      if(/[���]n$/ || /�m$/) {
        # remove all accents
        tr/�����/aeiou/;
        # and put the last one back on
        s/an$/�n/;
        s/in$/�n/;
        s/en$/�n/;
        s/om$/�m/;
      }

      # remove unnecessary accents: if the accented vowel is
      # the penultimate vowel and the last vowel is not umlauted
      s/([����������])(?=[pbtdhcgkfvszmnlr]*[aeiou�][pbtdhcgkfvszmnlr]*$)/$unacc{$1}/;
    }
  }

  return $table;
}


1;
__END__

=head1 NAME

Lingua::Zompist::Verdurian - Inflect Verdurian nouns, verbs, and adjectives

=head1 VERSION

This document refers to version 0.03 of Lingua::Zompist::Verdurian, released
on 2001-11-15.

=head1 SYNOPSIS

  use Lingua::Zompist::Verdurian;
  $i_am = Lingua::Zompist::Verdurian::demeric('esan')->[0];

or

  use Lingua::Zompist::Verdurian ':all';
  $i_am = demeric('esan')->[0];

or

  use Lingua::Zompist::Verdurian qw( demeric crifel );
  $you_know = demeric('shrifec')->[1];
  $they_had = crifel('tenec')->[5];

  
  $word = noun('cuon');  # nouns
  $word = noun('se');    # pronouns
  $word = adj('haute');  # adjectives
  $word = adj('so');     # definite article

  # verbs
  $word = demeric('ivrec');     # present
  $word = scrifel('ivrec');     # past
  $word = izhcrifel('ivrec');   # past anterior
  $word = ctanec('ivrec');      # future
  $word = epesec('ivrec');      # conditional
  $word = befel('ivrec');       # imperative
  $word = classimp('ivrec');    # "classical" imperative
  $word = part('ivrec');        # participles

=head1 DESCRIPTION

=head2 Overview

Lingua::Zompist::Verdurian is a module which allows you to inflect Verdurian
words. You can conjugate verbs and decline nouns, pronouns, adjectives, and the
definite article.

There is one function to inflect nouns and pronouns, and another to inflect
adjectives and the definite article. Verbs are covered by several functions:
one for each tense or mood and another for the participles.

=head2 Exports

Lingua::Zompist::Verdurian exports no functions by default, in order to avoid
namespace pollution. This enables, for example, Lingua::Zompist::Verdurian and
Lingua::Zompist::Cadhinor to be used in the same program, since otherwise many
of the function names would clash. However, all functions listed here can be
imported explicitly by naming them, or they can be imported all together by
using the tag ':all'.

=head2 A note on the character set used

This module expects input to be in iso-8859-1 (Latin-1) and will return output
in that character set as well. For example, I<redelcE<euml>> (meaning I<woman>)
should have a byte with the value 235 as the last character, and its
accusative, I<redelcE<auml>>, will have a byte with the value 228 as its last
character.

In the future, this module may expect and produce the charset used by the
F<Maraille> font. At that point, the module Lingua::Zompist::Convert is
expected to be available, which should be able to convert between that charset
and standard charsets such as iso-8859-1 and utf-8.

=head2 noun

This function allows you to inflect nouns and pronouns (including personal
pronouns such as I<se> and I<le> and relative and interrogative pronouns
such as I<ktE<euml>>, I<fsya>, and I<ifkio>).

It takes one argument, the noun or pronoun to inflect, and returns an arrayref
on success, or C<undef> or the empty list on failure (for example, because it
could not determine which conjugation a noun belonged to).

In general, the arrayref will have eight elements, in the following order:
nominative singular, genitive singular, accusative singular, dative singular,
nominative plural, genitive plural, accusative plural, dative plural. In some
cases, some of those elements may be C<undef> (especially in the plural of
non-personal pronouns such as I<kio> or I<ifcE<euml>> -- but not I<ke>).

The function should determine the gender and declension of the noun or pronoun
automatically. Nouns ending in I<-a> are taken to be feminine unless they are
on an internal list of masculine nouns in I<-a>. If you find a masculine noun
in I<-a> which is not recognised correctly, please send me email.

Some special notes:

=over 4

=item *

The personal pronouns I<ta>, I<mu>, I<ca>, and I<za> are not recognised by
this function; rather, they are returned as part of I<se>, I<le>, I<ilu> /
I<ila> / I<il>, and I<ze> respectively. So to find out the genitive of I<we>,
look for the genitive plural of I<I>.

=item *

The accusative singular of I<tu> is returned as I<tu/tE<uuml>>, to show that
this form may be either I<tu> (when I<tu> is used as an impersonal pronoun
meaning I<one>) or I<tE<uuml>> (when I<tu> is used as a polite or formal
pronoun meaning I<you>).

=item *

I<fsuda> and I<nikudE<aacute>> do not decline. However, these words are not
checked for in the L<noun|/"noun"> function.

=back

=head2 adj

This function inflects adjectives and the definite article I<so> (which
behaves like a declension I adjective). It expects one argument (the
adjective to decline or the word I<so>) and returns an arrayref on success,
or C<undef> or the empty list on failure.

The arrayref will itself contain two arrayrefs, each with eight elements. The
first arrayref will contain the masculine forms and the second arrayref will
contain the feminine forms. The forms are in the same order as in the arrayref
returned by the L<noun|/"noun"> function. Briefly, this order is nominative -
genitive - accusative - dative in singular and plural.

This function should determine the declension of an adjective automatically.

There is currently no function which returns the declension of an adjective
(partly because the matter is so simple -- declension I adjectives end in
-C/-a, II in -e/-E<euml>, III in -y/-y, and IV in -E<euml>/a); however, if
there is popular demand for such a function it could be quickly added.

=head2 demeric

This function declines a verb in the present tense. It takes the verb to
inflect as its argument and returns an arrayref on success, or C<undef> or the
empty list on failure.

The arrayref will contain six elements, in the following order: first person
singular ("I"), second person singular ("thou"), third person singular
("he/she/it"), first person plural ("we"), second person plural ("[all of]
you"), third person plural ("they").

=head2 scrifel

This function declines a verb in the past tense. It is otherwise similar to the
function L<demeric|/"demeric">.

However, note that I<esan> behaves slightly differently in the past tense.  The
third person singular and plural form returned are I<fue/esne> and
I<fueu/esneu>. I<fue> and I<fueu> are the normal forms for "he/she/it was" and
"they were", but I<esne> and I<esneu> are used in an existential sense, as
"there was" and "there were". (For example, F<Ver2Eng.doc> gives I<esne mudray>
as "there was a wise man" and I<fue mudray> as "he was wise".)

=over 4

=item Note

http://www.zompist.com/morphology.htm only mentions I<esne> in this sense, but
I believe I<esneu> should also be possible. F<Ver2Eng.doc>, on the other hand,
gives a full complement of forms I<esnai, esnei, esne, esnam, esno, esnu>, but
I don't think those are all correct.

=back

=head2 izhcrifel

This function declines a verb in the past anterior tense. It is otherwise
similar to the function L<demeric|/"demeric">.

=head2 ctanec

This function declines a verb in the future tense. It is otherwise similar to
the function L<demeric|/"demeric">.

=head2 epesec

This function declines a verb in the conditional. It is otherwise similar to
the function L<demeric|/"demeric">.

=head2 befel

This function declines a verb in the imperative. It is otherwise similar to the
function L<demeric|/"demeric">.

Note that I<kies> has no imperative.

=head2 classimp

This function declines a verb in the so-called "classical imperative". It is
otherwise similar to the function L<demeric|/"demeric">, except for the fact
that of the six elements in the arrayref that is returned on success, only
elements 1 and 4 have a value, the others being C<undef> -- since the classical
imperative only has forms for I<le> and I<mu>.

Note that I<kies> has no classical imperative.

=head2 part

This function returns the three participles of a verb. It takes the verb as an
argument and returns an arrayref (in scalar context) or a list (in list
context) of three elements: the present participle, the past participle, and
the gerund ("to be E<lt>verbE<gt>ed"). On failure, it returns C<undef> or the
empty list.

Specifically, the form returned for each participle is the masculine nominative
singular form of the participle (which can be considered the citation form).
Since participles decline like declension I adjectives (or declension IV
adjectives, in the case of present participles of verbs of the I<C>
conjugation), the other forms of the participles may be obtained by calling the
L<adj|/"adj"> function, if desired.

=head1 BUGS

This module should handle irregular words correctly. However, if there is a
word that is inflected incorrectly, please send me email and notify me.

However, please make sure that you have checked against a current version of
http://www.zompist.com/morphology.htm or that you asked Mark Rosenfelder
himself; the grammar occasionally changes as small errors are found or words
change.

=head1 SEE ALSO

L<Lingua::Zompist::Kebreni>,
L<Lingua::Zompist::Cadhinor>,
http://www.zompist.com/verdurian.htm,
http://www.zompist.com/morphology.htm

=head1 AUTHOR

Philip Newton, E<lt>pne@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2001, 2002 by Philip Newton.  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

=over 4

=item *

Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer. 

=item *

Redistributions in binary form must reproduce the above copyright notice, this
list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution. 

=back

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=cut
