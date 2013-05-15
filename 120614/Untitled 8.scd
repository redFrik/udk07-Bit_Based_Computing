//bitreduction
{SinOsc.ar(400)}.plot(minval: -1, maxval: 1)
{SinOsc.ar(400)}.play
{SinOsc.ar(400).round(0.25)}.plot(minval: -1, maxval: 1)
{SinOsc.ar(400).round(0.25)}.play

//downsample
{Latch.ar(SinOsc.ar(400), Impulse.ar(5000))}.plot(minval: -1, maxval: 1)
{Latch.ar(SinOsc.ar(400), Impulse.ar(5000))}.play

//bitcrucher= bitreduction + downsampling
Ndef(\bitx, {|rate= 0.5, bits= 4| Latch.ar((SoundIn.ar*bits+bits).floor-bits/bits, Impulse.ar(SampleRate.ir*0.5*rate))})
Ndef(\bitx).play	//crispy
Ndef(\bitx).gui

//+ring mod
Ndef(\bit8, {|rate= 0.5, bits= 4, freq= 150| Latch.ar((SoundIn.ar*FSinOsc.ar(freq)*bits+bits).floor-bits/bits, Impulse.ar(SampleRate.ir*0.5*rate))})
Ndef(\bit8).play
Ndef(\bit8).gui


//--using a drum loop
b= Buffer.read(s, "/Applications/SuperCollider344/sounds/Drum_Loop_01.wav")
Ndef(\bit8sf, {|rate= 0.5, bits= 4, freq= 150| Latch.ar((PlayBuf.ar(b.numChannels, b, loop:1)*FSinOsc.ar(freq)*bits+bits).floor-bits/bits, Impulse.ar(SampleRate.ir*0.5*rate))})
Ndef(\bit8sf).play
Ndef(\bit8sf).gui

//experiment: bitcruching on the tail of a sound. i.e. soft sounds are more cruched
(
Ndef(\bit8sfTail, {|rate= 1, bits= 32, freq= 150|
	var src= PlayBuf.ar(2, b, loop:1);
	//var src= SinOsc.ar([400, 404])*Decay.ar(Dust.ar(1));
	var trk= Amplitude.kr(src, 0.005, 0.05);	//track amplitude
	trk= (trk*8).clip(0, 1);	//boost and clip so range is 0-1
	trk[0].poll;
	bits= bits-(1-trk*bits)+4;
	Latch.ar((src*FSinOsc.ar(freq)*bits+bits).floor-bits/bits, Impulse.ar(SampleRate.ir*0.5*rate))
})
)
Ndef(\bit8sfTail).play
NdefMixer(s)

