//Trio of playable Ndefs, launch GUIs & mix

// Compile 1
(
Ndef(\zomb, { arg freq=60, dur=0.5, fb=0;
	var sig = SinOscFB.ar([freq, freq*23], [fb, fb*200]);
	sig*EnvGen.kr(Env.new([0,1,0,0], [0.01,dur,0.01],-4,2,0));
});
)

// Compile 2
(
Ndef(\bomb, { arg freq=5000, dur=0.01, fb=0.05;
	var sig = SinOsc.ar(Gendy1.kr)+SinOscFB.ar([freq, freq*800], [fb, fb*100]);
	sig*EnvGen.kr(Env.new([0,1,0,0], [0.01,dur,0.01],-4,2,0));
});
)

//Compile 3
(
Ndef(\comb, { arg f1=23, f2=500, dur=0.25, pw=0;
	var sig = Formant.ar([f1, f1*100], [f2, f2*100], [pw, pw*500]);
	sig*EnvGen.kr(Env.new([0, 1, 0, 0], [0.01,dur,0.01],-4,2,0,));
});
)


// Launch & Play
(
Ndef(\zomb).play.gui;

Ndef(\bomb).play.gui;

Ndef(\comb).play.gui;
)


// SynthDefs & Pdefs, fun to play simultaneously

// Compile 1
(
SynthDef(\omb, {
	|freq=200, out=0|
	var sig;
	sig = SinOscFB.ar(freq, LinCongL.ar(freq/50, 5, 15, 1, 50))
	+ Formant.ar(freq*2, freq*5, freq*1200)
	+ SinOsc.ar(Gendy1.ar(5, 12, 0.07, 0.5, 0.005, 1000, -0.9, 0.8, freq/12, freq*12))
	* EnvGen.kr(Env.perc(0.0023, 0.5), doneAction:2);
	Out.ar(out, sig)
}).add;
)

// Test 1
Synth(\omb)

//Compile 1
(~fund = 200;

Pdef(\omb,
	Pbind(
		\instrument, \omb,
		\freq, Prand([~fund, ~fund*7/4, ~fund*3/8, ~fund*12/2, ~fund*1/1, ~fund*85/100], inf),
	\dur, Prand([0.5, 0.8, 0.25, 1, 0.1, 0.2, 0.3, 0.4, 0.05, 2, 0.8, 5], inf),
	\amp, 0.8))
)

//Launch 1
Pdef(\omb).play;

//Compile 2

(
SynthDef(\omb2, {
	|freq=200, out=0|
	var sig;
	sig = SinOscFB.ar(freq, LinCongL.ar(freq/50, 5, 15, 1, 50))
	+ Formant.ar(freq*2, freq*5, freq*1200)
	+ SinOsc.ar(Gendy1.ar(5, 12, 0.07, 0.5, 0.005, 1000, -0.9, 0.8, freq/12, freq*12))
	* EnvGen.kr(Env.perc(0.0023, 5), doneAction:2);
	Out.ar(out, sig)
}).add;
)

// Test 2
Synth(\omb2)

//Compile 2
(~fund = 200;

Pdef(\omb2,
	Pbind(
		\instrument, \omb2,
		\freq, Prand([~fund, ~fund*7/4, ~fund*3/8, ~fund*12/2, ~fund*1/1, ~fund*85/100], inf),
	\dur, Prand([0.5, 0.8, 0.25, 1, 0.1, 0.2, 0.3, 0.4, 0.05, 2, 0.8, 5], inf),
	\amp, 0.8))
)

//Launch 2
Pdef(\omb2).play;
