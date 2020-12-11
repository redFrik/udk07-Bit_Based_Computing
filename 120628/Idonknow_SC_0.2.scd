(
s.waitForBoot{

	var posx= 100;	//change here to 1680 or whatever is needed to get to the second virtual screen
	var posy= 100;
	var width= 640;
	var height= 400;
	var mouthPos= width/8;
	var mouthWidth= (width/8)*2;
	var win= Window("string test", Rect(posx, posy, width, height), false, false);
	var usr= UserView(win, Rect(0, 0, width, height));
	var fnt= Font("Geneva", 40);	//FuturaStd-Light
	var str= "";		//current string to display (is growing from keystroke data)
	var amp= 0.5;		//amplitude from song
	var syn;			//tracker synth instance
	var osc;			//osc responder instance
	var state= 1;		//loading or singing
	var startTime= 0;	//to know when a song started
	var loading= 0.0;	//percentage loading
	var song= 0;		//current song index

	var strings= [	//song data (path, length in seconds, keystroke data)

		[ [ 2.796330675, $o ], [ 2.996254875, $n ], [ 3.076523986, $e ], [ 3.171988389, $  ], [ 4.149165602, $o ], [ 4.31712229, $n ], [ 4.413092824, $e ], [ 4.516136098, $  ], [ 4.876686995, $o ], [ 5.068922457, $n ], [ 5.189040185, $e ], [ 5.285029218, $  ], [ 6.477103861, $o ], [ 6.66098756, $n ], [ 6.781118677, $e ], [ 6.8768758, $  ], [ 7.013015652, $o ], [ 7.14117121, $n ], [ 7.24491855, $e ], [ 7.373513503, $  ], [ 7.533187927, $o ], [ 7.637152448, $n ], [ 7.717205813, $e ] ],

		[ [ 5.361674488, $t ], [ 5.7616325, $w ], [ 6.049443887, $o ], [ 6.257816656, $  ], [ 6.729847947, $t ], [ 7.848855013, $w ], [ 7.937829188, $o ], [ 8.121880333, $  ], [ 8.265870893, $t ], [ 8.457901184, $w ], [ 8.561645301, $o ], [ 8.753593053, $  ], [ 9.081703914, $t ], [ 9.529866878, $w ], [ 9.609835444, $o ], [ 9.641649836, $  ], [ 10.065413311, $t ], [ 10.274046751, $w ], [ 10.337966152, $o ], [ 10.402072773, $  ], [ 10.625811263, $t ], [ 10.785692157, $w ], [ 10.889852, $o ], [ 11.049831209, $  ], [ 11.321779124, $t ], [ 11.505872973, $w ], [ 11.67377695, $o ] ],

		[ [ 2.011993471, $t ], [ 2.172039428, $h ], [ 2.395755831, $r ], [ 2.571991438, $e ], [ 2.71630299, $e ], [ 3.163975333, $  ], [ 4.899536173, $t ], [ 5.043803369, $h ], [ 5.195662253, $r ], [ 5.347651383, $e ], [ 5.507165439, $e ], [ 5.635293326, $  ], [ 6.091112168, $t ], [ 6.211002469, $h ], [ 6.363007498, $r ], [ 6.675914122, $e ], [ 7.019900988, $e ], [ 7.307953951, $  ], [ 7.579803429, $t ], [ 7.683798824, $h ], [ 7.772020879, $r ], [ 7.92299022, $e ], [ 8.099483391, $e ] ],

		[ [ 1.3632703580001, $f ], [ 1.5621920150002, $o ], [ 1.8674265889999, $u ], [ 2.1470639730001, $r ], [ 2.6674412550001, $  ], [ 3.4340802370002, $f ], [ 3.5621781039999, $o ], [ 3.7382478039999, $u ], [ 3.8582199860002, $r ], [ 4.0433563420002, $  ], [ 4.3232043530002, $f ], [ 4.3869898140001, $h ], [ 4.6754576840003, $o ], [ 5.9233174850001, $r ] ],

		[ [ 2.0937693700002, $f ], [ 2.2855746370001, $i ], [ 2.397722835, $v ], [ 2.5415893060003, $e ], [ 3.1254670150001, $  ], [ 3.4614199040002, $f ], [ 3.5815496509999, $i ], [ 3.6776758670003, $v ], [ 3.813530467, $e ], [ 3.9656509770002, $  ], [ 4.1336419520003, $f ], [ 4.325754645, $i ], [ 4.453453222, $v ], [ 4.5896641160002, $e ], [ 4.7331300380001, $  ], [ 5.0935496860002, $i ], [ 6.1818264670001, $v ], [ 6.309749385, $e ] ]

	];

	var offsets= [
		-2,
		-5,
		-2,
		-1.1,
		-2
	];

	var buffers= [	//loading soundfiles into buffers
		Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav"),
		Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav"),
		Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav"),
		Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav"),
		Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav")
	];

	//--graphics
	usr.background= Color.black;
	usr.animate= true;
	usr.drawFunc= {
		switch(state,
			0, {		//singing state
				var time= Main.elapsedTime-startTime;	//figure out how far into song
				var index= strings[song].detectIndex{|arr| (arr[0]+offsets[song])>time};//find index of keystroke
				str= strings[song].copyRange(0, index).collect{|arr| arr[1]}.join;//make string from beginning to index

				Pen.fillColor= Color.white;
				Pen.font= fnt;
				Pen.stringAtPoint(str, Point(100, 100));	//render keystroke string

				//Pen.fillRect(Rect(50, height*0.5, width-60, amp*150));
				Pen.fillRect(Rect(mouthPos, amp.linexp(0, 1, height*0.5, height*0.45), width-(mouthWidth), amp.lincurve(0, 1, 0.001, 200, -4)));//render mouth

				if(time>buffers[state].duration, {//check if finished
					loading= 0;
					state= 1;	//jump to loading state next frame
				});
			},
			1, {		//loading state
				Pen.fillColor= Color.white;
				Pen.strokeColor= Color.white;
				Pen.font= fnt;
				Pen.stringCenteredIn("Loading", Rect(0, height*0.3, width, height*0.4));
				Pen.width= 4;
				Pen.joinStyle= 1;
				Pen.strokeRect(Rect(width*0.5-70, height*0.6, 140, 20));
				//14.do{|x, i| Pen.fillRect(Rect(width*0.5-70+(usr.frame%10)+(i*10), height*0.6, 4, 20))};//alternativ animation
				Pen.fillRect(Rect(width*0.5-70, height*0.6, loading*140, 20));
				loading= (loading+0.01).clip(0, 1);	//0.01 is loading speed
				if(loading==1, {
					song= 5.xrand(song);	//pick new random song - not previous
					syn= Synth(\amptrack, [\buf, buffers[song]]);
					startTime= Main.elapsedTime;
					state= 0;	//jump to singing state next frame
				});
			}
		);
	};
	win.front;

	//--audio
	SynthDef(\amptrack, {|rate= 60, atk= 0.1, rel= 0.5, buf|
		//var src= SoundIn.ar; // test with mic
		var src= PlayBuf.ar(1, buf, doneAction:2); // test with acapella
		var trk= Amplitude.kr(src, atk, rel);
		SendTrig.kr(Impulse.kr(rate), 0, trk);
		Out.ar(0, src); //optional monitor
	}).add;
	s.sync;
	osc= OSCresponder(s.addr, \tr, {|t, r, m| amp= m[3]}).add;
	CmdPeriod.doOnce({win.close; buffers.do{|x| x.free}; osc.remove});
};
)
