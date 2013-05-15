//--simple receiver

(
o= OSCresponder(nil, \masterCounter, {|t, r, m|
	//m.postln;
	m[1].asBinaryString(8).postln;
}).add;
CmdPeriod.doOnce({"stopped".postln; o.remove});
)


//o.remove
