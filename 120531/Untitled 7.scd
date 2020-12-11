//display the counter (0-255) in sequence
(
var width= 640;
var height= 480;
var win= Window("counting 0-255 in time", Rect(100, 100, width, height));
var usr= UserView(win, Rect(0, 0, width, height));

~number= 6;
~length= 8;		//number of bit in a byte

usr.background= Color.black;
usr.animate= true;
usr.drawFunc= {

	Pen.fillColor= Color.white;
	~number.asBinaryString(~length).do{|char, i|
		if(char==$1, {
			Pen.addRect(Rect(i/~length*width, 0, 10, height));	//play with different widths (now 10)
		});
	};
	Pen.draw(1);	//xor
};

win.front;
)

~number= 256.rand

(
Routine({
	256.do{|i| ~number= i.postln; 0.1.wait;}
}).play;
)

Tdef(\numberCount, {256.do{|i| ~number= i; 0.01.wait}}).play

//count using 16-bit bytes
~length= 16
(
Routine({
	65536.do{|i| ~number= i; 0.01.wait;}
}).play;
)
~number= 6
~number= 1
~number= 255
~number= 65535
~number= 256.rand
