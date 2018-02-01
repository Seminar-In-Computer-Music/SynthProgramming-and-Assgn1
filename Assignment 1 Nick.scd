/*
Eb4 311.13	110.89
E4	329.63	104.66
F4	349.23	98.79
Gb4 369.99	93.24
G4	392.00	88.01
Ab4 415.30	83.07
A4	440.00	78.41
Bb4 466.16	74.01
B4	493.88	69.85
C5	523.25	65.93
Db5 554.37	62.23
D5	587.33	58.74
Eb5 622.25	55.44
E5	659.25	52.33
F5	698.46	49.39
Gb5 739.99	46.62
G5	783.99	44.01
Ab5 830.61	41.54
A5	880.00	39.20
Bb5 932.33	37.00
B5	987.77	34.93
C6	1046.50	32.97
Db6 1108.73	31.12
D6	1174.66	29.37
*/

(
SynthDef(\green,{|freq=300,dur=0.2,amp=0.4|
	var sig = LFTri.ar(freq);
	sig = sig*EnvGen.kr(Env.perc(0.3, 0.5, 0.4, -4),doneAction: 2);
	sig = Resonz.ar(sig, XLine.ar(100,1000, 0.2), 1, 1);
	sig = Pan2.ar(sig, SinOsc.kr(0.5), 0.3);
	Out.ar(0,sig*amp)
}).add;
)

Synth(\green);

(
Pdef(\q,
	Pbind(\instrument,\green,
		\freq,Pseq([311, 415, 466, 554],inf),
		\amp,0.6,
		\dur,0.3
	)
);
)
Pdef(\q).play


(
SynthDef(\red,{|freq=300,dur=0.5,amp=0.4|
	var siga = LFTri.ar(freq);
	siga = siga*EnvGen.kr(Env.perc(0.05, 0.5, 0.5, -4),doneAction: 2);
	siga = Ringz.ar(siga, Line.kr(1000, 10, 0.1), 0.1, 0.1);
	siga = Pan2.ar(siga, SinOsc.kr(-0.5), 0.3);
	Out.ar(0,siga*amp)
}).add;
)

Synth(\red);

(
Pdef(\p,
	Pbind(\instrument,\red,
		\freq,Pseq([493, 622, 698, 830, 932],inf),
		\amp,0.3,
		\dur,0.2
	)
);
)
Pdef(\p).play

(
SynthDef(\blue,{|freq=300,dur=0.2,amp=0.2|
	var sigb = PinkNoise.ar([freq,freq*0.97]);
	sigb = sigb*EnvGen.kr(Env.perc(0.3, 0.5, 0.2, -4),doneAction: 2);
	sigb = Resonz.ar(sigb, freq, 0.1, 0.1);
	sigb = Pan2.ar(sigb);
	Out.ar(0,sigb*amp)
}).add;
)

Synth(\blue);

(
Pdef(\r,
	Pbind(\instrument,\blue,
		\freq,Prand([311, 415, 466, 554],inf),
		\amp,0.2,
		\dur,0.6
	)
);
)

Pdef(\r).play

Pdef(\s,Ppar([Pdef(\p),Pdef(\q),Pdef(\r)]));
Pdef(\s).play
Pdef(\s).stop