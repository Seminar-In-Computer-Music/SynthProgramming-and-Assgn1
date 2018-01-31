(
SynthDef(\something, { |freq=220, dur=1|
	var sound = SinOsc.ar(freq, mul: 0.6);
	sound * EnvGen.kr(Env.perc(0.01, dur), doneAction: 2);
	Out.ar(0, sound.dup);
}).add;
)

Synth(\something);

s.options.device = "ASIO: ASIO4ALL";

Pdef(\a, 
	Pbind(\instrument, \something,
		\freq, Pseq([220,330,440], inf),
		\dur, Pseq([1,2,3], inf)
	)
);

Pdef(\a).play;
