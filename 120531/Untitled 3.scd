//simple graphics in supercollider


//and, or, xor?

and
 00010101
 00010111
=00010101

or
 00010101
 00010111
=00010111
  
xor
 00010101
 00010111
=00000010


//window template
(
var width= 640;
var height= 480;
var win= Window("test1", Rect(100, 100, width, height));
var usr= UserView(win, Rect(0, 0, width, height));

usr.background= Color.rand;



win.front;
)


//window template - testing draw modes
(
var width= 640;
var height= 480;
var win= Window("test2", Rect(100, 100, width, height));
var usr= UserView(win, Rect(0, 0, width, height));

usr.background= Color.rand;

usr.drawFunc= {
	Pen.fillColor= Color.red;
	Pen.addOval(Rect(10, 10, 300, 300));//x, y, width, height
	Pen.addOval(Rect(100, 100, 300, 300));
	Pen.draw(0);	//draw mode 0 corresponds to OR operation
	//Pen.draw(1);	//draw mode 1 corresponds to XOR operation
};

win.front;
)
