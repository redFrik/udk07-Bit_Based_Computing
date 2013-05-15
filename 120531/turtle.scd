//turtle graphics.  change direction depending on if bits are 1 or 0.
(
var width= 640;
var height= 480;
var win= Window("turtle", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));

~scale= 1;
~number= 85;
~length= 10;
~rotate= 0.15;

usr.background= Color.black;
usr.animate= true;

usr.drawFunc= {
	Pen.smoothing= false;
	Pen.strokeColor= Color.white;
	Pen.translate(width*0.5, height*0.5);
	Pen.moveTo(Point(0, 0));
	~number.asBinaryString(16).reverse.do{|num, i|
		var pnt;
		Pen.scale(~scale, ~scale);
		Pen.rotate(~rotate);
		if(num==$1, {
			pnt= Point(1, 0);
		}, {
			pnt= Point(-1, 0);
		});
		Pen.lineTo(pnt*~length*(i+1));
	};
	Pen.stroke;
};
win.front;
)

~number= 65536.rand
~length= 14
~rotate= 0.05
~rotate= 0.1
~rotate= 0.2
~scale= 1.1
~scale= 0.9
~rotate= 0.5pi
~length= 50
~number= 65536.rand
~scale= 0.99
~length= 5
~number= 65536.rand
