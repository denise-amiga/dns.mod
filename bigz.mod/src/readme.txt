añadir include a bzf.c

gcc -c -O2 -Wall -DBZ_DEBUG bign.c bigz.c bigq.c bzf.c
ar -c -r ../libbigz.a bigq.o bigz.o bign.o bzf.o
ranlib ../libbigz.a
