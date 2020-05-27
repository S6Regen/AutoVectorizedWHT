# AutoVectorizedWHT
The Walsh Hadamard transform arranged for auto-vectorizing compilers

to create efficient code. Set compiler optimizations correctly.

Written in FreeBasic 1.07.1, FreeBasic emits C code which is compiled

(& auto-vectorized) by gcc.  For FreeBasic use the -O 3 optimization option. 

It should be easy to convert to C.

I will see if the Java Hotspot Just-In-Time compiler will also auto-vectorize this arrangement.
That would be quite useful and avoid having to use the JNI.
