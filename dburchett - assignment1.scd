(
s.boot;
Server.local.scope(2);
)
(
SynthDef("Dusty", { arg out = 0;
	var env, d, g, f, e;
	env = Linen.kr(Impulse.kr(0), Rand(0.0, Rand(0.03, 0.6)), Rand(0.01, Rand(0.03, 0.6)), Rand(0.01, Rand(0.03, 0.6)), doneAction: Done.freeSelf);
	d = Dust.ar(Rand(0.1, 25.0), 1.5, 0.5);
	e = Ringz.ar(d, Rand(1000.0, 5000.0), Dust.kr(Rand(0.1, 25.0)), 0.25, 0);
	g = GbmanN.ar(LFNoise0.kr(Rand(1.0, 20000.0), 1, 0), Rand(0.0, 2.0), Rand(0.0, 2.0), 1, 0);
	f = SinOscFB.ar(d, g, 0.5, 0.9);
	Out.ar(out,
		Pan2.ar(
			Spring.ar(e, f, 0.5), Rand(-1.0, 1.0), env))}
).add;
SynthDef("Hen", { arg out = 0;
	var env, a, b, c;
	a = LFNoise2.kr(Crackle.kr(Dust2.kr(Rand(0, 5), 0.0), 0.2, 0.2));
	b = Spring.kr(a, Rand(0.1, 1.0), 0);
	c = GbmanL.ar(Rand(0, 20500), b, Rand(0, 5));
	env = Linen.kr(Impulse.kr(0), Rand(0.0, Rand(0.005, 0.009)), Rand(0.01, Rand(0.005, 0.009)), Rand(0.01, Rand(0.005, 0.009)), doneAction: Done.freeSelf);
	Out.ar(out,
		Pan2.ar(
			HenonL.ar(Rand(0, 20000), c, a, Dust2.ar(2, 1, 0.5), b), Rand(-1.0, 1.0), env))}
).add;
SynthDef("Pops", { arg out = 0;
    var f, sf, g, h, j, env;
	env = Linen.kr(Impulse.kr(0), Rand(0.0, Rand(0.05, 0.07)), Rand(0.01, Rand(0.05, 0.07)), Rand(0.01, Rand(0.05, 0.07)), doneAction: Done.freeSelf);
	sf = LFNoise0.ar(Crackle.kr(Dust2.kr(Rand(0, 50), 0.5), 0.2, 0.2));
	j = RHPF.ar(sf, Rand(1000.0, 2000.0), Dust.kr(0.0, 50.0), 1, 0);
	g = Ball.kr(sf, 1, 0, 0.01);
    f = Ball.kr(sf, g, 0, 0.01);
    f = f * 140 + 500;
	Out.ar(out,
			Pan2.ar(
			SinOscFB.ar(j, f, 0.5, 0.9), Rand(-1.0, 1.0), env))
}).add;
SynthDef("Noise", { arg out = 0;
	var f, sf, g, env;
	env = Linen.kr(Impulse.kr(0), Rand(0.0, Rand(0.03, 0.75)), Rand(0.01, Rand(0.03, 0.75)), Rand(0.01, Rand(0.03, 0.75)), doneAction: Done.freeSelf);
	f = LFNoise2.kr(SampleRate.ir/4, 1.5, 0.5);
	sf = CuspN.ar(SampleRate.ir/4, Rand(-3.0, 3.0), Rand(-3.0, 3.0), Rand(0.5, 1.5));
	g = Ball.kr(f, sf, 0, 0.01);
	g = g * 140 + 1000;
	Out.ar(out,
		Pan2.ar(
			SinOscFB.ar(sf, g, 0.5, 0.9), Rand(-1.0, 1.0), env))
}).add;
~noise = Pbind(
	\instrument, "Noise",
	\dur, Pwhite(1.0, 10.0, inf),
	\tempo, Pwhite(0.25, 10.0, inf)
);
~pops = Pbind(
	\instrument, "Pops",
	\dur, Pwhite(1.0, 10.0, inf),
	\tempo, Pwhite(0.5, 1.0, inf)
);
~dusty = Pbind(
	\instrument, "Dusty",
	\dur, Pwhite(1.0, 10.0, inf),
	\tempo, Pwhite(0.25, 1.0, inf)
);
~hen = Pbind(
	\instrument, "Hen",
	\dur, Pwhite(1.0, 10.0, inf),
	\tempo, Pwhite(0.5, 10.0, inf)
);
r = Routine({
    var a, b, c, d, e, f, g, h;
    loop {
        a = rrand(0.0, 1.0);
		b = if (a < 0.5, {z.play}, {y.play});
        a.wait;
		c = rrand(0.0, 1.0);
		d = if (c < 0.5, {x.play}, {w.play});
		c.wait;
		e = rrand(0.0, 1.0);
		f = if (e < 0.5, {z.stop}, {y.stop});
		e.wait;
		g = rrand(0.0, 1.0);
		h = if (g < 0.5, {x.stop}, {w.stop});
		g.wait;
    }
});
w = ~noise.play;
x = ~pops.play;
y = ~dusty.play;
z = ~hen.play;
w.stop;
x.stop;
y.stop;
z.stop;
)
r.play;