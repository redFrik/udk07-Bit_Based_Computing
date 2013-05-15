(
var width= 640;
var height= 480;
var win= Window("string test", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
usr.background= Color.black;
usr.animate= true;
~str= "test";
usr.drawFunc= {
	Pen.fillColor= Color.white;
	Pen.font= Font("Helvetica", 40);
	Pen.stringAtPoint(~str, Point(10, 10));
};
win.front;
CmdPeriod.doOnce({win.close});
)


(
~strOrg= "i will always love you";
Routine({
	~str= "";
	1.wait;
	~str= ~strOrg.copyRange(0, 1);
	1.wait;
	~str= ~strOrg.copyRange(0, 2);
	1.wait;
	~str= ~strOrg.copyRange(0, 3);
	0.5.wait;
	~str= ~strOrg.copyRange(0, 4);
	0.5.wait;
	~str= ~strOrg.copyRange(0, 5);
	1.wait;
	~str= ~strOrg.copyRange(0, 6);
	0.5.wait;
	~str= ~strOrg.copyRange(0, 7);
	0.5.wait;
	~str= ~strOrg.copyRange(0, 8);
	0.5.wait;
	~str= ~strOrg.copyRange(0, 9);
	0.5.wait;
	~str= ~strOrg.copyRange(0, 10);
	0.5.wait;
	~str= ~strOrg.copyRange(0, 11);
	0.25.wait;
	~str= ~strOrg.copyRange(0, 12);
	0.25.wait;
	~str= ~strOrg.copyRange(0, 13);
	0.25.wait;
	~str= ~strOrg.copyRange(0, 14);
	0.25.wait;
	~str= ~strOrg.copyRange(0, 15);
	0.25.wait;
	~str= ~strOrg.copyRange(0, 16);
	0.125.wait;
	~str= ~strOrg.copyRange(0, 17);
	0.125.wait;
	~str= ~strOrg.copyRange(0, 18);
	0.125.wait;
	~str= ~strOrg.copyRange(0, 19);
	0.125.wait;
	~str= ~strOrg.copyRange(0, 20);
	0.125.wait;
	~str= ~strOrg.copyRange(0, 21);
	0.125.wait;
}).play;
)

