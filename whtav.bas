' The Walsh Hadamard transform arranged for auto-vectorizing compilers
' to create efficient code. Set compiler optimizations correctly.
' Written in FreeBasic 1.07.1, FreeBasic emits C code with is compiled
' (& auto-vectorized) by gcc.  For FreeBasic use the -O 3 optimization option.  
sub wht4(x as single ptr,scale as single,n as longint)
    do
		dim as single x0=scale*x[0],x1=scale*x[1],x2=scale*x[2],x3=scale*x[3]
		dim as single a=x0,b=x1
		x0=a+b
		x1=a-b
		a=x2
		b=x3
		x2=a+b
		x3=a-b
		a=x0
		b=x2
		x0=a+b
		x2=a-b
		a=x1
		b=x3
		x1=a+b
		x3=a-b
		x[0]=x0:x[1]=x1:x[2]=x2:x[3]=x3
		n-=4
		x+=4
	loop until n=0
end sub

sub wht8(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 3
	  dim as single a=x[i],b=x[i+4]
	  x[i]=a+b
	  x[i+4]=a-b
	next
	n-=8
	x+=8
	loop until n=0
end sub

sub wht16(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 7
	  dim as single a=x[i],b=x[i+8]
	  x[i]=a+b
	  x[i+8]=a-b
	next
	n-=16
	x+=16
	loop until n=0
end sub

sub wht32(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 15
	  dim as single a=x[i],b=x[i+16]
	  x[i]=a+b
	  x[i+16]=a-b
	next
	n-=32
	x+=32
	loop until n=0
end sub

sub wht64(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 31
	  dim as single a=x[i],b=x[i+32]
	  x[i]=a+b
	  x[i+32]=a-b
	next
	n-=64
	x+=64
	loop until n=0
end sub

sub wht128(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 63
	  dim as single a=x[i],b=x[i+64]
	  x[i]=a+b
	  x[i+64]=a-b
	next
	n-=128
	x+=128
	loop until n=0
end sub

sub wht256(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 127
	  dim as single a=x[i],b=x[i+128]
	  x[i]=a+b
	  x[i+128]=a-b
	next
	n-=256
	x+=256
	loop until n=0
end sub

sub wht512(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 255
	  dim as single a=x[i],b=x[i+256]
	  x[i]=a+b
	  x[i+256]=a-b
	next
	n-=512
	x+=512
	loop until n=0
end sub

sub wht1024(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 511
	  dim as single a=x[i],b=x[i+512]
	  x[i]=a+b
	  x[i+512]=a-b
	next
	n-=1024
	x+=1024
	loop until n=0
end sub

sub wht2048(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 1023
	  dim as single a=x[i],b=x[i+1024]
	  x[i]=a+b
	  x[i+1024]=a-b
	next
	n-=2048
	x+=2048
	loop until n=0
end sub

sub wht4096(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 2047
	  dim as single a=x[i],b=x[i+2048]
	  x[i]=a+b
	  x[i+2048]=a-b
	next
	n-=4096
	x+=4096
	loop until n=0
end sub

sub wht8192(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 4095
	  dim as single a=x[i],b=x[i+4096]
	  x[i]=a+b
	  x[i+4096]=a-b
	next
	n-=8192
	x+=8192
	loop until n=0
end sub

sub wht16384(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 8191
	  dim as single a=x[i],b=x[i+8192]
	  x[i]=a+b
	  x[i+8192]=a-b
	next
	n-=16384
	x+=16384
	loop until n=0
end sub

sub wht32768(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 16383
	  dim as single a=x[i],b=x[i+16384]
	  x[i]=a+b
	  x[i+16384]=a-b
	next
	n-=32768
	x+=32768
	loop until n=0
end sub

sub wht65536(x as single ptr,n as ulongint)
 do
	for i as ulong=0 to 32767
	  dim as single a=x[i],b=x[i+32768]
	  x[i]=a+b
	  x[i+32768]=a-b
	next
	n-=65536
	x+=65536
	loop until n=0
end sub

'  Standard Walsh Hadamard transform. Normally the vector magnitude  is
'  unchanged by the WHT, but include a scale argument if you want to alter it
sub whtav(x as single ptr, n as ulong,scale as single=1!)
	dim as ulong k=n
	dim as single sc=scale/sqr(n)
	if n<4 then print "Fail. n<4"
	if (n and (n-1))<>0 then print "Fail. n not int. power of 2"
	wht4(x,sc,n)
	k shr=3 'divide by 8
	if k=0 then return
	wht8(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht16(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht32(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht64(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht128(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht256(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht512(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht1024(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht2048(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht4096(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht8192(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht16384(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht32768(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht65536(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	print "Fail. n too big"
end sub

' Version of the Walsh Hadamard transform that is CPU cache aware and
' faster for large vectors
sub whtqav(x as single ptr,n as ulongint)
	const lim as ulongint=8192
	var k=n
	if k>lim then k=lim
	dim as single scale=sqr(k)/sqr(n)
	for i as ulongint=0 to n-1 step lim
	   whtav(x+i,k,scale)
	next
	k=n shr 14
	if k=0 then return
	wht16384(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht32768(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	wht65536(x,n)
	k shr=1 'divide by 2
	if k=0 then return
	print "Fail. n too big"	
end sub
/'
#include "wht.bi"
dim as single x(65535) '65536 elements
dim as single y(65535) '65536 elements
var t1=timer
for i as ulong=0 to 999
whtqav(@x(0),65536)
next
var t2=timer
print "65536-point WHTs Per second:",1000/(t2-t1)
for i as ulong=2 to 16
   dim as ulong n=1 shl i
   print "size",n
   redim x(n-1),y(n-1)
   for j as ulong=0 to n-1
     x(j)=2*rnd()-1
     y(j)=x(j)
   next
   whtav(@x(0),n)
   fht_float(@y(0),i)  ' compare with independant WHT library FFHT
   dim as single sc=1!/sqr(n)
   dim as double e
   for j as ulong=0 to n-1
     var d=x(j)-sc*y(j)
     e+=d*d
   next
   print "error",e
   print
next 
getkey
'/
