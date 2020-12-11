(
var width= 800, height= 600;
var win= Window("animation template", Rect(300, 300, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
var stopTime= Main.elapsedTime;
usr.background= Color.white;
usr.clearOnRefresh= true;
usr.animate= true;
usr.drawFunc= {
	var length= 15;	//how long to stop at each disk
	var slot, pnt, rot;
	var slotInFlag, stopFlag= false;
	var speed= -0.01;	//speed of rotation (also negative)

	Pen.smoothing= true;
	Pen.width= 1;
	Pen.translate(width*0.5, height*0.5);

	//--slot
	Pen.fillColor= Color.blue;
	slot= Rect(-100, (sin(usr.frame*0.02)*4).linlin(-1, 1, 100, 300), 200, 180);
	slotInFlag= slot.top==100;
	Pen.fillRect(slot);

	//--disks
	Pen.fillColor= Color.red;
	pnt= Point(200, 0);	//circle radius
	if(stopFlag.not, {
		rot= usr.frame*speed;
		pnt= pnt.rotate(rot);
	});
	5.do{|i|
		Pen.fillColor= Color.red;
		pnt= pnt.rotate(2pi/5);
		if(slotInFlag and:{stopFlag.not}, {
			if(slot.contains(Rect.aboutPoint(pnt, 70, 70)), {
				Pen.fillColor= Color.yellow;
				if(stopFlag.not, {
					stopFlag= true;
					stopTime= Main.elapsedTime;
				});
			}, {

			});
		});
		stopFlag.postln;
		Pen.fillOval(Rect.aboutPoint(pnt, 70, 70));//disk size
	};
};
win.front;
CmdPeriod.doOnce({if(win.isClosed.not, {win.close})});
)
