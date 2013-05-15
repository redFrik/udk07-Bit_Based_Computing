(
var distance3d= {|vec1, vec2|
	(vec2[0]-vec1[0]).hypot((vec2[1]-vec1[1]).hypot(vec2[2]-vec1[2]));
};
var yellow= [1, 1, 0];
var red= [1, 0, 0];
o= OSCresponder(nil, \col, {|t, r, m|
	//var r= m[1], g= m[2], b= m[3];
	var distFromYellow= distance3d.value(m[1..3], yellow);
	var distFromRed= distance3d.value(m[1..3], red);
	if(distFromYellow<0.7, {
		"yellow".postln;
	});
	if(distFromRed<0.6, {
		"red".postln;
	});
}).add;
CmdPeriod.doOnce({o.remove});
)