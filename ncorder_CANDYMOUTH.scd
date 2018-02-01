(
SynthDef(\kick, {
			arg freq=440, gate=1, amp=0.09, source, pan = 0.0 ;
			source =
			Pan2.ar(
			SinOsc.ar(EnvGen.kr(Env.perc(0.0001, 2.5, 1, -200), gate, 1000, 45, doneAction:2), 1, 1) +
			((BPF.ar([GrayNoise.ar(8),GrayNoise.ar(8)],EnvGen.kr(Env.perc(0.001, 0.3, 1, -200), gate, 6000, 70), 1.5)).distort * Line.kr(0.3,0,0.1))
			*
			EnvGen.kr(Env.perc(0.001, 0.22, amp, 8)),0);
			Out.ar(0, source);
		}).add;

		SynthDef(\shaker, {
			arg freq=440, gate=1, amp=0.1, source, pan = 0.0 ;
			source =
			Pan2.ar(BPF.ar(WhiteNoise.ar(16),10000,0.2).distort * EnvGen.kr(Env.perc( (1-amp*0.02)+0.01 , ((amp*amp)*1.0 + 0.1), amp*amp*0.8+0.2, -6), gate, doneAction:2),Rand(-0.3,0.3));
			Out.ar(0, source);
		}).add;

		SynthDef(\hat, {
			arg freq=440, gate=1, amp=0.3, source, pan = 0.0 ;
			source =
			Pan2.ar(BPF.ar(LFPulse.ar(BPF.ar(WhiteNoise.ar(freq),freq,0.1).distort * freq + 6600, amp),7000,amp) * EnvGen.kr(Env.perc(0.01, 0.4, 1, -6), doneAction:2),0);
			Out.ar(0, source);
		}).add;

		SynthDef(\clap, {
			arg freq=440, gate=1, amp=1.0, source, pan = 0.0 ;
			source =
			Pan2.ar((BPF.ar(BPF.ar(WhiteNoise.ar(16),2300,0.3),8300,0.3)*5).distort * EnvGen.kr(Env.perc(0.01, 0.1, 1, 0), doneAction:2),0);
			Out.ar(0, source);
		}).add;

		SynthDef(\analog_snare, {
        arg outBus=0;
        var env, env2, env3, pch, osc, noise, out;
        env = EnvGen.kr(Env.perc(0, 0.05, 1, -5));
        env2 = EnvGen.kr(Env.new([56,3,0],[0.08,0.1],[-20,-5]));
        env3 = EnvGen.kr(Env.new([0.5,0,0.5,0],[0.001,0.001,0.16],[0,-3,-8]), doneAction:2);
        pch = (49+env2).midicps;
        osc = SinOsc.ar(pch, 0, env);
        noise = BPF.ar(WhiteNoise.ar(env3), 9000, 2);
        out = osc+noise;
        Out.ar(outBus, out.dup);
    }).add;

    SynthDef(\analog_hat, {
        arg outBus=0, decay=0.05;
        var env, pch, osc, noise, out;
        env = EnvGen.kr(Env.perc(0, decay, 1, -6), doneAction:2);
        pch = (9000+SinOsc.ar(320, 0, 2000));
        osc = SinOsc.ar(pch, 0, 0.5);
        noise = WhiteNoise.ar;
        out = osc + noise;
        out = BPF.ar(out, 12000, 0.3, env);
        Out.ar(outBus, out.dup);
    }).add;
)
(
var a,b,c,d,e;
a=Ppar([

	Pbind(
	\instrument,\kick,
	\degree, Pseq([0,1,3,5,7,11],20),
	\amp, Pexprand(0.09, 0.1, inf),
	\dur, 1/16),

	Pbind(
	\instrument,\analog_hat,
	\degree, Pseq([0,1,3,5,7,11],20),
	\amp, Pexprand(0.01, 0.2, inf),
	\dur, 1/12),

	Pbind(
	\degree,Pseq([0.5,1.5,3.5,5.5,7.5,11.5],20),
	\amp, Pexprand(0.8, 1, inf),
	\dur, 1/8),
]);

b=Ppar([
Pbind(
	\instrument,\kick,
	\degree, Pseq([0,1,3,5,7,11],20),
	\amp, Pexprand(0.5, 0.6, inf),
	\dur, 1/8),

	Pbind(
	\instrument,\clap,
	\degree, Pseq([0,1,3,5,7,11],20),
	\amp, Pexprand(0.01, 0.02, inf),
	\dur, 1/6),

	Pbind(
	\instrument,\analog_hat,
	\degree, Pseq([2,4,6,7,8],20),
	\amp, Pexprand(0.5, 0.7, inf),
	\dur, 1/16),

	Pbind(
	\dur, Pseq([1,3,5,5,11],inf),
	\degree,Pseq([1.5,2.5,4.5,6.5,8.5,12.5],20),
	\amp, Pexprand(0.8, 0.1, inf),
	\dur, 1/5),
]);

c=Ppar([
Pbind(
	\instrument,\kick,
		\degree, Pseq([0,1,3,5,7,11],20),
	\amp, Pexprand(0.5, 0.6, inf),
	\dur, 1/4),

	Pbind(
	\instrument,\analog_snare,
	\dur, Pshuf([0.1,0.3,0.5,0.7,0.11],20),
	\degree, Pseq([0,1,3,5,7,11],20),
	\amp, Pexprand(0.1, 0.5, inf),
	\dur, 1/8),

	Pbind(
	\instrument,\analog_hat,
		\dur, Pshuf([0.1,0.3,0.5,0.7,0.11],20),
	\degree, Pseq([0,1,3,5,7,11],10),
	\amp, Pexprand(0.01, 0.2, inf),
	\dur, 1/16),

	Pbind(
	\dur, Pseq([1,3,5,5,11,13],20),
	\degree,Pseq([1,1,1.5,1,1.5,12.5,4.5,6.5,8.5,12.5],20),
	\amp, Pexprand(0.8, 1, inf),
	\dur, 1/12),
]);

d=Ppar([
Pbind(
	\instrument,\kick,
	\degree, Pseq([0,1,3,5,7,11],4),
	\amp, Pexprand(0.5, 0.8, inf),
	\dur, 1/2),

	Pbind(
	\degree, Pseq([0,1,3,5,7,11],4),
	\amp, Pexprand(0.5, 1, inf),
		\dur, 1/2),
]);

e= Pseq([
	Pseq([a,b,a]),
	Pseq([b,c,b]),
	Pseq([c,a,c,a,d])]);
e.play(TempoClock(3));
)










