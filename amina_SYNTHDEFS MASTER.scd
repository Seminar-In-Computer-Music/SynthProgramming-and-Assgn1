//SYNTHDEFS TO LOAD





//Kick/Toms with pitch / volume envelopes and pan!
(
ControlSpec.specs[\freq1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\freq2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\vol1]=[0,1,\lin].asSpec;
ControlSpec.specs[\vol2]=[0,1,\lin].asSpec;
ControlSpec.specs[\pitchdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\voldecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\pan]=[-1,1,\lin].asSpec;
	SynthDef(\kick,{arg freq1=12000, freq2=50, vol1=1, vol2=0, pitchdecay=0.001, voldecay=0.8, pan=0, gate=1;

	var env1, env2, input;
	env1=Env.new([freq1,freq2],[pitchdecay]);
	env2=Env.new([vol1,vol2],[voldecay]);
	input=Pan2.ar(0.6*SinOsc.ar(EnvGen.kr(env1,gate))*EnvGen.kr(env2,gate,doneAction:2),pan);
	Out.ar(0,input)
}).add;
)
Synth(\kick);




//Pads/Bass with filter / volume / pitch envelopes!
(
ControlSpec.specs[\freq1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\freq2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\vol1]=[0,1,\lin].asSpec;
ControlSpec.specs[\vol2]=[0,1,\lin].asSpec;
ControlSpec.specs[\fltr1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\fltr2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\pitchdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\voldecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\fltrdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\q]=[0.001,5,\lin].asSpec;
ControlSpec.specs[\pan]=[-1,1,\lin].asSpec;
ControlSpec.specs[\trem]=[0,1000,\lin].asSpec;
ControlSpec.specs[\lfo]=[0.01,20000,\exp].asSpec;
	SynthDef(\bassline,{arg freq1=400,freq2=400,vol1=1,vol2=0,fltr1=10,fltr2=1000,fltrdecay=2,pitchdecay=2,q=3,voldecay=1,trem=0,lfo=0,gate=1,pan=0;

	var env1,env2,env3,panvar,lfovar,input;
	env1=Env.new([0,freq1,freq2],[0,pitchdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	env3=Env.new([0,fltr1,fltr2],[0,fltrdecay]);
	lfovar=SinOsc.kr(lfo);
	panvar=pan + SinOsc.kr(trem);
	input=BPF.ar(Pan2.ar(0.9*SinOsc.ar(EnvGen.kr(env1,gate)+lfovar)*EnvGen.kr(env2,gate, doneAction:2) + 0.9*Pulse.ar(EnvGen.kr(env1,gate)+lfovar)*EnvGen.kr(env2,gate, doneAction:2) + 0.9*Saw.ar(EnvGen.kr(env1,gate)+lfovar)*EnvGen.kr(env2,gate, doneAction:2),panvar),EnvGen.kr(env3,gate),q);
		Out.ar(0,input)
}).add;
)
Synth(\bassline);




//SimpleSaw with filter/volume/pitch!
(
ControlSpec.specs[\freq1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\freq2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\vol1]=[0,1,\lin].asSpec;
ControlSpec.specs[\vol2]=[0,1,\lin].asSpec;
ControlSpec.specs[\fltr1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\fltr2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\pitchdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\voldecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\fltrdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\q]=[0.001,5,\lin].asSpec;
ControlSpec.specs[\pan]=[-1,1,\lin].asSpec;
	SynthDef(\simpleSaw,{arg freq1=400,freq2=400,vol1=1,vol2=0,fltr1=10,fltr2=1000,fltrdecay=2,pitchdecay=2,q=3,voldecay=1,gate=1,pan=0;

	var env1,env2,env3,input;
	env1=Env.new([0,freq1,freq2],[0,pitchdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	env3=Env.new([0,fltr1,fltr2],[0,fltrdecay]);
	input=RLPF.ar(Pan2.ar(0.5*Saw.ar(EnvGen.kr(env1,gate))*EnvGen.kr(env2,gate, doneAction:2),pan),EnvGen.kr(env3,gate),q);
		Out.ar(0,input)
}).add;
)
Synth(\simpleSaw);




//SimpleSquare with filter/volume/pitch!
(
ControlSpec.specs[\freq1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\freq2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\vol1]=[0,1,\lin].asSpec;
ControlSpec.specs[\vol2]=[0,1,\lin].asSpec;
ControlSpec.specs[\fltr1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\fltr2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\pitchdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\voldecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\fltrdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\q]=[0.001,5,\lin].asSpec;
ControlSpec.specs[\pan]=[-1,1,\lin].asSpec;
	SynthDef(\simpleSquare,{arg freq1=400,freq2=400,vol1=1,vol2=0,fltr1=10,fltr2=1000,fltrdecay=2,pitchdecay=2,q=3,voldecay=1,gate=1,pan=0;

	var env1,env2,env3,input;
	env1=Env.new([0,freq1,freq2],[0,pitchdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	env3=Env.new([0,fltr1,fltr2],[0,fltrdecay]);
	input=RLPF.ar(Pan2.ar(0.5*Pulse.ar(EnvGen.kr(env1,gate))*EnvGen.kr(env2,gate, doneAction:2),pan),EnvGen.kr(env3,gate),q);
		Out.ar(0,input)
}).add;
)
Synth(\simpleSquare);




//High Hats
(
ControlSpec.specs[\vol1]=[0,1,\lin].asSpec;
ControlSpec.specs[\vol2]=[0,1,\lin].asSpec;
ControlSpec.specs[\fltr1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\fltr2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\voldecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\fltrdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\q]=[0.001,5,\lin].asSpec;
ControlSpec.specs[\trem]=[0.001,1000,\lin].asSpec;
ControlSpec.specs[\pan]=[-1,1,\lin].asSpec;
    SynthDef(\hh,{arg fltr1=1500,fltr2=20,q=1,vol1=1,vol2=0,voldecay=0.09,fltrdecay=0.2,pan=0,trem=10,gate=1;

	var env1, env2, panvar, input;
	env2=Env.new([vol1,vol2], [voldecay]);
	env1=Env.new([fltr1,fltr2],[fltrdecay]);
	panvar=pan + SinOsc.kr(trem);
	input=
	Pan2.ar(0.9*RHPF.ar(WhiteNoise.ar(EnvGen.kr(env2,gate,doneAction:2)),EnvGen.kr(env1,gate),q),panvar) +
	Pan2.ar(0.9*RHPF.ar(BrownNoise.ar(EnvGen.kr(env2,gate,doneAction:2)),EnvGen.kr(env1,gate),q),panvar) +
	Pan2.ar(0.9*RHPF.ar(ClipNoise.ar(EnvGen.kr(env2,gate,doneAction:2)),EnvGen.kr(env1,gate),q),panvar);
		Out.ar(0,input)
}).add;
)
Synth(\hh);

//hh2
(
ControlSpec.specs[\vol1]=[0,1,\lin].asSpec;
ControlSpec.specs[\vol2]=[0,1,\lin].asSpec;
ControlSpec.specs[\fltr1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\fltr2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\voldecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\fltrdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\q]=[0.001,5,\lin].asSpec;
ControlSpec.specs[\trem]=[0.001,1000,\lin].asSpec;
ControlSpec.specs[\pan]=[-1,1,\lin].asSpec;
    SynthDef(\hh2,{arg fltr1=1500,fltr2=20,q=1,vol1=1,vol2=0,voldecay=0.09,fltrdecay=0.2,pan=0,trem=10,gate=1;

	var env1, env2, panvar, input;
	env2=Env.new([vol1,vol2], [voldecay]);
	env1=Env.new([fltr1,fltr2],[fltrdecay]);
	panvar=pan + SinOsc.kr(trem);
	input=
	Pan2.ar(0.9*BPF.ar(WhiteNoise.ar(EnvGen.kr(env2,gate,doneAction:2)),EnvGen.kr(env1,gate),q),panvar);
		Out.ar(0,input)
}).add;
)
Synth(\hh2);
