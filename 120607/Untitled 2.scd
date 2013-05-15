GUI.qt
s.scope
{LFPulse.ar}.scope
{Pulse.ar}.scope
{[LFPulse.ar, Pulse.ar]}.scope
{[LFPulse.ar, Pulse.ar]}.plot(0.1)

{LFPulse.ar(10)+LFPulse.ar(21)}.scope

{LFPulse.ar(10)*LFPulse.ar(21)}.plot(1)
{LFPulse.ar(10)*LFPulse.ar(21)}.scope
{Pulse.ar(10)*Pulse.ar(21)}.scope


{LFPulse.ar(10)|LFPulse.ar(21)}.plot(1)
{LFPulse.ar(10)&LFPulse.ar(21)}.plot(1)
{LFPulse.ar(10) bitXor: LFPulse.ar(21)}.plot(1)

{LFPulse.ar(10)|LFPulse.ar(21)}.play
{LFPulse.ar(10)&LFPulse.ar(21)}.play
{LFPulse.ar(10) bitXor: LFPulse.ar(21)}.play
{LFPulse.ar(10) bitXor: LFPulse.ar(11)}.play

//bitAnd = &
//bitOr = |
//bitXor (no symbol)

(
{
	[
		LFPulse.ar(10),	//osc A
		LFPulse.ar(11),	//osc B
		LFPulse.ar(10) bitAnd: LFPulse.ar(21),	//A and B
		LFPulse.ar(10) bitOr: LFPulse.ar(21),		//A or B
		LFPulse.ar(10) bitXor: LFPulse.ar(21)		//A xor B
	]
	}.plot(1)
)
	
{LFPulse.ar(LFPulse.ar(1)*400+500)}.play
{LFPulse.ar(LFPulse.ar(1)&LFPulse.ar(1.1)*400+500)}.play
{LFPulse.ar(LFPulse.ar(4) bitXor: LFPulse.ar(3)*400+500)}.play
{LFPulse.ar(LFPulse.ar(4.01) bitXor: LFPulse.ar(3)*400+500)}.play

{LFPulse.ar(LFPulse.ar(4) bitXor: LFPulse.ar(3) bitXor: LFPulse.ar(10)*400+500)}.play


{LFPulse.ar(LFPulse.ar(4) bitXor: LFPulse.ar(3) bitXor: LFPulse.ar(MouseX.kr(0, 100))*400+(LFPulse.ar(1.01)*500+250))}.play


{LFPulse.ar(LFPulse.ar(4) bitXor: LFPulse.ar(3) bitAnd: LFPulse.ar(MouseX.kr(0, 100))*400+(LFPulse.ar(1.01)*500+250))}.play

{LFPulse.ar(LFPulse.ar(4.01) bitXor: LFPulse.ar(3) bitAnd: LFPulse.ar(MouseX.kr(0, 100))*400+(LFPulse.ar(1.01)*500+250))}.play








{LFPulse.ar(LFPulse.ar(1)+LFPulse.ar(1.1)+LFPulse.ar(1.2)+LFPulse.ar(1.3)*400+400)}.play


{LFPulse.ar(Mix(LFPulse.ar(Rand(1!8, 1.5)))*200+200)}.play

{BLowPass.ar(LFPulse.ar(Mix(LFPulse.ar(Rand(1!8, 1.5)))*200+200),MouseX.kr(200, 2000, 1), MouseY.kr(0.01, 5))}.play

{BLowPass4.ar(LFPulse.ar(Mix(LFPulse.ar(Rand(1!8, 1.5)))*200+200),MouseX.kr(500, 10000, 1), MouseY.kr(0.01, 5))}.play


{LFPulse.ar(LFPulse.ar([1,1.1]).reduce('bitAnd')*400+400)}.scope
{LFPulse.ar(LFPulse.ar(1)&LFPulse.ar(1.1)*400+400)}.scope

[2,3,4,5].reduce('|')
2|3|4|5

[2,3,4,5].reduce('bitXor')

[4,5,6].convertDigits

{LFPulse.ar({LFPulse.ar(1.0.rrand(2.0))}.dup(8).postln.reduce('bitAnd')*400+400)}.scope
{LFPulse.ar(LFPulse.ar([1,2,3,4]).reduce('bitAnd')*400+400)}.draw


{LFPulse.ar(LFPulse.ar([1,2.2,3,4]).reduce('bitAnd')*400+400)}.play
{LFPulse.ar(LFPulse.ar(1)&LFPulse.ar(2.2)&LFPulse.ar(3)&LFPulse.ar(4)*400+400)}.play


{LFPulse.ar({|i| LFPulse.ar(22.0.rand)}.dup(8).reduce('bitXor')*400+400)}.play


Pbind(\midinote, Pseq(8.asBinaryString.ascii), \dur, 0.25).play
Pbind(\degree, Pseq(8.asBinaryDigits), \dur, 0.25).play

Pbind(\degree, Pseq(9.asBinaryDigits), \dur, 0.25).play

Pbind(\degree, Pseq((0..255).collect{|x| x.asBinaryDigits}.flat), \dur, 0.1).play

Pbind(\degree, 0, \amp, Pseq((0..255).collect{|x| x.asBinaryDigits}.flat)*0.25, \dur, 0.1).play



(
SynthDef(\oneShotMono, {|out= 0, amp= 0.5, buffer|
	Out.ar(0, PlayBuf.ar(1, buffer, doneAction:2)!2);
}).add;
SynthDef(\oneShotStereo, {|out= 0, amp= 0.5, buffer|
	Out.ar(0, PlayBuf.ar(2, buffer, doneAction:2));
}).add;
)
b= Buffer.read(s, "/Applications/SuperCollider344/sounds/DrumMachine/Soft Bassdrum.wav")
c= Buffer.read(s, "/Applications/SuperCollider344/sounds/DrumMachine/Snaredrum 1.wav")



Pbind(\instrument, \oneShotMono, \buffer, b).play
Pbind(\instrument, \oneShotMono, \buffer, c).play
Pbind(\instrument, \oneShotMono, \buffer, Pseq([0, 1], inf), \dur, 0.125).play
Pbind(\instrument, \oneShotMono, \buffer, Pswitch1([b, c], Pseq((0..255).collect{|x| x.asBinaryDigits}.flat)), \dur, 0.125).play
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

{LFPulse.ar(PulseCount.ar(Impulse.ar(6))&PulseCount.ar(Impulse.ar(7)))}.play

{LFPulse.ar(PulseCount.ar(Impulse.ar(16))%256 bitAnd: (PulseCount.ar(Impulse.ar(17))%256))}.play
{LFPulse.ar(PulseCount.ar(Impulse.ar(16))%256 bitOr: (PulseCount.ar(Impulse.ar(17))%256))}.play
{LFPulse.ar(PulseCount.ar(Impulse.ar(16))%256 bitXor: (PulseCount.ar(Impulse.ar(17))%256))}.play

{LFPulse.ar(PulseCount.ar(Impulse.ar(160))%5000 bitXor: (PulseCount.ar(Impulse.ar(170))%5000))}.play
{LFPulse.ar(PulseCount.ar(Impulse.ar(160))%5000 bitAnd: (PulseCount.ar(Impulse.ar(170))%5000))}.play
{LFPulse.ar(PulseCount.ar(Impulse.ar(160))%5000 bitOr: (PulseCount.ar(Impulse.ar(170))%5000))}.play




