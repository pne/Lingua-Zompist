# vim:set filetype=perl sw=4 et:

use Test::More tests => 92;
use Carp;

BEGIN { use_ok 'Lingua::Zompist::Cadhinor', '%verb'; }

is($verb{static}{definite}{present}->('SCRIFEC')->[0], 'SCRIFAO', 'static definite present');
is($verb{static}{prilise}{demeric}->('SCRIFEC')->[0], 'SCRIFAO', 'static prilise demeric');
is($verb{definite}{present}->('SCRIFEC')->[0], 'SCRIFAO', 'definite present');
is($verb{prilise}{demeric}->('SCRIFEC')->[0], 'SCRIFAO', 'prilise demeric');
is($verb{static}{present}->('SCRIFEC')->[0], 'SCRIFAO', 'static present');
is($verb{static}{demeric}->('SCRIFEC')->[0], 'SCRIFAO', 'static demeric');
is($verb{present}->('SCRIFEC')->[0], 'SCRIFAO', 'present');
is($verb{demeric}->('SCRIFEC')->[0], 'SCRIFAO', 'demeric');

is($verb{static}{definite}{past}->('SCRIFEC')->[1], 'SCRIFIUS', 'static definite past');
is($verb{static}{prilise}{scrifel}->('SCRIFEC')->[1], 'SCRIFIUS', 'static prilise scrifel');
is($verb{definite}{past}->('SCRIFEC')->[1], 'SCRIFIUS', 'definite past');
is($verb{prilise}{scrifel}->('SCRIFEC')->[1], 'SCRIFIUS', 'prilise scrifel');
is($verb{static}{past}->('SCRIFEC')->[1], 'SCRIFIUS', 'static past');
is($verb{static}{scrifel}->('SCRIFEC')->[1], 'SCRIFIUS', 'static scrifel');
is($verb{past}->('SCRIFEC')->[1], 'SCRIFIUS', 'past');
is($verb{scrifel}->('SCRIFEC')->[1], 'SCRIFIUS', 'scrifel');

is($verb{static}{definite}{pastanterior}->('SCRIFEC')->[2], 'SCRIFERU', 'static definite pastanterior');
is($verb{static}{prilise}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERU', 'static prilise izhcrifel');
is($verb{definite}{pastanterior}->('SCRIFEC')->[2], 'SCRIFERU', 'definite pastanterior');
is($verb{prilise}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERU', 'prilise izhcrifel');
is($verb{static}{pastanterior}->('SCRIFEC')->[2], 'SCRIFERU', 'static pastanterior');
is($verb{static}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERU', 'static izhcrifel');
is($verb{pastanterior}->('SCRIFEC')->[2], 'SCRIFERU', 'pastanterior');
is($verb{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERU', 'izhcrifel');

is($verb{static}{definite}{"past anterior"}->('SCRIFEC')->[2], 'SCRIFERU', 'static definite "past anterior"');
is($verb{static}{prilise}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERU', 'static prilise izhcrifel');
is($verb{definite}{"past anterior"}->('SCRIFEC')->[2], 'SCRIFERU', 'definite "past anterior"');
is($verb{prilise}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERU', 'prilise izhcrifel');
is($verb{static}{"past anterior"}->('SCRIFEC')->[2], 'SCRIFERU', 'static "past anterior"');
is($verb{static}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERU', 'static izhcrifel');
is($verb{"past anterior"}->('SCRIFEC')->[2], 'SCRIFERU', '"past anterior"');
is($verb{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERU', 'izhcrifel');

is($verb{static}{definite}{imperative}->('SCRIFEC'), undef, 'static definite imperative');
is($verb{static}{prilise}{befel}->('SCRIFEC'), undef, 'static prilise befel');
is($verb{definite}{imperative}->('SCRIFEC'), undef, 'definite imperative');
is($verb{prilise}{befel}->('SCRIFEC'), undef, 'prilise befel');

is($verb{static}{remote}{present}->('SCRIFEC')->[3], 'SCRIFETOM', 'static remote present');
is($verb{static}{buprilise}{demeric}->('SCRIFEC')->[3], 'SCRIFETOM', 'static buprilise demeric');
is($verb{remote}{present}->('SCRIFEC')->[3], 'SCRIFETOM', 'remote present');
is($verb{buprilise}{demeric}->('SCRIFEC')->[3], 'SCRIFETOM', 'buprilise demeric');

is($verb{static}{remote}{past}->('SCRIFEC')->[4], 'SCRIFECOS', 'static remote past');
is($verb{static}{buprilise}{scrifel}->('SCRIFEC')->[4], 'SCRIFECOS', 'static buprilise scrifel');
is($verb{remote}{past}->('SCRIFEC')->[4], 'SCRIFECOS', 'remote past');
is($verb{buprilise}{scrifel}->('SCRIFEC')->[4], 'SCRIFECOS', 'buprilise scrifel');

is($verb{static}{remote}{pastanterior}->('SCRIFEC'), undef, 'static remote pastanterior');
is($verb{static}{buprilise}{izhcrifel}->('SCRIFEC'), undef, 'static buprilise izhcrifel');
is($verb{remote}{pastanterior}->('SCRIFEC'), undef, 'remote pastanterior');
is($verb{buprilise}{izhcrifel}->('SCRIFEC'), undef, 'buprilise izhcrifel');

is($verb{static}{remote}{"past anterior"}->('SCRIFEC'), undef, 'static remote "past anterior"');
is($verb{static}{buprilise}{izhcrifel}->('SCRIFEC'), undef, 'static buprilise izhcrifel');
is($verb{remote}{"past anterior"}->('SCRIFEC'), undef, 'remote "past anterior"');
is($verb{buprilise}{izhcrifel}->('SCRIFEC'), undef, 'buprilise izhcrifel');

is($verb{static}{remote}{imperative}->('SCRIFEC')->[1], 'SCRIFE', 'static remote imperative');
is($verb{static}{buprilise}{befel}->('SCRIFEC')->[1], 'SCRIFE', 'static buprilise befel');
is($verb{remote}{imperative}->('SCRIFEC')->[1], 'SCRIFE', 'remote imperative');
is($verb{buprilise}{befel}->('SCRIFEC')->[1], 'SCRIFE', 'buprilise befel');
is($verb{static}{imperative}->('SCRIFEC')->[1], 'SCRIFE', 'static imperative');
is($verb{static}{befel}->('SCRIFEC')->[1], 'SCRIFE', 'static befel');
is($verb{imperative}->('SCRIFEC')->[1], 'SCRIFE', 'imperative');
is($verb{befel}->('SCRIFEC')->[1], 'SCRIFE', 'befel');


is($verb{dynamic}{definite}{present}->('SCRIFEC')->[0], 'SCRIFUI', 'dynamic definite present');
is($verb{dynamic}{prilise}{demeric}->('SCRIFEC')->[0], 'SCRIFUI', 'dynamic prilise demeric');
is($verb{dynamic}{present}->('SCRIFEC')->[0], 'SCRIFUI', 'dynamic present');
is($verb{dynamic}{demeric}->('SCRIFEC')->[0], 'SCRIFUI', 'dynamic demeric');

is($verb{dynamic}{definite}{past}->('SCRIFEC')->[1], 'SCRIFEVUIS', 'dynamic definite past');
is($verb{dynamic}{prilise}{scrifel}->('SCRIFEC')->[1], 'SCRIFEVUIS', 'dynamic prilise scrifel');
is($verb{dynamic}{past}->('SCRIFEC')->[1], 'SCRIFEVUIS', 'dynamic past');
is($verb{dynamic}{scrifel}->('SCRIFEC')->[1], 'SCRIFEVUIS', 'dynamic scrifel');

is($verb{dynamic}{definite}{pastanterior}->('SCRIFEC')->[2], 'SCRIFERUT', 'dynamic definite pastanterior');
is($verb{dynamic}{prilise}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERUT', 'dynamic prilise izhcrifel');
is($verb{dynamic}{pastanterior}->('SCRIFEC')->[2], 'SCRIFERUT', 'dynamic pastanterior');
is($verb{dynamic}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERUT', 'dynamic izhcrifel');

is($verb{dynamic}{definite}{"past anterior"}->('SCRIFEC')->[2], 'SCRIFERUT', 'dynamic definite "past anterior"');
is($verb{dynamic}{prilise}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERUT', 'dynamic prilise izhcrifel');
is($verb{dynamic}{"past anterior"}->('SCRIFEC')->[2], 'SCRIFERUT', 'dynamic "past anterior"');
is($verb{dynamic}{izhcrifel}->('SCRIFEC')->[2], 'SCRIFERUT', 'dynamic izhcrifel');

is($verb{dynamic}{definite}{imperative}->('SCRIFEC'), undef, 'dynamic definite imperative');
is($verb{dynamic}{prilise}{befel}->('SCRIFEC'), undef, 'dynamic prilise befel');

is($verb{dynamic}{remote}{present}->('SCRIFEC')->[3], 'SCRIFUAM', 'dynamic remote present');
is($verb{dynamic}{buprilise}{demeric}->('SCRIFEC')->[3], 'SCRIFUAM', 'dynamic buprilise demeric');

is($verb{dynamic}{remote}{past}->('SCRIFEC')->[4], 'SCRIFISAS', 'dynamic remote past');
is($verb{dynamic}{buprilise}{scrifel}->('SCRIFEC')->[4], 'SCRIFISAS', 'dynamic buprilise scrifel');

is($verb{dynamic}{remote}{pastanterior}->('SCRIFEC'), undef, 'dynamic remote pastanterior');
is($verb{dynamic}{buprilise}{izhcrifel}->('SCRIFEC'), undef, 'dynamic buprilise izhcrifel');

is($verb{dynamic}{remote}{"past anterior"}->('SCRIFEC'), undef, 'dynamic remote "past anterior"');
is($verb{dynamic}{buprilise}{izhcrifel}->('SCRIFEC'), undef, 'dynamic buprilise izhcrifel');

is($verb{dynamic}{remote}{imperative}->('SCRIFEC')->[1], 'SCRIFE', 'dynamic remote imperative');
is($verb{dynamic}{buprilise}{befel}->('SCRIFEC')->[1], 'SCRIFE', 'dynamic buprilise befel');
is($verb{dynamic}{imperative}->('SCRIFEC')->[1], 'SCRIFE', 'dynamic imperative');
is($verb{dynamic}{befel}->('SCRIFEC')->[1], 'SCRIFE', 'dynamic befel');

is($verb{part}->('SCRIFEC')->[0], 'SCRIFILES', 'part');
