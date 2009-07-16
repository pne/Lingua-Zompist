package Lingua::Zompist::Barakhinei;
# vim:set sw=2 si:

use 5.005;
use strict;
use Carp;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Lingua::Zompist::Barakhinei ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
    demeric
    scrifel
    izhcrifel
    budemeric
    buscrifel
    befel
    part
    noun
    adj
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
	
);
$VERSION = '0.01';

my %verb = (demeric => \&demeric,
            scrifel => \&scrifel,
            izhcrifel => \&izhcrifel,
            budemeric => \&budemeric,
            buscrifel => \&buscrifel,
            befel => \&befel,
            part => \&part,
           );

my @persons = qw(s� l� �t ta mukh k�);

my @cases = qw(nom gen acc dat);

my @numbers = qw(sing pl);

# Some handy things for -i- insertion and moving stress
my $cons = qr/(?:[ctdsknlr]h|[pbtdkgfvszhmnlr])/;
my $vow  = qr/[aeiou�����AEIOU�����]/;

# spirant forms
my %spir = (
  d => 'dh',
  t => 'th',
  p => 'v',
);


# Verbs with stems ending in -c in Cadhinor
my %cadhc = (
  'faichi' => 'faucir',
  'foka'   => 'vocan',
);

# Verbs with stems ending in -g in Cadhinor
my %cadhg = (
  'groch�' => 'grogec',
  'klach�' => 'clager',
  'noch�'  => 'noger',
);

# Verbs with stems ending in -uC in Cadhinor
my %cadhu = (
  'chura'  => 'turan',
  'faichi' => 'faucir',
);

# Verb classes
my %class = (
); # %class

# Separate subjunctive stems
my %subj = (
  laoda => 'loda',
); # %subj


my %demeric = (
  'epeza'   => [ qw( �z� �z� ep� epeza epezu �z�n ) ],
  'eza'     => [ qw( s� s� � eza ezu s�n ) ],
  'f�li'    => [ qw( f�l f�l f�l f�lu f�lu f�l�n ) ],
  'foli'    => [ qw( ful ful fut folu folu fol�n ) ],
  'hizi'    => [ qw( huz hu hut hizu hizu hiz�n ) ],
  'kedh�'   => [ qw( kedh� kedh� kedhu kedha kedhu k�n ) ],
  'lhib�'   => [ qw( lhua lh� lhu lhubu lhubu l�n ) ],
  'nh�'     => [ qw( nhe ni ni nheza nhezu nh�n ) ],
  'oi'      => [ qw( oh fi fit ou ou o�n ) ],
  'shkriv�' => [ qw( shkriva shkri shkri shkrivu shkrivu shkriv�n ) ],
  'shtan�'  => [ qw( sht� sht� sht� shtana shtanu sht�n ) ],
);

sub demeric {
  my $verb  = shift;
  my $class = shift;
  my $stem = $verb;
  my $table;

  return $demeric{$verb} if exists $demeric{$verb};

  if(! defined($class) && exists $class{$verb}) {
    $class = $class{$verb};
  }

  $class = 2 if !defined($class) && $verb =~ /a$/;
  $class = 4 if !defined($class) && $verb =~ /i$/;
  $class = 0 unless defined $class;

  if($verb =~ /�$/ && !defined($class)) {
    return; croak "Can't determine declension for verb $verb";
  }

  if($class == 1 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( a � � u u �n ) ];
  } elsif($stem =~ s/a$//) {
    $table = [ map "$stem$_", qw( � � � a u �n ) ];
  } elsif($class == 3 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( � � � a u �n ) ];
  } elsif($stem =~ s/i$//) {
    $table = [ map "$stem$_", '', qw( � i u u �n ) ];
  } elsif($class == 5 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", '', qw( � � u u un ) ];
  } else {
    return; croak "Can't determine declension for verb $verb";
  }

  # Cadhinor verbs in -c- and -g-
  if($class == 1 || $class == 4 || $class == 5) {
    for(@{$table}[0,3,4,5]) {
      if(exists $cadhc{$verb}) {
        s/ch([auo��]?n?)$/k$1/;
      } elsif(exists $cadhg{$verb}) {
        s/ch([auo��]?n?)$/g$1/;
      }
    }
    for(@{$table}[1,2]) {
      if(exists $cadhc{$verb}) {
        s/k([ei���]n?)$/ch$1/;
      } elsif(exists $cadhg{$verb}) {
        s/g([ei���]n?)$/ch$1/;
      }
    }
  } elsif($class == 2 || $class == 3) {
    for(@{$table}[0]) {
      if(exists $cadhc{$verb}) {
        s/ch([auo��]?n?)$/k$1/;
      } elsif(exists $cadhg{$verb}) {
        s/ch([auo��]?n?)$/g$1/;
      }
    }
    for(@{$table}[1,2]) {
      if(exists $cadhc{$verb}) {
        s/k([ei���]n?)$/ch$1/;
      } elsif(exists $cadhg{$verb}) {
        s/g([ei���]n?)$/ch$1/;
      }
    }
  }

  for(@$table) {
    s/shtu$/kchu/;
    s/sht$/ch/;
    s/g$/k/;
    s/b$/p/;
  }

  # spirantise -d -t -p in 4th and 5th conjugation
  if(($class == 4 || $class == 5) && $verb =~ /$vow[dtp][�ai]$/o) {
    for($table->[0]) {
      s/d$/dh/;
      s/t$/th/;
      s/p$/f/;
    }

    for(@{$table}[3,4,5]) {
      s/d(un?|�n)$/dh$1/;
      s/t(un?|�n)$/th$1/;
      s/p(un?|�n)$/v$1/;
    }
  }

  # front and back vowel alternations for Cadhinor verbs in -u-
  if(exists $cadhu{$verb}) {
    for(@$table) {
      s/i($cons+[aou���]?)$/o$1/;
      s/u($cons+[�i�]n?)$/i$1/;
    }
  }

  return $table;
} # demeric

my %scrifel = (
  'epeza' => [ qw( �zi �zi ep� �zu �z� �z�n ) ],
  'eza'   => [ qw( fuch fuch f� fu fu� f�n ) ],
  'kedh�' => [ qw( kedhi kedhi ki� kedhu kedh� kedh�n ) ],
);

sub scrifel {
  my $verb  = shift;
  my $class = shift;
  my $stem = $verb;
  my $table;

  return $scrifel{$verb} if exists $scrifel{$verb};

  if(! defined($class) && exists $class{$verb}) {
    $class = $class{$verb};
  }

  $class = 2 if $verb =~ /a$/;
  $class = 4 if $verb =~ /i$/;
  $class = 0 unless defined $class;

  if($verb =~ /�$/ && !defined($class)) {
    return; croak "Can't determine declension for verb $verb";
  }

  if($class == 1 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( i � ), '', qw( � � �n ) ];
  } elsif($stem =~ s/a$//) {
    $table = [ map "$stem$_", qw( i i � u � �n ) ];
  } elsif($class == 3 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( i i � u � �n ) ];
  } elsif($stem =~ s/i$//) {
    $table = [ map "$stem$_", qw( i � � � � �n ) ];
  } elsif($class == 5 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( i � ), '', qw( � � �n ) ];
  } else {
    return; croak "Can't determine declension for verb $verb";
  }

  # Cadhinor verbs in -c- and -g-
  if($class == 1 || $class == 2 || $class == 3) {
    for(@$table) {
      if(exists $cadhc{$verb}) {
        s/ch([��u]?)$/k$1/;
        s/k([i�]n?)$/ch$1/;
      } elsif(exists $cadhg{$verb}) {
        s/ch([��u]?)$/g$1/;
        s/g([i�]n?)$/ch$1/;
      }
    }
  } elsif($class == 4) {
    for(@{$table}[2]) {
      if(exists $cadhc{$verb}) {
        s/ch(�)$/k$1/;
      } elsif(exists $cadhg{$verb}) {
        s/ch(�)$/g$1/;
      }
    }
  }

  for(@$table) {
    s/shtu$/kchu/;
    s/g$/k/;
    s/b$/p/;
  }

  # -sht --> -ch in III.sg for 1st conjugation
  # spirantise -d -t -p in 1st conjugation
  if($class == 1) {
    for($table->[2]) {
      s/sht$/ch/;

      if($verb =~ /$vow[dtp][�ai]$/o) {
        s/d$/dh/;
        s/t$/th/;
        s/p$/f/;
      }
    }
  }

  # front and back vowel alternations for Cadhinor verbs in -u-
  if(exists $cadhu{$verb}) {
    for(@$table) {
      s/i($cons+[u�]?)$/o$1/;
      s/u($cons+[�i�]n?)$/i$1/;
    }
  }

  return $table;
} # scrifel

my %izhcrifel = (
  'eza' => [ qw( firi firi fur� furu fur� firi�n ) ],
);

sub izhcrifel {
  my $verb  = shift;
  my $class = shift;
  my $stem = $verb;
  my $table;

  return $izhcrifel{$verb} if exists $izhcrifel{$verb};

  if(! defined($class) && exists $class{$verb}) {
    $class = $class{$verb};
  }

  $class = 2 if $verb =~ /a$/;
  $class = 4 if $verb =~ /i$/;
  $class = 0 unless defined $class;

  if($verb =~ /�$/ && !defined($class)) {
    return; croak "Can't determine declension for verb $verb";
  }

  if($class == 1 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( ri r� �r r� r� r�n ) ];
  } elsif($stem =~ s/a$//) {
    $table = [ map "$stem$_", qw( ri ri r� ru r� r�n ) ];
  } elsif($class == 3 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( ri ri r� ru r� r�n ) ];
  } elsif($stem =~ s/i$//) {
    $table = [ map "$stem$_", qw( ri r� r� r� r� r�n ) ];
  } elsif($class == 5 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", qw( ri r� �r r� r� r�n ) ];
  } else {
    return; croak "Can't determine declension for verb $verb";
  }

  return $table;
} # izhcrifel

my %budemeric = (
  'eza' => [ qw( �shta �sht� �sht� �shta �shtu �sht�n ) ],
);

sub budemeric {
  my $verb  = shift;
  my $class = shift;
  my $stem = $verb;
  my $table;

  return $budemeric{$verb} if exists $budemeric{$verb};

  return demeric($subj{$verb}, $class) if exists $subj{$verb};

  if(! defined($class) && exists $class{$verb}) {
    $class = $class{$verb};
  }

  $class = 2 if $verb =~ /a$/;
  $class = 4 if $verb =~ /i$/;
  $class = 0 unless defined $class;

  if($verb =~ /�$/ && !defined($class)) {
    return; croak "Can't determine declension for verb $verb";
  }

  if($class == 1 && $stem =~ s/�$/t/) {
    $table = [ map "$stem$_", qw( a � � u u �n ) ];
  } elsif($stem =~ s/a$/m/) {
    $table = [ map "$stem$_", qw( � � � a u �n ) ];
  } elsif($class == 3 && $stem =~ s/�$/m/) {
    $table = [ map "$stem$_", qw( � � � a u �n ) ];
  } elsif($stem =~ s/i$/t/) {
    $table = [ map "$stem$_", '', '', qw( i u u �n ) ];
    for(@$table) {
      s/t$/ech/;
      s/tu$/chu/;
      s/t(ti|chu|t�n)$/$1/; # for beshti
    }
  } elsif($class == 5 && $stem =~ s/�$/t/) {
    $table = [ map "$stem$_", '', '', qw( i u u �n ) ];
    for(@$table) {
      s/t$/ech/;
      s/tu$/chu/;
    }
  } else {
    return; croak "Can't determine declension for verb $verb";
  }

  return $table;
} # budemeric


my %buscrifel = (
  'eza' => [ qw( �shka �shk� �shk� �shka �shku �shk�n ) ],
);

sub buscrifel {
  my $verb  = shift;
  my $class = shift;
  my $stem = $verb;
  my $table;

  return $buscrifel{$verb} if exists $buscrifel{$verb};

  return scrifel($subj{$verb}, $class) if exists $subj{$verb};

  if(! defined($class) && exists $class{$verb}) {
    $class = $class{$verb};
  }

  $class = 2 if $verb =~ /a$/;
  $class = 4 if $verb =~ /i$/;
  $class = 0 unless defined $class;

  if($verb =~ /�$/ && !defined($class)) {
    return; croak "Can't determine declension for verb $verb";
  }

  if($class == 1 && $stem =~ s/�$/k/) {
    $table = [ map "$stem$_", qw( a � � u u �n ) ];
    for(@$table) {
      s/k�$/ch�/;
    }
  } elsif($stem =~ s/a$/n/) {
    $table = [ map "$stem$_", qw( � � � a u �n ) ];
  } elsif($class == 3 && $stem =~ s/�$/n/) {
    $table = [ map "$stem$_", qw( � � � a u �n ) ];
  } elsif($stem =~ s/i$/r/) {
    $table = [ map "$stem$_", '', '', qw( i u u �n ) ];
    for(@$table) {
      s/r$/ir/;
    }
  } elsif($class == 5 && $stem =~ s/�$/r/) {
    $table = [ map "$stem$_", '', '', qw( i u u �n ) ];
    for(@$table) {
      s/r$/ir/;
    }
  } else {
    return; croak "Can't determine declension for verb $verb";
  }

  return $table;
} # bucrifel


my %befel = (
);

sub befel {
  my $verb = shift;
  my $class = shift;
  my $stem = $verb;
  my $table;

  return $befel{$verb} if exists $befel{$verb};

  if(! defined($class) && exists $class{$verb}) {
    $class = $class{$verb};
  }

  $class = 2 if $verb =~ /a$/;
  $class = 4 if $verb =~ /i$/;
  $class = 0 unless defined $class;

  if($verb =~ /�$/ && !defined($class)) {
    return; croak "Can't determine declension for verb $verb";
  }

  if($class == 1 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", '', '', 'a', '', '�l', 'an' ];
  } elsif($stem =~ s/a$//) {
    $table = [ map "$stem$_", '', '', 'a', '', 'el', 'an' ];
  } elsif($class == 3 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", '', '', 'a', '', 'el', 'an' ];
  } elsif($stem =~ s/i$//) {
    $table = [ map "$stem$_", '', '', 'a', '', 'u',  'an' ];
  } elsif($class == 5 && $stem =~ s/�$//) {
    $table = [ map "$stem$_", '', '', 'a', '', 'u',  'an' ];
  } else {
    return; croak "Can't determine declension for verb $verb";
  }

  for(@$table) {
    # Cadhinor verbs in -c- and -g-
    if(exists $cadhc{$verb}) {
      s/k([ei���]?)$/ch/;
    } elsif(exists $cadhg{$verb}) {
      s/g([ei���]?)$/ch/;
    }

    s/shtu$/kchu/;
    s/sht(an?)$/kch$1/;
    s/sht$/ch/;
    s/g$/k/;
    s/b$/p/;
  }

  # front and back vowel alternation in II.sg of 2nd and 3rd conjugation
  if($verb =~ /a$/ || $class == 3) {
    for($table->[1]) {
      s/u($cons+)$/i$1/;
    }
  }

  # front and back vowel alternations in III.sg + III.pl
  # and spirantisation
  for(@{$table}[2,5]) {
    s/([dtp])(an?)$/$spir{$1}$2/;
    s/u($cons+an?)$/i$1/;
  }

  # I.sg and I.pl don't exist
  @{$table}[0,3] = (undef, undef);

  return $table;
} # befel


my %part = (
);

# Participles
sub part {
  my $verb = shift;
  my $class = shift;
  my $stem = $verb;

  my($present, $past);

  if(exists $part{$verb}) {
    ($present, $past) = @{ $part{$verb} };
  } else {
    if(! defined($class) && exists $class{$verb}) {
      $class = $class{$verb};
    }

    $class = 2 if $verb =~ /a$/;
    $class = 4 if $verb =~ /i$/;
    $class = 0 unless defined $class;

    if($verb =~ /�$/ && !defined($class)) {
      return; croak "Can't determine declension for verb $verb";
    }

    if($class == 1 && $stem =~ s/�$//) {
      ($past, $present) = map "$stem$_", '�l', 'il';
    } elsif($stem =~ s/a$//) {
      ($past, $present) = map "$stem$_", 'u', '�';
    } elsif($class == 3 && $stem =~ s/�$//) {
      ($past, $present) = map "$stem$_", 'u', '�';
    } elsif($stem =~ s/i$//) {
      ($past, $present) = map "$stem$_", 'u', 'i';
    } elsif($class == 5 && $stem =~ s/�$//) {
      ($past, $present) = map "$stem$_", '�l', '�';
    } else {
      return; croak "Can't determine declension for verb $verb";
    }
  }

  for($past, $present) {
    # Cadhinor verbs in -c- and -g-
    if(exists $cadhc{$verb}) {
      s/ch([auo��])$/k/;
      s/k([ei���])$/ch/;
    } elsif(exists $cadhg{$verb}) {
      s/ch([auo��]?)$/g/;
      s/g([ei���])$/ch/;
    }

    s/shtu$/kchu/;
  }

  return wantarray ? ($present, $past) : [ $present, $past ];
}



my %gender = (
  '�shta' => 'masc',
  'eli' => 'masc',
  'l�nd' => 'masc',

  'kal' => 'neut',
  'manu' => 'neut',
  'n�shti' => 'neut',
  'shkor' => 'neut',
  'shp�' => 'neut',

  'chir' => 'fem',
  'elor�' => 'fem',
  'kabr�' => 'fem',
  'medhi' => 'fem',
  'nor' => 'fem',

  'achel' => 'fem',
  'acher' => 'masc',
  'Achir�' => 'fem',
  '�dh' => 'masc',
  '�dhechu' => 'masc',
  'adipa' => 'masc',
  'adlelek' => 'fem',
  'adlelu' => 'fem',
  'air' => 'fem',
); # %gender

my %plural = (
  '�shta' => '�sht�',
  'eli' => 'eliri',
  'l�nd' => 'l�ndi',

  'kal' => 'kalo',
  'manu' => 'mani',
  'n�shti' => 'n�kchu',
  'shkor' => 'shkoru',
  'shp�' => 'shpao',

  'chir' => 'chir�',
  'elor�' => 'elori�',
  'kabr�' => 'kabrach�',
  'medhi' => 'medhi�',
  'nor' => 'nor�',

  '�dhechu' => '�dhechuni',
); # %plural

sub noun {
  my $noun = shift;
  my $gender = shift;
  my $plural = shift;
  my $table;

  # is it a pronoun?
  # nom acc dat gen   nom acc/dat gen
  return [ qw( s�   s�th s�  (eri)  ta   t� (tand�) ) ] if $noun eq 's�';
  return [ qw( l�   �k   l�  (leri) mukh m� (mund�) ) ] if $noun eq 'l�';
  return [ qw( �t   �t�  �ta  �ti   k�   k� (kand�) ) ] if $noun eq '�t';
  return [ qw( tot  t�   tota toti  k�   k� (kand�) ) ] if $noun eq 'tot';
  return [ qw( k�t  k�t� k�ta k�ti   ), (undef) x 3   ] if $noun eq 'k�t';
  return [ qw( ta   t�   tao (tand�) ), (undef) x 3   ] if $noun eq 'ta';
  return [ qw( mukh m�   m�  (mund�) ), (undef) x 3   ] if $noun eq 'mukh';
  return [ qw( k�   k�   k�  (kand�) ), (undef) x 3   ] if $noun eq 'k�';
  return [ '', qw( z�th zeu zei ), '', qw( zaa zai )  ] if $noun eq 'z�';
  return [ '', qw( zaa  zau zai ),      (undef) x 3   ] if $noun eq 'za';

  # otherwise it's a noun.

  if(!defined($gender) && exists $gender{$noun}) {
    $gender = $gender{$noun};
  }

  if(!defined($gender)) {
    # try to guess based on the ending
    if($noun =~ /a$/) {
      $gender = 'masc';
    } elsif($noun =~ /�$/) {
      $gender = 'fem';
    } elsif($noun =~ /u$/) {
      $gender = 'neut';
    } elsif($noun =~ /$cons$/o && defined $plural && $plural =~ /i$/) {
      $gender = 'masc'; # can't detect anisosyllabic nouns as they
                        # could be neuter
    } elsif($noun =~ /(?:$cons|i)$/o && defined $plural && $plural =~ /[ou]$/) {
      $gender = 'neut';
    } elsif($noun =~ /�$/ && defined $plural && $plural =~ /ao$/) {
      $gender = 'neut';
    } elsif($noun =~ /(?:$cons|i)$/o && defined $plural && $plural =~ /[��]$/) {
      $gender = 'fem';
    } elsif($noun =~ /�$/ && defined $plural && $plural =~ /ach$/) {
      $gender = 'fem';
    } else {
      return; croak "Can't determine gender for noun $noun";
    }
  }

  if(!defined($plural) && exists $plural{$noun}) {
    $plural = $plural{$noun};
  }

  if(!defined($plural)) {
    # try to guess based on the ending
    if($noun =~ /$cons$/o && $gender eq 'masc') {
      $plural = $noun . 'i'; # assume isosyllabic
    } elsif($noun =~ /a$/ && $gender eq 'masc') {
      ($plural = $noun) =~ s/a$/�/;
    } elsif($noun =~ /$cons$/o && $gender eq 'neut') {
      $plural = $noun . 'o'; # more than twice as comman as -u
    } elsif($noun =~ /i$/ && $gender eq 'neut') {
      ($plural = $noun) =~ s/i$/u/;
    } elsif($noun =~ /u$/ && $gender eq 'neut') {
      ($plural = $noun) =~ s/u$/i/;
    } elsif($noun =~ /�$/ && $gender eq 'neut') {
      ($plural = $noun) =~ s/�$/ao/;
    } elsif($noun =~ /$cons$/o && $gender eq 'fem') {
      $plural = $noun . '�'; # "very common"
    } elsif($noun =~ /i$/ && $gender eq 'fem') {
      $plural = $noun . '�';
    } elsif($noun =~ /�$/ && $gender eq 'fem') {
      ($plural = $noun) =~ s/�/i�/;
    } elsif($noun =~ /�$/ && $gender eq 'fem') {
      ($plural = $noun) =~ s/�/ach�/;
    } else {
      return; croak "Can't determine plural for noun $noun";
    }
  }

  my $sgstem = $noun;
  my $plstem = $plural;

  if($gender eq 'masc') {
    if($plstem =~ s/i$//) {
      $table = [ map("$sgstem$_", '', '', 'a', 'o'),
                 map("$plstem$_", 'i', '�', 'ich') ];
    } elsif($sgstem =~ s/a$// && $plstem =~ s/�$//) {
      $table = [ map("$sgstem$_", 'a', '', 'a', 'o'),
                 map("$plstem$_", '�', '�', 'ach') ];
    } else {
      return; croak "Unknown masculine declension for singular $noun and plural $plural";
    }
  } elsif($gender eq 'neut') {
    if($sgstem =~ /$cons$/o && $plstem =~ s/o$//) {
      $table = [ map("$sgstem$_", '', 'u', 'u', 'o'),
                 map("$plstem$_", 'o', 'oi', 'och') ];
    } elsif($sgstem =~ /$cons$/o && $plstem =~ s/u$//) {
      $table = [ map("$sgstem$_", '', 'u', 'u', 'o'),
                 map("$plstem$_", 'u', '�', 'ich') ];
    } elsif($sgstem =~ s/i$// && $plstem =~ s/u$//) {
      $table = [ map("$sgstem$_", 'i', 'i', 'i', 'io'),
                 map("$plstem$_", 'u', '�', 'ich') ];
    } elsif($sgstem =~ s/u$// && $plstem =~ s/i$//) {
      $table = [ map("$sgstem$_", 'u', '', 'u', 'o'),
                 map("$plstem$_", 'i', '�', 'ich') ];
    } elsif($sgstem =~ s/�$// && $plstem =~ s/ao$//) {
      $table = [ map("$sgstem$_", '�', '�', '�', 'ach'),
                 map("$plstem$_", 'ao', 'aoi', 'aoch') ];
    } else {
      return; croak "Unknown neuter declension for singular $noun and plural $plural";
    }
  } elsif($gender eq 'fem') {
    if($sgstem =~ /$cons$/o && $plstem =~ s/�$//) {
      $table = [ map("$sgstem$_", '', 'a', '�', 'ach'),
                 map("$plstem$_", '�', '�i', 'ech') ];
    } elsif($sgstem =~ /$cons$/o && $plstem =~ s/�$//) {
      $table = [ map("$sgstem$_", '', 'e', '�', 'ech'),
                 map("$plstem$_", '�', '�i', 'ech') ];
    } elsif($sgstem =~ /i$/ && $plstem =~ s/i�/i/) {
      $table = [ map("$sgstem$_", '', '', '�', 'ch'),
                 map("$plstem$_", '�', 'a', 'ech') ];
    } elsif($sgstem =~ s/�$// && $plstem =~ s/�$//) {
      $table = [ map("$sgstem$_", '�', 'e', '�', 'ech'),
                 map("$plstem$_", '�', 'a', 'ech') ];
    } elsif($sgstem =~ s/�$// && $plstem =~ s/�$//) {
      $table = [ map("$sgstem$_", '�', 'a', '�', 'ach'),
                 map("$plstem$_", '�', 'a', 'ech') ];
    } else {
      return; croak "Unknown neuter declension for singular $noun and plural $plural";
    }
  } else {
    return; croak "Unknown gender $gender";
  }

  return $table;
}


# Lost consonants which are restored in all but s.nom. and m.s.acc.

my %rootcons = (
  'na' => 'n',
); # %rootcons

sub adj {
  my $adj = shift;
  my $rootcons = shift;
  my $stem = $adj;
  my $table;

  if(!defined($rootcons) && exists $rootcons{$adj}) {
    $rootcons = $rootcons{$adj};
  }

  $rootcons = '' unless defined $rootcons;

  if($stem =~ /$cons$/o || length $rootcons) {
    $table = [ [ $stem, $stem, map "$stem$rootcons$_", qw( a o i � ich ) ],
               [ $stem, map "$stem$rootcons$_", qw( u u o o � ich ) ],
               [ $stem, map "$stem$rootcons$_", qw( a � ach � �i ech ) ] ];
  } elsif($stem =~ s/�$//) {
    $table = [ [ map "$stem$_", qw( � � a o � � �ch ) ],
               [ map "$stem$_", qw( e � � o e � ech ) ],
               [ map "$stem$_", qw( � e � ech � �i ech ) ] ];
  } elsif($stem =~ s/i$//) {
    $table = [ [ map "$stem$_", 'i', '', qw( i io i � ich ) ],
               [ map "$stem$_", qw( i i i io u � ich ) ],
               [ map "$stem$_", qw( i i i� ich i� ia iech ) ] ];
  } else {
    return; croak "Unknown declension for adjective $adj";
  }

  return $table;
}


1;
__END__

=head1 NAME

Lingua::Zompist::Barakhinei - Inflect Barakhinei nouns, verbs, and adjectives

=head1 VERSION

This document refers to version 0.01 of Lingua::Zompist::Barakhinei, released
on 2002-05-24.

=head1 SYNOPSIS

  use Lingua::Zompist::Barakhinei;
  $i_am = Lingua::Zompist::Barakhinei::demeric('eza')->[0];

or

  use Lingua::Zompist::Barakhinei ':all';
  $i_am = demeric('eza')->[0];

or

  use Lingua::Zompist::Barakhinei qw( demeric scrifel );
  $you_know = demeric('shkriv�')->[1];
  $they_had = crifel('ten�')->[5];

  
  $word = noun('belu');  # nouns
  $word = noun('s�');    # pronouns
  $word = noun('mukh');
  $word = adj('kh�t�');  # adjectives

  # verbs
  $word = demeric('ibr�');      # present
  $word = scrifel('ibr�');      # past
  $word = izhcrifel('ibr�');    # past anterior
  $word = budemeric('ibr�');    # present subjunctive
  $word = buscrifel('ibr�');    # past subjunctive
  $word = befel('ibr�');        # imperative
  $word = part('ibr�');         # participles

=head1 DESCRIPTION

=head2 Overview

Lingua::Zompist::Barakhinei is a module which allows you to inflect
Barakhinei words. You can conjugate verbs and decline nouns, pronouns,
and adjectives.

There is one function to inflect nouns and pronouns, and another to
inflect adjectives. Verbs are covered by several functions: one for each
tense or mood and another for the participles.

=head2 Exports

Lingua::Zompist::Barakhinei exports no functions by default, in order to
avoid namespace pollution. This enables, for example,
Lingua::Zompist::Barakhinei and Lingua::Zompist::Cadhinor to be used in
the same program, since otherwise many of the function names would
clash. However, all functions listed here can be imported explicitly by
naming them, or they can be imported all together by using the tag
':all'.

=head2 A note on the character set used

This module expects input to be in iso-8859-1 (Latin-1) and will return
output in that character set as well. For example, I<lelcE<ecirc>>
(meaning I<to see>) should have a byte with the value 234 as the last
character, and its accusative, I<lelcE<acirc>>, will have a byte with
the value 226 as its last character.

In the future, this module may expect and produce the charset used by
the F<Maraille> font. At that point, the module Lingua::Zompist::Convert
is expected to be available, which should be able to convert between
that charset and standard charsets such as iso-8859-1 and utf-8.

=head2 noun

This function allows you to inflect nouns and pronouns.

It takes three arguments:

=over 4

=item *

The noun or pronoun to inflect.

=item *

The gender of the noun (one of 'masc', 'neut', or 'fem'), or C<undef>
for the function to guess. (This can remain C<undef> for pronouns.)

=item *

The (nominative) plural of the noun, or C<undef> for the function to
guess.

In Barakhinei, it is necessary to know the singular, the gender, B<and>
the plural of a noun in order to inflect a noun correctly. However, if
you do know the plural form, you can pass C<undef> to this function and
the function will attempt to guess based on a built-in list of nouns.

=back

C<noun> returns an arrayref on success, or croaks on failure (for
example, because it could not determine which declension or gender a
noun belonged to).

In general, the arrayref will have seven elements, in the following
order: nominative singular, accusative singular, dative singular,
genitive singular, nominative plural, accusative/dative plural, genitive
plural. In some cases, some of those elements may be C<undef>; the most
common case is when you ask for the declension of a plural personal
pronoun such as I<ta> or I<kE<ecirc>t>.

B<Notes:>

=over 4

=item *

If you use a singular personal pronoun as input to this function, you
will get back an arrayref with seven elements, corresponding to both
singular and plural forms of the pronoun. B<Note> that this will cause
the accusative/dative distinction to be thrown in away in the plural
forms, since nouns make no such distinction! So it is better to input
the plural form separately to get the full form.

(This behaviour may change in the future. I'm not sure whether dropping
one form is the right thing to do... singular pronouns may end up
returning only the first four elements filled.)

If you use a plural personal pronoun as input to this function, only the
first four elements will be filled (with the plural forms) and the last
three elements will be C<undef>. This appears to be more DWIMmish (at
least, it is for me -- I've used I<ta>, for example, as input and
wondered why it was being treated as a noun rather than as a personal
pronoun).

=item *

The genitive form of I<sE<ucirc>>, I<lE<ecirc>>, I<ta>, I<mukh>, and
I<kE<acirc>> will be returned in parenthesis to show that it is a
regular adjective and not an undeclined genitive form.

=item *

The reflexive pronouns are listed under the pseudo-nominative forms
I<zE<ecirc>> and I<za>; in the return list, the nominative forms will be
the empty string.

=back

=head2 adj

This function inflects adjectives. It expects two arguments:

=over 4

=item *

The adjective to be inflected

=item *

The root consonant in the oblique forms (for example, for I<na> "north",
which has the root I<nan-> in the oblique forms, pass in C<'na'> and
C<'n'>). If you pass in undef, the function will attempt to guess
whether the adjective has a different oblique stem.

=back

C<adj> returns an arrayref on success and croaks on failure.

The arrayref will itself contain three arrayrefs, each with seven
elements. The first arrayref will contain the masculine forms, the
second arrayref the neuter forms, and the third arrayref the feminine
forms. The forms are in the same order as in the arrayref returned by
the L<noun|/"noun"> function.  Briefly, this order is nominative -
accusative - dative - genitive in the singular and nominative -
accusative/dative - genitive in the plural.

This function should determine the declension of an adjective
automatically.

There is currently no function which returns the declension of an
adjective (partly because the matter is so simple -- declension I
adjectives end in -C or have an extra oblique stem consonant, declension
II adjectives end in -E<ecirc>, and declension III adjectives end in -i);
however, if there is popular demand for such a function it could be
quickly added.

=head2 demeric

This function declines a verb in the present tense. It takes two
arguments:

=over 4

=item *

The verb to be conjugated

=item *

The declension of the verb as an integer (only strictly necessary for
verbs in I<-E<ecirc>>, which can be first, third, or fifth declension,
corresponding to Cadhinor verbs in I<-EC>, I<-EN>, and I<-ER>)

=back

C<demeric> returns an arrayref on success and croaks on failure.

The arrayref will contain six elements, in the following order: first
person singular ("I"), second person singular ("thou"), third person
singular ("he/she/it"), first person plural ("we"), second person plural
("[all of] you"), third person plural ("they").

=head2 scrifel

This function declines a verb in the past tense. It is otherwise similar
to the function L<demeric|/"demeric">.

=head2 izhcrifel

This function declines a verb in the past anterior tense. It is
otherwise similar to the function L<demeric|/"demeric">.

=head2 budemeric

This function declines a verb in the present subjunctive. It is otherwise
similar to the function L<demeric|/"demeric">.

The name derives from Cadhinor grammar terms I<buprilise> "remote" and
I<demeric> "present", since the Barakhinei subjunctive mood derived from
the Cadhinor remote forms of a verb.

=head2 buscrifel

This function declines a verb in the past subjunctive. It is otherwise
similar to the function L<demeric|/"demeric">.

The name derives from Cadhinor grammar terms I<buprilise> "remote" and
I<scrifel> "past", since the Barakhinei subjunctive mood derived from
the Cadhinor remote forms of a verb.

=head2 befel

This function declines a verb in the imperative. It is otherwise similar
to the function L<demeric|/"demeric">.

=over 4

=item Note

The first and fourth elements of the arrayref will be empty, since
Barakhinei has no first person imperative, neither singular nor plural.

=back

=head2 part

This function returns the two participles of a verb. It takes the verb
and declension number (compare L</demeric>) as an argument and returns
an arrayref (in scalar context) or a list (in list context) of two
elements: the present participle and the past participle. On failure,
this function croaks.

Specifically, the form returned for each participle is the masculine
nominative singular form of the participle (which is the citation form).
Since participles decline like regular adjectives (with an oblique stem
consonant of 'l' in the case of participles in I<-u>), the other forms
of the participles may be obtained by calling the L<adj|/"adj">
function, if desired.

=head1 BUGS

This module should handle irregular words correctly. However, if there
is a word that is inflected incorrectly, please send me email and notify
me. (Since Barakhinei has all sorts of funky sound changes, I wouldn't
be surprised if this module makes mistakes! However, I think it handles
correctly all the examples on the web page as of 2002-05-24.)

However, please make sure that you have checked against a current
version of http://www.zompist.com/bara.htm or that you asked Mark
Rosenfelder himself; the grammar occasionally changes as small errors
are found or words change.

=head1 TODO

Flesh out the dictionary from baralex.htm.

=head1 SEE ALSO

L<Lingua::Zompist::Verdurian>,
L<Lingua::Zompist::Kebreni>,
L<Lingua::Zompist::Cadhinor>,
http://www.zompist.com/bara.htm

=head1 FEEDBACK

If you use this module, I'd appreciate it if you drop me a line at the
email address in L</AUTHOR>, just so that I have an idea of how many
people use this module at all. Also, if you have any comments, feel free
to email me.

=head1 AUTHOR

Philip Newton, E<lt>pne@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

(This is basically the BSD licence.)

Copyright (C) 2002 by Philip Newton.  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

=over 4

=item *

Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer. 

=item *

Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution. 

=back

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=cut
