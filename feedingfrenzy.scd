s.options.memSize_(8192*8);//increases server's memory allocation (for some very unstable code!)
	(
		SynthDef(\feeder, {
		var source, loc, freq;
		freq=Duty.ar(Rand(15,50),0,Dseq([5,7,9,11,13,17,19,2,3].midicps,inf));//still trying to undertand "Duty"
		source=SinOsc.ar(freq)*Decay.ar(Dust.ar(1,Rand(0.5)));//Sine wave oscillator tuned by "freq"

		//source= SoundIn.ar(0);
		loc = LocalIn.ar(2)+source;//local bus added to source oscillator signal to generate feedback
		loc = FreqShift.ar(loc,100);//frequency shift by 100 hz with each pass
		loc = loc+DelayC.ar(loc,0.2,freq.reciprocal);//feedback signal added to a delay line
		loc = DelayC.ar(loc,(Rand(0.5,10)!2),3);//another delay line
		loc = DelayC.ar(loc!2,LFNoise0.ar(0.015).range(0.025,5),4);//another delay line
		loc = loc+AllpassC.ar(loc,0.5,LFNoise1.ar(0.1!2).range(0.05,0.1),2);
	    loc = CombC.ar(loc,4,LFNoise0.ar(0.1!2).range(0.05,0.1),0.5);
		//loc= loc = LPF.ar(loc,1000);





		LocalOut.ar(Limiter.ar(loc,0.25));

		Out.ar(0,Limiter.ar(loc)*0.25);
		}).play

	)


