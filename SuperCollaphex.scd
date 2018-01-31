//SuperCollaphex

s.record;
s.stopRecording;
s.makeWindow;

(
t=TempoClock(180*4/60);

Pbind(\instrument,\kick,
	\pitchdecay, Pwhite(0.001,0.005,inf),
	\vol1, 0.1,
	\vol2, 0.1,
	\voldecay, 0.5,
	\freq1, 41.5,
	\freq2, 41.5,
	\dur, Pseq([Pseq([Rest(32),Rest(32),Rest(32),Rest(32),Rest(32)]),Pseq([1,Rest(3)],inf)],inf);
).play(t);

Pbind(\instrument,\kick,
	\pitchdecay, Pwhite(0.001,0.005,inf),
	\vol1, 0.1,
	\vol2, 0.1,
	\voldecay, 0.5,
	\freq1, 83,
	\freq2, 83,
	\dur, Pseq([Pseq([Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32)]),Pseq([1,Rest(3)],inf)],inf);
).play(t);

Pbind(\instrument,\kick,
	\vol1, Pseq([1,1,1,1,1,1,1,1,1,1,Pwhite(0,1,1),1],128),
	\pitchdecay, Pwhite(0.001,0.005,inf),
	\voldecay, Pwhite(0.01,0.08,inf),
	\freq1, Pwhite(3000,12000,inf),
	\freq2, Pseq([Pn(55,18),Pn(55,18)],inf),
	\dur, Pseq([1,Rest(2),1,Rest(5),1,Rest(6)],inf);
).play(t);

Pbind(\instrument,\hh,
	\vol1, Pseq([1,1,1,1,1,1,Pwhite(0,1,1),1,Pwhite(0,1,1)],inf),
	\vol2, 0,
	\fltr1, Pwhite(400,3000,inf),
	\fltr2, 20,
	\fltrdecay, 0.3,
	\q, 1,
	\trem, 1000,
	\voldecay, Pwhite(0.01,0.03,inf),
	\dur, Pseq([Rest(1),1,Rest(3),1,Rest(2),Rest(6),1,1],128);
).play(t);

Pbind(\instrument,\hh,
	\vol1, 0.5,
	\vol2, 0,
	\fltr1, Pwhite(7000,10000,inf),
	\fltr2, 4000,
	\fltrdecay, 0.5,
	\q, 1,
	\trem, 1000,
	\voldecay, Pwhite(0.01,0.03,inf),
	\pan, 0.5,
	\dur, Pseq([Rest(2),1,Rest(13)],128);
).play(t);

Pbind(\instrument,\hh,
	\vol1, Pseq([Pseq([0.5,0.5,0.5,Pwhite(0,0.05,1)],4),Pseq([0.5,0.5,0.5,0.5],4)],inf),
	\vol2, 0,
	\fltr1, 1000,
	\fltr2, 7000,
	\fltrdecay, 0.5,
	\q, 1,
	\trem, Pwhite(800,600,inf),
	\voldecay, Pwhite(0.05,0.2,inf),
	\pan, -0.5,
	\dur, Pseq([Rest(4),1,Rest(10),1],inf);
).play(t);

Pbind(\instrument,\kick,
	\vol1, Pwhite(0.7,1,inf),
	\vol2, 0,
	\pitchdecay, 0.001,
	\voldecay, Pwhite(0.001,0.05,inf),
	\freq1, Pwhite(1000,3000,inf),
	\freq2, Pwhite(1000,3000,inf),
	\dur, Pseq([Pn(Rest(32),2),Pseq([Rest(6),1,1,Rest(4),1,Rest(3)],inf)],inf),
	\pan, Pwhite(-1,1,inf);
).play(t);

Pbind(\instrument,\kick,
	\vol1, Pwhite(0.7,1,inf),
	\vol2, 0,
	\pitchdecay, 0.001,
	\voldecay, Pwhite(0.001,0.05,inf),
	\freq1, Pwhite(1000,800,inf),
	\freq2, Pwhite(100,300,inf),
	\dur, Pseq([Rest(13),1,Rest(2)],inf),
	\pan, Pwhite(-1,1,inf);
).play(t);

Pbind(\instrument,\simpleSaw,
		\vol1, 1,
		\vol2, 0,
	\pitchdecay, 0.005,
	\freq1 + \freq2, Pwhite(400,4000,inf),
	\fltr1, Pxrand([Pn(15000,8),Pn(12000,8),Pn(13000,8),Pn(11000,8),Pn(5000,8),Pn(8000,8),Pn(7000,8),Pn(17000,8)],inf),
	\fltr2, Pxrand([Pn(15000,8),Pn(12000,8),Pn(13000,8),Pn(11000,8),Pn(5000,8),Pn(8000,8),Pn(7000,8),Pn(17000,8)],inf),
		\fltrdecay, 0.09,
	\dur, Pseq([Rest(8),1,Rest(7)],inf),
	\voldecay, 0.01,
		\q, 1,
	\pan, Pwhite(-0.5,0.5,inf);
).play(t);

Pbind(\instrument,\simpleSquare,
		\vol1, 0.2,
	\vol2, 0,
	\pitchdecay, 0.005,
	\freq1, Pxrand([630,660,780,990,1040],inf),
	\freq2, Pxrand([630,660,780,990,1040],inf),
	\fltr1, 12000,
	\fltr2, 12000,
		\fltrdecay, 0.01,
	\dur, Pseq([Rest(10),1,Rest(5)],inf),
	\voldecay, Pwhite(0.1,0.5,inf),
		\q, 1,
).play(t);

Pbind(\instrument,\simpleSquare,
		\vol1, 0.2,
	\vol2, 0,
	\pitchdecay, 0.005,
	\freq1, Pxrand([630,660,780,990,1040],inf),
	\freq2, Pxrand([630,660,780,990,1040],inf),
	\fltr1, 12000,
	\fltr2, 12000,
		\fltrdecay, 0.01,
	\dur, Pseq([Rest(10),1,Rest(5)],inf),
	\voldecay, Pwhite(0.1,0.5,inf),
		\q, 1,
).play(t);

Pbind(\instrument,\bassline,
	\vol1, 0,
	\vol2, 0.4,
	\voldecay, 2.8,
	\fltr1, 600,
	\fltr2, 600,
	\pan, -0.4,
	\lfo, Pwhite(1,1000,inf),
	\trem, Pxrand([10,5,2.5,1.25],inf),
	\freq1, Pseq([660,630,530,500]/2,inf),
	\freq2, Pseq([660,630,530,500]/2,inf),
	\dur, Pseq([Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32],inf),
).play(t);

Pbind(\instrument,\bassline,
	\vol1, 0,
	\vol2, 0.4,
	\voldecay, 2.8,
	\fltr1, 600,
	\fltr2, 600,
	\pan, 0.4,
	\lfo, Pwhite(1,1000,inf),
	\trem, Pxrand([10,5,2.5,1.25],inf),
	\freq1, Pseq([990,1045,790,750,790,660]/2,inf),
	\freq2, Pseq([990,1045,790,750,790,660]/2,inf),
	\dur, Pseq([Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(64),Rest(64),32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32],inf),
).play(t);

Pbind(\instrument,\bassline,
	\vol1, 0,
	\vol2, 0.4,
	\voldecay, 2.8,
	\fltr1, 600,
	\fltr2, 600,
	\pan, 0,
	\lfo, Pwhite(1,1000,inf),
	\trem, Pxrand([40,20,10,5,2.5,1.25],inf),
	\freq1, Pseq([990,1045,790,2640],inf),
	\freq2, Pseq([990,1045,790,2640],inf),
	\dur, Pseq([Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(32),Rest(64),Rest(64),32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32],inf),
).play(t);

Pbind(\instrument,\hh2,
	\vol1, 0.05,
	\vol2, 0,
	\fltr1, 20000,
	\fltr2, 12000,
	\fltrdecay, 8,
	\q, 1,
	\trem, 1000,
	\voldecay, 10,
	\pan, 0,
	\dur, Pseq([1,Pn(Rest(1),inf)],inf);
).play(t);

)