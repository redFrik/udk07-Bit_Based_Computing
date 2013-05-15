s.boot

(
b= Bus.control(s);
p= OSCresponder(nil, \masterCounter, {|t, r, m|
	//m.postln;
	~localCounter= m[1];
	b.set(~localCounter);
}).add;
CmdPeriod.doOnce({"sound stopped".postln; p.remove; b.free});
)

Ndef(\masterSound).play

Ndef(\masterSound, {SinOsc.ar(0, SinOsc.ar(In.kr(b).linexp(0, 255, 100, 800), 0, In.kr(b).linlin(0, 1, 0, 2pi)))})
