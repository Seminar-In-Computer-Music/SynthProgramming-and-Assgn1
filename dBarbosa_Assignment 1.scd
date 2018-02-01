
{
Pbind( //Chord Progression
	\midinote, Pseq([[48, 55, 63], [44, 51, 60], [46, 53, 62], [41, 48, 56]], 8),
	\dur, Pseq([4,2,2], inf),
	\amp, Pseq([0.1, 0.09, 0.09], inf),
	\legato, Pseq([1.01,1,1], inf),
	\strum, 0.05
).play(TempoClock(60/60));

8.wait;

Pbind(    //Shiny Arp Texture
	\scale, Scale.minor,
	\degree, Prand([16,17,18,20,22,23,24,26,28], inf),
	\dur, 0.0125,
	\amp, 0.0009
).play(TempoClock(60/60));

16.wait;

Pbind(  //Simple Melody
	\midinote, Pseq([72,75,79,72,74,75,74,72,67,72,72,70,68,67,67],inf),
		\dur, Pseq([1,1,1,1,4],8),
	\amp, Pseq([0.1, 0.09, 0.09], inf),
	\legato, 1,
).play(TempoClock(60/60));
}.fork
