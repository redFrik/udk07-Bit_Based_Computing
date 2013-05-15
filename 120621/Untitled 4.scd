//--less simple receiver

(
o= OSCresponder(nil, \masterCounter, {|t, r, m|
	var state;
	m[1].asBinaryString(8).postln;
	~myCounter= m[1];
	state= m[1]&2;
	if(state!=0, {
		Pbind(\degree, Pseq([5], 1)).play;
	});
}).add;
CmdPeriod.doOnce({o.remove});
)


//o.remove
