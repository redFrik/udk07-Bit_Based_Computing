

//trigger start rotating
(
~speed= 0.01;
Routine({
	4.rrand(6).wait;	//wait time before injecting slot
	100.do{|i|
		~position= i/100;
		0.01.wait;
	};
	~position= 1;
	4.rrand(6).wait;	//wait time for playing disc
	100.do{|i|
		~position= 1-(i/100);
		0.01.wait;
	};
	~position= 0;
	2.wait;	//extra wait before stopping
	~speed= 0;
	"finished".postln;
}).play;
)

