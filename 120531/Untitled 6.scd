//window template - simple animation2
(
var width= 640;
var height= 480;
var win= Window("test4", Rect(100, 100, width, height));
var usr= UserView(win, Rect(0, 0, width, height));

usr.background= Color.rand;
usr.animate= true;
usr.drawFunc= {
	Pen.fillColor= Color.red;
	Pen.addOval(Rect(usr.frame*5%width, 10, 300, 300));	//usr.frame is built in counter, 5 is speed and %width makes it not draw out of window bounds
	Pen.addOval(Rect(100, 100, 300, 300));
	//Pen.draw(usr.frame.postln%2);
	Pen.draw(1);
};

win.front;
)