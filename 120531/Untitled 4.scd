6.asBinaryString

//asBinaryString does this under the hood...
Array.fill(8, {|i| (2**i).asInteger & 6 >> i}).reverse

//optimized version...
Array.fill(8, {|i| (2**(7-i)).asInteger & 6 >> (7-i)})

//our own converter function...
f= {|val, bits= 8| Array.fill(bits, {|i| (2**(bits-1-i)).asInteger&val>>(bits-1-i)})};
f.value(6, 8)
f.value(255, 16)
f.value(256, 16)

6.asBinaryString(16)
Array.fill(16, {|i| (2**i).asInteger & 6 >> i}).reverse

6.asBinaryString(32)
20000.asBinaryString(32)
