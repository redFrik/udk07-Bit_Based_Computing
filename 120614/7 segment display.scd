//7 segment display /f0
(
var width= 500, height= 500;
var win= Window("ssd", Rect(300, 300, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
usr.background= Color.white;
usr.clearOnRefresh= true;
usr.animate= true;
~points= [
	Point(0, 0),
	Point(1, 0),
	Point(1, 1),
	Point(1, 2),
	Point(0, 2),
	Point(0, 1),
	Point(1.5, 2)
];
~dict= (
	0: 63,
	1: 6,
	2: 91,
	3: 79,
	4: 102,
	5: 109,
	6: 125,
	7: 7,
	8: 127,
	9: 111,
	0.0: 191,
	1.0: 134,
	2.0: 219,
	3.0: 207,
	4.0: 230,
	5.0: 237,
	6.0: 253,
	7.0: 135,
	8.0: 255,
	9.0: 239
);
~val= 5;
~scale= 100;
~offset= 100;
~width= 10;
usr.drawFunc= {
	var pnts= ~points*~scale+~offset;
	var bits= ~dict.at(~val) ? 0;
	Pen.smoothing= true;
	Pen.capStyle= 1;
	Pen.width= ~width;
	Pen.color= Color.black;
	if(bits&1==1, {
		Pen.line(pnts[0], pnts[1]);
	});
	if(bits&2==2, {
		Pen.line(pnts[1], pnts[2]);
	});
	if(bits&4==4, {
		Pen.line(pnts[2], pnts[3]);
	});
	if(bits&8==8, {
		Pen.line(pnts[3], pnts[4]);
	});
	if(bits&16==16, {
		Pen.line(pnts[4], pnts[5]);
	});
	if(bits&32==32, {
		Pen.line(pnts[5], pnts[0]);
	});
	if(bits&64==64, {
		Pen.line(pnts[5], pnts[2]);
	});
	Pen.stroke;
	if(bits&128==128, {
		Pen.fillOval(Rect.aboutPoint(pnts[6], ~width*0.5, ~width*0.5));
	});
};
win.front;
CmdPeriod.doOnce({if(win.isClosed.not, {win.close})});
)

/*
Routine({10.do{|i| ~val= i; 1.wait}}).play
Routine({10.do{|i| ~val= i+0.0; 1.wait}}).play
Routine({100.do{|i| ~scale= i; 0.01.wait}}).play
Routine({100.do{|i| ~offset= i; 0.01.wait}}).play
Routine({100.do{|i| ~width= i/2; 0.01.wait}}).play
Document.current.keyDownAction= {|...args| if(args[3]>=48 and:{args[3]<=57}, {~val= args[3]-48})}
Document.current.keyDownAction= nil;

~points= [
	Point(0, 0),
	Point(1, 0),
	Point(1, 1),
	Point(1, 2),
	Point(0, 2),
	Point(0, 1),
	Point(1.5, 2)
].scramble;

~dict= ();
(0..255).do{|x| ~dict.put(x, x)}
r= Routine({256.do{|i| ~val= i.postln; 0.1.wait}}).play
r.stop
*/
