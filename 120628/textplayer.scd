~arr= [ [ 1.2907479889982, $I ], [ 1.9871970299973, $  ], [ 2.2344426749987, $w ], [ 2.2826772579974, $i ], [ 2.482413881, $l ], [ 2.5865704639982, $l ], [ 2.674506430998, $  ], [ 2.8185192489982, $a ], [ 2.9223183799986, $l ], [ 3.290586764997, $w ], [ 3.7386647049971, $a ], [ 3.8266461359999, $y ], [ 3.9464473009975, $s ], [ 4.2827235649966, $  ], [ 4.538815656997, $l ], [ 4.7547187969976, $o ], [ 4.8824333059965, $v ], [ 5.0102334189978, $e ], [ 5.0742437289991, $  ], [ 5.2346917609975, $y ], [ 5.3463480809987, $o ], [ 5.434569326997, $u ] ]


(
~strPlayer= {|arr|		//function that will play an array of key/time pair arrays
	~str= "";			//store the result in this variable
	Routine({
		var initDelay= 1;	//wait for 1 second in the beginning. change for offset / sync
		initDelay.wait;
		arr.do{|timekey, i|
			var time= timekey[0];
			var char= timekey[1];
			var next= arr[i+1];
			~str= ~str++char;
			char.postln;
			if(next.notNil, {
				(next[0]-time).wait;
			});
		};
	}).play;
};
~strPlayer.value(~arr);
)
