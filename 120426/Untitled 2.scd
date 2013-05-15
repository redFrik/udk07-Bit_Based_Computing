


//counting in 8bit binary from 0 to 255
(
256.do{|i|
	i.asBinaryString(8).postln;
}
)

//same thing but with ascii graphics
(
256.do{|i|
	if(i&128==128, {"*"}, {" "}).post;
	if(i&64==64, {"*"}, {" "}).post;
	if(i&32==32, {"*"}, {" "}).post;
	if(i&16==16, {"*"}, {" "}).post;
	if(i&8==8, {"*"}, {" "}).post;
	if(i&4==4, {"*"}, {" "}).post;
	if(i&2==2, {"*"}, {" "}).post;
	if(i&1==1, {"*"}, {" "}).post;
	"".postln;
}
)


//similar but with simple sounds
s.boot
(
SynthDef(\ping, {|freq= 400, amp= 0.1|
	var env= EnvGen.ar(Env.perc(0.001, 0.05), doneAction:2);
	var src= SinOsc.ar(freq, 0, amp);
	Out.ar(0, Pan2.ar(src*env, 0));
}).add;
)

(
Routine({
	256.do{|i|
		i.postln;
		if(i&128==128, {Synth(\ping, [\freq, 500])});
		if(i&64==64, {Synth(\ping, [\freq, 600])});
		if(i&32==32, {Synth(\ping, [\freq, 700])});
		if(i&16==16, {Synth(\ping, [\freq, 800])});
		if(i&8==8, {Synth(\ping, [\freq, 900])});
		if(i&4==4, {Synth(\ping, [\freq, 1000])});
		if(i&2==2, {Synth(\ping, [\freq, 1100])});
		if(i&1==1, {Synth(\ping, [\freq, 1200])});
		0.1.wait;
	};
}).play
)

(
Routine({
	256.do{|i|
		i.postln;
		if(i&128==128, {Synth(\ping, [\freq, 1200])});
		if(i&64==64, {Synth(\ping, [\freq, 1100])});
		if(i&32==32, {Synth(\ping, [\freq, 1000])});
		if(i&16==16, {Synth(\ping, [\freq, 900])});
		if(i&8==8, {Synth(\ping, [\freq, 800])});
		if(i&4==4, {Synth(\ping, [\freq, 700])});
		if(i&2==2, {Synth(\ping, [\freq, 600])});
		if(i&1==1, {Synth(\ping, [\freq, 500])});
		0.1.wait;
	};
}).play
)
