//diplay the counter (0-255) vertically
(
var width= 640;
var height= 480;
var win= Window("counting 0-255 vertically", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));

~objwidth= 10;
~objheight= 1;
~mode= 1;
~length= 8;

usr.background= Color.black;
usr.animate= true;
usr.drawFunc= {
	Pen.smoothing= false;	//play with this (true / false)
	Pen.strokeColor= Color.red;
	Pen.fillColor= Color.white;
	256.do{|cnt|
		cnt.asBinaryString(~length).do{|char, i|
			if(char==$1, {
			Pen.addRect(Rect(i/~length*width, cnt/256*height, ~objwidth, ~objheight));
			});
		};
	};
	Pen.draw(~mode);	//xor
};

win.front;
)
~length= 16
~objwidth= 200.rand
~length= 8
(
Routine({
	200.do{|i| ~objwidth= i; 0.1.wait};
}).play;
)
~objheight= 100
~mode= 5.rand
~objheight= 200;
~objwidth= 140;
~length= 4
~mode= 4
~mode= 2
~length= 5
~length= 6
