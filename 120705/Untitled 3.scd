(
var width= 800, height= 600;
var win= Window("animation template", Rect(300, 300, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
usr.background= Color.white;
usr.clearOnRefresh= true;
usr.animate= true;
usr.drawFunc= {
	Pen.smoothing= true;
	Pen.width= 1;
	Pen.translate(width*0.5, height*0.5);
	
	//--slot
	Pen.fillColor= Color.blue;
	Pen.fillRect(Rect(-100, 100, 200, 180));
	
	//--disks
	Pen.fillColor= Color.red;
	p= Point(200, 0);	//circle radius
	Pen.rotate(usr.frame* -0.01);	//speed of rotation (also negative)
	5.do{|i|
		Pen.rotate(2pi/5, 0, 0);
		Pen.fillOval(Rect.aboutPoint(p, 70, 70));//disk size
	};
};
win.front;
CmdPeriod.doOnce({if(win.isClosed.not, {win.close})});
)