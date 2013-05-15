(
var width= 800, height= 600;
var win= Window("animation template", Rect(300, 300, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
var stopFlag= false;
var rot= 0;
var stopIndex= -1;
var slotPosition= 0;	//zero to one
var lables= ["Fucked up pendulum", "Horse with no name", "Table tennis", "4. kjk2122", "5. dfddfjjj"];
~speed= 0;
~position= 0;
usr.background= Color.gray;
usr.clearOnRefresh= true;
usr.animate= true;
usr.drawFunc= {
	var length= 15;	//how long to stop at each disk
	var slot, pnt;
	var slotInFlag;
	Pen.smoothing= true;
	Pen.width= 1;
	Pen.font= Font("Times", 30);
	Pen.translate(width*0.5, height*0.5);
	
	//--slot
	Pen.fillColor= Color.blue;
	slot= Rect(-100, ~position.linlin(0, 1, 300, 100), 200, 200);
	slotInFlag= ~position==1;
	Pen.fillRect(slot);
	
	//--disks
	pnt= Point(200, 0);	//circle radius
	if(stopFlag.not, {
		rot= (rot+~speed).wrap(0, 2pi);
	});
	pnt= pnt.rotate(rot);
	5.do{|i|
		var testSlot;
		pnt= pnt.rotate(2pi/5);
		if(slotInFlag and:{stopFlag.not}, {
			testSlot= Rect(slot.left-10, slot.top, slot.width, slot.height);	//here test to fix in the middle!
			if(testSlot.contains(Rect.aboutPoint(pnt, 70, 70)), {	//rot>3.8 and:{rot<4.2}
				stopFlag= true;
				stopIndex= i;
			}, {
				
			});
		});
		stopFlag= stopFlag and:{slotInFlag};
		if(stopFlag and:{stopIndex==i}, {
			Pen.fillColor= Color.white;
		}, {
			Pen.fillColor= Color.red;
		});
		Pen.fillOval(Rect.aboutPoint(pnt, 70, 70));//disk size
		
		//--label
		if(stopFlag and:{stopIndex==i}, {
			Pen.fillColor= Color.black;
			Pen.stringAtPoint(lables[stopIndex], pnt+Point(100, 0));	//last point is text offset
		});
	};
};
win.front;
CmdPeriod.doOnce({if(win.isClosed.not, {win.close})});
)