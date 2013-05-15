//window template - simple animation
(
var width= 640;
var height= 480;
var win= Window("test3", Rect(100, 100, width, height));
var usr= UserView(win, Rect(0, 0, width, height));

usr.background= Color.rand;
usr.animate= true;
usr.drawFunc= {
	Pen.fillColor= Color.red;
	Pen.addOval(Rect(10, 10, 300.rand, 300));//x, y, width, height
	Pen.addOval(Rect(100, 100, 300, 300.rand));
	Pen.draw(0);	//draw mode 0 corresponds to OR operation
	//Pen.draw(1);	//draw mode 1 corresponds to XOR operation
};

win.front;
)