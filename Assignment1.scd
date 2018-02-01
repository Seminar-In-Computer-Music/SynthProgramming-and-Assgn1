
(
SynthDef(\boom,{|freq=103.59,dur=0.11,amp=0.2,fold=1.05|
	var sig = SinOsc.ar([freq,freq*0.97],[0,2pi*0.015]); // creates stereo chorus
	sig = sig*EnvGen.kr(Env.perc,doneAction: 2);
	sig = sig.fold2(fold);   // creates clip
	Out.ar(0,sig*amp)
}).add;
)
Synth(\boom);


(
Pbind(\freq,Pseq([50,60,60,40,40],50),
	\instrument,\boom,
	\dur,Pseq([0.3,0.2,0.2,0.5],inf),
		).play;

Pbind(\freq,Prand([110,90,109,105,100],50),
	\instrument,\boom,
	\dur,Pseq([0.2,0.2,0.2,0.2],inf),
		).play;

Pbind(\freq,Pseq([100,80,99,95,90],50),
	\instrument,\boom,
	\dur,Prand([0.1,0.1,0.2,0.2,0.25,0.2,0.25,0.1],inf),
		).play;
)

(
Pbind(\freq,Prand([120,170,189,185,180],80),
	\instrument,\boom,
	\dur,Pseq([0.2,0.2,0.2,0.2],inf),
		).play;

Pbind(\freq,Prand([140,190,109,105,100],80),
	\instrument,\boom,
	\dur,Pseq([0.2,0.2,0.2,0.2],inf),
		).play;

Pbind(\freq,Pseq([140,190,109,105,120],80),
	\instrument,\boom,
	\dur,Pseq([0.2,0.2,0.2,0.2],inf),
		).play;
)

(
Pbind(\freq,Prand([320,370,389,385,380],80),
	\instrument,\boom,
	\dur,Pwhite(0.1,0.2),
		).play;

Pbind(\freq,Prand([340,390,309,205,100],80),
	\instrument,\boom,
	\dur,Pseq([0.2,0.2,0.2,0.2],inf),
		).play;

Pbind(\freq,Pseq([240,290,309,305,220],80),
	\instrument,\boom,
	\dur,Pwhite(0.1,0.2),
		).play;
)





