(
var width= 640;
var height= 480;
var win= Window("amp tracking test", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
usr.background= Color.black;
usr.animate= true;
~amp= 0.5;
usr.drawFunc= {
	Pen.fillColor= Color.white;
	//Pen.fillRect(Rect(50, height*0.5, width-100, ~amp*150));
	Pen.fillRect(Rect(50, ~amp.linlin(0, 1, height*0.5, height*0.45), width-100, ~amp.lincurve(0, 1, 0.001, 200, -4)));
};
win.front;
CmdPeriod.doOnce({win.close});
)

(
s.waitForBoot{
	SynthDef(\amptrack, {|rate= 60, atk= 0.1, rel= 0.5|
		var src= SoundIn.ar;	//test with mic
		//var src= PlayBuf.ar(2, b, loop:1);
		var trk= Amplitude.kr(src, atk, rel);
		SendTrig.kr(Impulse.kr(rate), 0, trk);
		Out.ar(0, src);	//optional monitor
	}).add;
	s.sync;
	~tracker= Synth(\amptrack);
	o= OSCresponder(s.addr, \tr, {|t, r, m| ~amp= m[3]}).add
};
)

//tune the tracker
~tracker.set(\atk, 1)
~tracker.set(\rel, 1)

//stop
~tracker.free
o.remove