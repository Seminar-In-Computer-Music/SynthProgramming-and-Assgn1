//Pbind Sequences! <3
(
t=TempoClock(135*4/60);

~psytrancef1=[Pn([7000,Pn(100,3)],7),7000,Pn(120,3)];
~psytrancef2=[Pn([50,Pn(100,3)],7),60,Pn(120,3)];
~fouronfloordur=[1,Rest(3)];
~tomrhythm=[1,Rest(1)];
~bassstab=Pseq([[220,330],Rest(2),[220,330],Rest(2),[220,330],Rest(1),[220,330],Rest(3),[220,330],Rest(3)],inf)/Prand([1,2],inf);
~boomchuckchord=[Rest(2),[220,330],Rest(1)];
~fouronfloorez=[1,Rest(3),1,Rest(3),1,Rest(3),1,Rest(3),1,Rest(3),1,Rest(3),1,Rest(3),1,Rest(1),1,Rest(1)];
~triplebeatdur=[1,Rest(2),1,Rest(2),1,Rest(1),1,Rest(3),1,Rest(3),1,Rest(2),1,Rest(2),1,Rest(1),1,Rest(3),1,Rest(3)];

Pbind(\instrument,\kick,
	\pitchdecay, Pwhite(0.001,0.005,inf),
	\voldecay, Pseq([Pn(0.3,18),Pn(0.2,18)],inf),
	\freq1, Pseq([3000],inf),
	\freq2, Pseq([Pn(55,18),Pn(55,18)],inf),
	\dur, Pseq(~fouronfloorez,inf);
).play(t);

Pbind(\instrument,\hh,
	\vol1, 0.5,
	\vol2, 0,
	\fltr1, 400,
	\fltr2, 20,
	\fltrdecay, 0.3,
	\q, 1,
	\trem, 1000,
	\voldecay, 0.08,
	\dur, Pseq([Rest(4),1,Rest(3)],inf);
).play(t);

Pbind(\instrument,\hh,
	\vol1, 0.5,
	\vol2, 0,
	\fltr1, 9000,
	\fltr2, 4000,
	\fltrdecay, 0.5,
	\q, 1,
	\trem, 1000,
	\voldecay, 0.05,
	\pan, 0.5,
	\dur, Pseq([Rest(2),1,Rest(1),Rest(2),1,Rest(1),Rest(1),1,Rest(2),Rest(2),1,Rest(1)],inf);
).play(t);

Pbind(\instrument,\hh,
	\vol1, 0.5,
	\vol2, 0,
	\fltr1, 10000,
	\fltr2, 7000,
	\fltrdecay, 0.5,
	\q, 1,
	\trem, 800,
	\voldecay, 0.02,
	\pan, -0.5,
	\dur, Pseq([Rest(1),1,Rest(1),1,Rest(4),Rest(2),1,1,Rest(2),1,1],inf);
).play(t);

//Pbind(\instrument,\kick,
//	\vol1, 0.4,
//	\vol2, 0,
//	\pitchdecay, 0.02,
//	\voldecay, Pseq([Pn(0.05,20),Pn(0.02,10),Pn(0.01,10)],inf),
//	\freq1, Pxrand([1320,1680,1760,Rest(2)],inf)/2,
//	\freq2, Pxrand([1320,1680,1760,Rest(2)],inf)/2,
//	\dur, 1,
//	\pan, Pwhite(-1,1,inf);
//).play(t);

Pbind(\instrument,\kick,
	\vol1, 0.3,
	\vol2, 0,
	\pitchdecay, 0.02,
	\voldecay, Pseq([Pn(0.1,20),Pn(0.04,10),Pn(0.02,10)],inf),
	\freq1, Pxrand([2640,3360,3520,Rest(2)],inf),
	\freq2, Pxrand([2640,3360,3520,Rest(2)],inf),
	\dur, 1,
	\pan, Pwhite(-1,1,inf);
).play(t);

Pbind(\instrument,\simpleSaw,
		\vol1, 1,
		\vol2, 0,
	\pitchdecay, 0.005,
	\freq1, Pseq([220,Rest(1),440,Rest(3),660,Rest(1),1320,Rest(1),1500,Rest(3),2640,Rest(1),880,Rest(1),1720,Rest(3)],inf)/Pxrand([16,8,4,2],inf),
\freq2, Pseq([220,Rest(1),440,Rest(3),660,Rest(1),1320,Rest(1),1500,Rest(3),2640,Rest(1),880,Rest(1),1720,Rest(3)],inf)/Pxrand([16,8,4,2],inf),
	\fltr1, Pxrand([Pn(15000,8),Pn(12000,8),Pn(13000,8),Pn(11000,8),Pn(5000,8),Pn(8000,8),Pn(7000,8),Pn(17000,8)],inf),
	\fltr2, Pxrand([Pn(15000,8),Pn(12000,8),Pn(13000,8),Pn(11000,8),Pn(5000,8),Pn(8000,8),Pn(7000,8),Pn(17000,8)],inf),
		\fltrdecay, 0.09,
	\dur, Pseq([1,Rest(1)],inf)/2,
	\voldecay, Pxrand([Pn(0.05,8),Pn(0.1,8),Pn(0.2,8),Pn(0.3,8),Pn(0.4,8),Pn(0.5,8)],inf)/2,
		\q, 1,
	\pan, Pwhite(-0.5,0.5,inf);
).play(t);

Pbind(\instrument,\simpleSquare,
		\vol1, 0.6,
		\vol2, 0,
	\pitchdecay, 0.005,
	\freq1, ~bassstab,
	\freq2, ~bassstab,
	\fltr1, 10000,
	\fltr2, 100,
		\fltrdecay, 0.1,
	\dur, Pseq([1,Rest(2),1,Rest(2),1,Rest(1),1,Rest(3),1,Rest(3)],inf),
	\voldecay, 0.3,
		\q, 1,
).play(t);

//Pbind(\instrument,\bassline,
//	\freq1, Pseq([[440,220],Rest(7),[440,220],Rest(7),[440,220],Rest(7),[440,220],Rest(7),[660,330],Rest(7),[660,330],Rest(7),[660,330],Rest(7),[660,330],Rest(7)],inf)/16,
//	\fre12, Pseq([[440,220],Rest(7),[440,220],Rest(7),[440,220],Rest(7),[440,220],Rest(7),[660,330],Rest(7),[660,330],Rest(7),[660,330],Rest(7),[660,330],Rest(7)],inf)/16,
//	\fltr1, 250,
//	\fltr2, 250,
//	\vol1, 0,
//	\vol2, 1,
//	\pitchdecay, 0.5,
//	\voldecay, 0.4,
//	\q, 3,
//	\dur, Pseq([1,Rest(7),1,Rest(7),1,Rest(7),1,Rest(7),1,Rest(7),1,Rest(7),1,Rest(7),1,Rest(3),1,Rest(3)],inf),
//	\pan, Pwhite(-0.2,0.2,inf);
//).play(t);
)

















//Extra Notes Below...
















//Dual Saw Oscillators with Mouse-controlled frequency mult and filter control
{
	RLPF.ar(Saw.ar([Line.kr(20000,25,0.02,doneAction:0.02),Line.kr(20000,250,0.02,doneAction:0.02)],MouseY.kr(1,-1,1,0)),MouseX.kr(13000,100,1,0),3)
}.play;

//Three Sin Oscillator tones mixed to mono, with mouse-controlled filter frequency and L/R panning
{Pan2.ar(Mix(BPF.ar(SinOsc.ar([100,240,360]),MouseY.kr(15,15000,0,0),2)),MouseX.kr(-1,1,0,0))}.play;

(
s.boot;
Server.local.scope(2);
)


//Set ranges for variables in Ndef.gui
ControlSpec.specs[\freq1]




(
ControlSpec.specs[\freq1]=[0.01,20000,\exp].asSpec;
Ndef(\kick,{arg freq1=15000, freq2=50, vol1=1, vol2=0, pitchdecay=0.006, voldecay=4, tempo=2;

	var env1, env2, input, gate;
	gate=Impulse.kr(tempo);
	env1=Env.new([0,freq1,freq2],[0,pitchdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	input=Pan2.ar(0.6*SinOsc.ar(EnvGen.kr(env1,gate))*EnvGen.kr(env2,gate),0);
};
))

Ndef(\kick).play;
Ndef(\kick).gui;
Ndef.clear

//not working
(
Ndef(\bassline,{arg freq1=400,freq2=400,vol1=1,vol2=0,fltr1=10,fltr2=1000,fltrdecay=2,pitchdecay=2,voldecay=1,q=3,tempo=3;
	var gate, input, env1, env2, env3;
	env1=Env.new([0,freq1,freq2],[0,pitchdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	env3=Env.new([0,fltr1,fltr2],[0,fltrdecay]);
	gate=Impulse.kr(tempo);
	input=RLPF.ar(Pan2.ar(0.6*SinOsc.ar(EnvGen.kr(env1,gate,doneAction:2))*EnvGen.kr(env2,gate,doneAction:2) + 0.5*Pulse.ar(EnvGen.kr(env1,gate,doneAction:2))*EnvGen.kr(env2,gate,doneAction:2) + 0.5*Saw.ar(EnvGen.kr(env1,gate,doneAction:2))*EnvGen.kr(env2,gate,doneAction:2),0),EnvGen.kr(env3,gate, doneAction:2),q);
	Out.ar([0,1],input);
}))

Ndef(\bassline).play.gui;
{var gate, sine; gate = Impulse.kr(0.25); SinOsc.ar(440) * EnvGen.kr(Env.new([10,1000], 2), gate);}.scope;