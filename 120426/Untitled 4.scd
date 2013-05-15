8bits counts 0-255

00000000		0
00000001		1
00000010		2
00000011		3
.
.
.
00111111			63
01000000			64
.
01111111			127
10000000			128

11111111			255

2.pow(7)
2.pow(6)

(midi 0-127 - 7bit resolution)

//left shift 
0101<<1 = 1010
0011<<1	=	0110
0101<<2	= 10100

//right shift
0110>>1 = 0011
0101>>1	= 0010
//unsigned right shift
0101>>1 = 1010

2r0101<<3
<<1 same  *2
<<2		same  *4
<<3		same		*8

2r0101>>1
>>0101	same		/2 ('integer' div)


01000000		>>2
00010000		>>2
00000100		>>2
00000001		>>2



2r1010+2r0110
= 16


0011
0101
0111

and MASKING
or  MERGING
xor	 KEEP DIFFERENCE

01111111
10000000


the way _may go



