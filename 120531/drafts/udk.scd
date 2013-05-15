//asBinaryString
//do
//collect
c[4].asBinaryString
c[4]
Array.fill(8, {|i| (2**(7-i)).asInteger&c[4]>>(7-i)})


//--
c= [1, 2, 3, 4, 5];
n= 16;
w= 10;
h= 10;

(
var width= 640;
var height= 480;
var win= Window("test", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
usr.background= Color.black;
usr.animate= true;
usr.drawFunc= {
	Pen.fillColor= Color.white;
	c.do{|cc, y|
		cc.asBinaryString(n).do{|bb, x|
			if(bb==$1, {
				//Pen.fillRect(Rect(x/n*width, y/c.size*height, 10, 10));
				Pen.fillRect(Rect(x/n*width, y/c.size*height, w, h));
			});
		};
	};
};
win.front;
)

c= (1..40)
n= 8



//--
d= 0;
(
var width= 640;
var height= 480;
var win= Window("test2", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
usr.background= Color.black;
usr.animate= true;
usr.drawFunc= {
	Pen.fillColor= Color.white;
	c.do{|cc, y|
		cc.asBinaryString(n).do{|bb, x|
			if(bb==$1, {
				//Pen.fillRect(Rect(x/n*width, y/c.size*height, 10, 10));
				Pen.addRect(Rect(x/n*width, y/c.size*height, w, h));
			});
		};
	};
	Pen.draw(d);
};
win.front;
)
w= 100
d= 0
d= 1
d= 2
d= 3
d= 4





d= 0;
(
var width= 640;
var height= 480;
var win= Window("test3", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
usr.background= Color.black;
usr.animate= true;
usr.drawFunc= {
	Pen.fillColor= Color.red;
	Pen.addOval(Rect(220, 220, 400, 400));
	Pen.addOval(Rect(110, 110, 400, 400));
	Pen.addOval(Rect(0, 0, 400, 400));
	Pen.draw(d);
};
win.front;
)

d= 0;	//or	(fill)
d= 1;	//xor	(fill even-odd rule)
d= 2;	//		(stroke)
d= 3
d= 4
Pen