udk-avprogramming 2012_SS
=========================

Olofsson: Audiovisual Programming - Bit based computing

In computing, a bit is the basic unit of information. Its state is either one or zero, on or off, up or down, left or right, black or white, heads or tails... either/or and never something in between. Though a bit's state can be unknown.
A byte is a collection of bits. Like a set of settings. Bytes can represent numbers, colours, graphical patterns, musical rhythms, machine code instructions, search patterns... as in many either/or choices combined.

In this seminar the concept will be to work with binary switches and collections of binary switches in both hardware and software. From simple DIY digital sensors, via circuits of transistors and relays, to the usage of binary operators in code. We will calculate with binary numbers, learn about common binary operations like And, Or, Xor and bit-shifting, do experiment that sonify and visualize bits and bytes and also touch upon encryption and compression of binary data streams. The programming environments we will be using are Arduino, PureData and SuperCollider, but the techniques in question are general and all round useful in computing.

room111, UdK, medienhaus, kleistpark

dates
-----
- [x] 26apr: [`120426`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120426) theory
	* overview bits (compare boolean logic)
	* bit operations and or xor & | ^ (compare && || !=)
	* binary tree 0/1
	* toss coin example
	* bytes, 4bits counting 0-15, 8bits counting to 0-255, lsb, msb
	* 2.pow(x) (compare 10.pow(x))
	* bit left right shift
	* addition with bytes, carry
	* sonification and tweet examples
- [x] 03may: [`120503`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120503) theory
	* repetition bits counting, and or xor, bytes, etc
	* negative numbers, signed vs unsigned
	* 8, 16, 32, 64bit computers, int, double, floats etc
	* lots of examples: music, graphics, patterns, serial communication
	* build pd duotone example, pixelate
	* implement and or xor logic in pd and sc, toggles in pd, asBinaryString in sc
- [x] 10may: `120510` hardware
	* hardware digital switches - bring arduinos!
	* cloth + aluminium folio
	* any metal against any other metal
	* and/or/xor operations on switches input, output to leds
- [x] 16may: [`120516`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120516) hardware
	* connect arduino with pd via serial port. Serial.print vs Serial.write
	* connect many switches, (many leds)
	* << >> shifting examples
	* decode 8bit bytes in pd into single bits
	* test with simple sounds
- [x] 24may: [`120524`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120524) hardware
	* playing with time, gates, doubletriggers etc
	* debouncing digital inputs in arduino, in pd
	* serial protocols combining digital inputs and outputs. Serial.read
	* efficiency considerations (also wireless communication), arduino pinwrite, memory
	* examples
	* transistor and logic in electronics
- [x] 31may: [`120531`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120531) graphics
	* simple 2d graphics in sc visualising bits and bytes
	* turtle graphics
	* cellular automata
- [x] 07jun: [`120607`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120607) sound synthesis
	* mixing squarewaves in sc
	* 8bit sounds
	* modulation
	* rhythms, patterns from bitstreams
- [x] 14jun: [`120614`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120614) encryption and compression
	* diy simple encryption by shuffling bits
	* run length encoding
- [x] 21jun: [`120621`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120621) own projects
	* repetition, tangents
- [x] 28jun: [`120628`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120628) own projects
	* repetition, tangents
- [x] 05jul: [`120705`](https://github.com/redFrik/udk07-Bit_Based_Computing/blob/master/120705) own projects
	* repetition, tangents

software
--------
* [SuperCollider](https://supercollider.github.io)
* [PureData](https://puredata.info)
* [Arduino](https://arduino.cc)
