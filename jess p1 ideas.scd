
(
s.volume = 0;
{
(SynthDef(\eff,
	{arg fre, amp;
			Out.ar([0,1], Line.kr(1, 0, 10)*SinOsc.ar(SinOsc.ar(0.001, pi,1700, 1700))*  // try chaning phase and for freq (.001
			SinOsc.ar(fre, 0, Line.kr(1, 0, 10)*amp*EnvGen.ar(Env([0, 1, 0], [1, SinOsc.ar(0.01, 2pi, 1.5, 1.5)]), 1, 1, 0, 1, 2)))}).add);

 (SynthDef(\eff3,
	{arg fre, amp;
			Out.ar([0,1], AllpassC.ar(MoogFF.ar(Saw.ar(135)*Saw.ar(112)*  // try chaning phase and for freq (.001
				SinOsc.ar(fre, 0, amp*EnvGen.ar(Env([0, 1, 0], [1, SinOsc.ar(0.001, 2pi, 1.5, 1.5)]), 1, 1, 0, 1, 2)), 60, 1.1, 0, 2), 0.5, 0.5, 1.02, 2))}).add);

(SynthDef(\eff2,
	{arg fre, amp;
		Out.ar([0,1], Linen.kr(1, 113, 1)* //what can i do to make it slow in
				MoogFF.ar(Saw.ar(SinOsc.ar(0.0001, 0, 3000, 3000))*SinOsc.ar(fre, 0, amp*EnvGen.ar(Env([0, 1, 0], [5, 6]), 1, 1, 0, 1, 2)), 1600, 17, 0, 13))}).add);

	(SynthDef(\saww,
	{arg fre, amp, line;
			line = Line.ar(0.2, 0.004, 140);
		Out.ar([0,1],
				SinOsc.ar(0.01, 0.2)*Saw.ar(fre, amp*EnvGen.ar(Env([0, 1, 0], [0.02, line, 0]), 1, 1, 0, 1, 2)))}).add);

 (5.do
		(
			{
	arg r = SinOsc.ar(0.01, 0, 800, 800);
	{ Pbind(
		\amp, 0.1,
		\fre, Pseq([Pseries(r, 2, 34)], inf),
		\dur, Pseq([Pseries(0.03, 00.04, 21)], inf),
		\instrument, \eff).play}.defer(3.rand)};

	));

	9.wait;



a =	(Pbind( \amp, 0.085,
	\instrument, \saww,
		\legato, 7.2,
		\fre, Pseq([10, 30, 260, 600, 400, 500, 660, 8800, 110, 132, 220, 2075, 3300], inf),
		\dur, Pseries(0.00002, 0.0000002, 20496 ,)).play;);


a =	(Pbind( \amp, 0.095,
	\instrument, \saww,
		\legato, 7.2,
		\fre, Pseq([1000, 3000, 256, 6000, 4000, 5500, 6600, 8800, 1100, 1320, 220, 275, 330], inf),
		\dur, Pseries(0.02, -0.00000002, 8604)).play;);

r =(Pbind( \amp, 0.435,
	\instrument, \saww,
		\legato, 7.2,
		\fre, Pseq([6000, 4000, 5500, 6600, 8800, 1100, 1320], inf),
		\dur, Pseries(0.1, 0.01, 24)));

	n =(Pbind( \amp, 0.435,
	\instrument, \saww,
		\legato, 7.2,
		\fre, Pseq([6000/2, 4000/3, 5500/2, 6600/3, 8800/2, 1100/3, 1320/2], inf),
		\dur, Pseries(0.13, -0.0013, 130)));


7.wait; //30
//	a.stop;

b = (Pbind(
	\amp, 0.105,
	\instrument, \eff2,
	\fre, Pseq([Pseq([1710, 1910, 5034, 2666, 4099, 11905], 1)], inf),
		\dur, 4.95).play;);

		0.wait;

Pbind(\amp, 0.1095,
	\instrument, \eff2,
	\fre, Pseq([Pseq([1780, 1710, 8767, 3453, 3144, 11643], 1)], inf),
	\dur, 5.95).play;

	3.6.wait;
r.play;
	1.4.wait;
	n.play;
		1.wait;
	//10;

(2.do({
	arg r =  SinOsc.ar(0.001, 0, 200, 200);
	{Pbind(
		\amp, 0.06,
		\fre, Pseq([Pseries(r, 0.02, 34)], inf),
	\dur, Pseq([Pseries(0.03, 00.04, 21)], inf),
			\instrument, \eff3).play}.defer(3.rand)};));
39.wait;
	//a.stop;
	// r.stop;
	//n.stop;

	(6.do({{HPF.ar(Line.ar(0.06, 0.90, 12)*Klank.ar(`[[1/290, 2/1723, 3/424], nil, [1, 1, 1, 1]], PinkNoise.ar([0.007, 0.007])), Line.ar(60, 20000, 5000))}.play}.defer(12.rand);));

	15.wait;
	a.stop;
	5.wait;
	a.start;
2.wait;
	a.stop;
s.volume = -2;
	3.wait;
s.volume = -5;
	1.wait;
	s.volume = -8;
		1.wait;
	s.volume = -30;
}.fork
)
s.quit


