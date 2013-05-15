//diplay the counter (0-255) vertically - version2 ovals (heavy on the cpu!)
//save all documents before running this
(
var width= 640;
var height= 480;
var win= Window("counting 0-255 vertically version2 ovals", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));

~objwidth= 100;
~objheight= 50;
~mode= 1;

usr.background= Color.black;
usr.animate= true;
usr.drawFunc= {
	Pen.smoothing= true;	//play with this (true / false)
	Pen.strokeColor= Color.red;
	Pen.fillColor= Color.white;
	256.do{|cnt|
		cnt.asBinaryString(8).do{|char, i|
			if(char==$1, {
			Pen.addOval(Rect(i/8*width, cnt/256*height, ~objwidth, ~objheight));
			});
		};
	};
	Pen.draw(~mode);	//xor
};

win.front;
)
~objwidth= 200.rand
~objheight= 100.rand
(
Routine({
	200.do{|i| ~objwidth= i; ~objheight= i; 0.1.wait};
}).play;
)
~objheight= 30
~mode= 5.rand
~objheight= 50;
~objwidth= 100;
~mode= 5.rand
~mode= 1
