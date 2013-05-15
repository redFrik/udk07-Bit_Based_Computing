
~transform= {|val, steps= 0, digits= 32| val.asBinaryDigits(digits).rotate(steps).sum{|x, i| x*2.pow(digits-1-i)}.asInteger};
a= ~transform.value(1234, 3)
~transform.value(a, -3)




~rle= {|val, steps= 0, digits= 32| val.asBinaryDigits(digits).collect}

(
var arr= 12345.asBinaryDigits(32).postln;
var res= [];
var cnt= 0;
var prev= arr[0];
(arr.size-1).do{|i|
	var curr= arr[i+1];
	if(curr==prev, {
		cnt= cnt+1;
	}, {
		res= res.add(prev);
		if(cnt>0, {
			res= res.add(cnt|128);
		});
		cnt= 0;
	});
	prev= curr;
};
res
)

(
~rleEncode= {|arr, maxBits= 8|
	var res= [];
	var cnt= 0;
	var bit= 2.pow(maxBits).asInteger;	//bit to use as flag
	arr.do{|x, i|
		if(arr[i+1]!=x, {				//sloppy test here - out of bounds
			res= res.add(x);
			if(cnt>0, {
				res= res.add(cnt|bit);
				cnt= 0;
			});
		}, {
			cnt= cnt+1;
		});
	};
	res;
};
)
a= ~rleEncode.value(12345.asBinaryDigits(32))

(
~rleDecode= {|arr, maxBits= 8|
	var res= [];
	var cnt= 0, i= 0;
	var bit= 2.pow(maxBits).asInteger;
	while({i<arr.size}, {
		var x= arr[i];
		if((x&bit)==bit, {
			cnt= x&(bit-1);
			x= arr[i-1];
			cnt.do{
				res= res.add(x);
			};
		}, {
			res= res.add(x);
		});
		i= i+1;
	});
	res;
};
)
b= ~rleDecode.value(a)
b.sum{|x, i| x*2.pow(31-i)}


RedRLE
RedHuffman
http://huffman.ooz.ie/

//mufi


Ndef(\bitx, {|rate= 0.5, bits= 4| Latch.ar((SoundIn.ar*bits+bits).floor-bits/bits, Impulse.ar(SampleRate.ir*0.5*rate))})
Ndef(\bitx).play
Ndef(\bitx).gui

Ndef(\bit8, {|rate= 0.5, bits= 4, freq= 150| Latch.ar((SoundIn.ar*FSinOsc.ar(freq)*bits+bits).floor-bits/bits, Impulse.ar(SampleRate.ir*0.5*rate))})
Ndef(\bit8).play
Ndef(\bit8).gui

http://en.wikipedia.org/wiki/7-segment_display
