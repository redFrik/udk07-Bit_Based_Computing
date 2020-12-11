//--masterCounter receiver graphics

(
var width= 640;
var height= 480;
var win= Window("masterCounter receiver", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
usr.background= Color.black;
usr.animate= true;
usr.clearOnRefresh= false;
~localCounter= 0;
usr.drawFunc= {
	Pen.smoothing= false;
	Pen.translate(~localCounter/255*width, usr.frame%height);
	~localCounter.asBinaryDigits.do{|d, i|
		if(d>0, {
			Pen.fillColor= Color.white;
		}, {
			Pen.fillColor= Color.black;
		});
		Pen.fillRect(Rect(i*(width/255), i*(height/255), 1, 1));
	};
};
win.front;
w= win;
o= OSCresponder(nil, \masterCounter, {|t, r, m|
	//m.postln;
	~localCounter= m[1];
}).add;
CmdPeriod.doOnce({"graphics stopped".postln; o.remove; w.close});
)



NetAddr.localAddr.sendMsg(\masterCounter, 1);
NetAddr.localAddr.sendMsg(\masterCounter, 10);
NetAddr.localAddr.sendMsg(\masterCounter, 123);
