//--master counter

(
NetAddr.broadcastFlag= true;
~masterNetAddr= NetAddr("192.168.1.255", 57120);	//set router ip here but use 255 for the last number
~masterCounter= 0;
~masterRoutine= Routine({
	inf.do{
		~masterCounter.postln;
		~masterNetAddr.sendMsg(\masterCounter, ~masterCounter);
		~masterCounter= (~masterCounter+1%256).asInteger;
		1.wait;
	};
});
~masterRoutine.play;
)

//~masterRoutine.stop;