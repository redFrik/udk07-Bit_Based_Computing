
s.boot

GUI.qt		//sc3.5.x
s.scope


{LFPulse.ar}.play		//aliasing (sounding slightly bad)
{Pulse.ar}.play			//anti-aliased version

{LFPulse.ar}.plot
{Pulse.ar}.plot

{LFPulse.ar(1)}.scope


//bitAnd
{LFPulse.ar(10) & LFPulse.ar(14)}.scope
{[LFPulse.ar(10), LFPulse.ar(11)]}.plot(2)
{LFPulse.ar(10) & LFPulse.ar(11)}.plot(2)
{LFPulse.ar(4) & LFPulse.ar(3)}.scope
{LFPulse.ar(400) & LFPulse.ar(401)}.scope
{LFPulse.ar(400) & LFPulse.ar(5)}.scope


//bitOr
{LFPulse.ar(10) | LFPulse.ar(11)}.plot(2)
{LFPulse.ar(400) | LFPulse.ar(401)}.scope

{LFPulse.ar(400) | LFPulse.ar(5)}.scope

//bitXor
{LFPulse.ar(5) bitXor: LFPulse.ar(6)}.play
{LFPulse.ar(400) bitXor: LFPulse.ar(401)}.scope

{LFPulse.ar(400) bitXor: LFPulse.ar(5)}.scope


{SinOsc.ar(400,0, 5) & LFSaw.ar(100,0,5)}.play



{LFPulse.ar(LFPulse.ar(1)*400+400)}.play
{LFPulse.ar(LFPulse.ar(1) & LFPulse.ar(1.25) * 400+400)}.play
{LFPulse.ar(LFPulse.ar(1) & LFPulse.ar(1.25) | LFPulse.ar(0.2) * 400+400)}.play


{LFPulse.ar(LFPulse.ar(MouseX.kr(1, 100, 1))*400+400)}.scope

{LFPulse.ar(LFPulse.ar(MouseX.kr(1, 100, 1)) & LFPulse.ar(MouseY.kr(1, 100, 1))*400+400)}.scope



{(LFPulse.ar(1) + LFPulse.ar(1.1) + LFPulse.ar(1.2))}.plot(2, minval:0, maxval: 3)

{LFPulse.ar(LFPulse.ar(1) + LFPulse.ar(1.1) + LFPulse.ar(1.2) + LFPulse.ar(1.3) * 400+400)}.play

{LFPulse.ar(LFPulse.ar(1) & LFPulse.ar(1.1) & LFPulse.ar(1.2) bitXor: LFPulse.ar(1.3) * 400+400)}.play


[1, 2, 3, 4, 5].sum			 //+
[1, 2, 3, 4, 5].product	 //*
[1, 2, 3, 4, 5].mean	 	//average


[1, 2, 3, 4, 5].reduce('+')
[1, 2, 3, 4, 5].reduce('/')
[1, 2, 3, 4, 5].reduce('&')
[1, 2, 3, 4, 5].reduce('|')
[1, 2, 3, 4, 5].reduce('bitXor')

{LFPulse.ar(LFPulse.ar([1,2,3,4,5]).reduce('bitXor')*400+400)}.play
{LFPulse.ar(LFPulse.ar([1,2.1,3,3.99,5]).reduce('bitXor')*400+400)}.play



{LFPulse.ar({|i| LFPulse.ar(22.0.rand)}.dup(20).reduce('bitXor')*400+400)}.play


{SinOsc.ar({|i| LFTri.ar(22.0.rand)*5}.dup(20).reduce('bitXor')*400+400)}.play

{LFPulse.ar({|i| LFPulse.ar(22.0.rand)*MouseX.kr(1, 10)}.dup(20).reduce('bitXor')*400+400)}.play

{WhiteNoise.ar}.play

RedNoise


//--
1234.asBinaryString(16)
100.asBinaryString(8)

100.asBinaryDigits

Pbind(\degree, Pseq(100.asBinaryDigits), \dur, 0.1).play
Pbind(\degree, Pseq(101.asBinaryDigits), \dur, 0.1).play

Pbind(\degree, 0, \amp, Pseq(100.asBinaryDigits), \dur, 0.1).play
Pbind(\degree, 0, \amp, Pseq(101.asBinaryDigits), \dur, 0.1).play

x= Pseq(100.asBinaryDigits(16), inf)
Pbind(\degree, 5, \amp, x, \dur, 0.1).play
x.list= 201.asBinaryDigits(16)
x.list= 40.asBinaryDigits(16)
x.list= 1.asBinaryDigits(16)


//count from 0 to 255
(0..255).do{|x| x.asBinaryDigits.postln}
//bitstream...
Pbind(\degree, 0, \amp, Pseq((0..255).collect{|x| x.asBinaryDigits}.flat), \dur, 0.05, \legato, 0.3).play



(
SynthDef(\oneShotMono, {|out= 0, amp= 0.5, buffer|
	Out.ar(0, PlayBuf.ar(1, buffer, doneAction:2)!2);
}).add;
SynthDef(\oneShotStereo, {|out= 0, amp= 0.5, buffer|
	Out.ar(0, PlayBuf.ar(2, buffer, doneAction:2));
}).add;
)

b= Buffer.read(s, "/Applications/SuperCollider344/sounds/DrumMachine/Rimshot.wav")
c= Buffer.read(s,"/Applications/SuperCollider344/sounds/DrumMachine/Closed Hihat.wav" )
b.play
c.plot


Pbind(\instrument, \oneShotMono, \buffer, b).play
Pbind(\instrument, \oneShotMono, \buffer, c).play
Pbind(\instrument, \oneShotMono, \buffer, Pswitch1([b, c], Pseq([0, 0, 0, 1], inf)), \dur, 0.125).play


Pbind(\instrument, \oneShotMono, \buffer, Pswitch1([b, c], Pseq((0..255).collect{|x| x.asBinaryDigits}.flat)), \dur, 0.07).play


Pbind(\instrument, \oneShotMono, \buffer, Pswitch1([b, c], Pseq((0..255).collect{|x| x.asBinaryDigits}.flat)), \dur, Pseq([Pseq([0.125], 7), 1], inf)).play



//b= Buffer.alloc(s, 44100)
{RecordBuf.ar(SoundIn.ar, b, loop:0, doneAction:2)}.play

b.plot
b.play

//c= Buffer.alloc(s, 44100)
{RecordBuf.ar(SoundIn.ar, c, loop:0, doneAction:2)}.play
c.play
c.plot

b.free
c.free








//8bit magic from what's new in sc3.5

{LFPulse.ar(PulseCount.ar(Impulse.ar(6)) & PulseCount.ar(Impulse.ar(7)))}.play

{LFPulse.ar(PulseCount.ar(Impulse.ar(16))%256 & (PulseCount.ar(Impulse.ar(17))%256))}.play

{LFPulse.ar(PulseCount.ar(Impulse.ar(16))%256 bitOr: (PulseCount.ar(Impulse.ar(17))%256))}.play
{LFPulse.ar(PulseCount.ar(Impulse.ar(16))%256 bitXor: (PulseCount.ar(Impulse.ar(17))%256))}.play

{LFPulse.ar(PulseCount.ar(Impulse.ar(160))%5000 bitXor: (PulseCount.ar(Impulse.ar(170))%5000))}.play
{LFPulse.ar(PulseCount.ar(Impulse.ar(160))%5000 bitAnd: (PulseCount.ar(Impulse.ar(170))%5000))}.play
{LFPulse.ar(PulseCount.ar(Impulse.ar(160))%5000 bitOr: (PulseCount.ar(Impulse.ar(170))%5000))}.play



//simple ringmod effect...
(
SynthDef(\ringmod, {|freq= 400, amount= 1|
	var src= InFeedback.ar(0, 2);
	var efx= src*SinOsc.ar(freq, 0, amount);
	ReplaceOut.ar(0, efx);
}).add;
)
a= Synth(\ringmod)
a.set(\freq, 8000)
a.set(\freq, 800)
a.set(\freq, 80)
a.set(\freq, 8)
a.free
