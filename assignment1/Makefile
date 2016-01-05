# module load studio

# indent libmatmult.c libmatmult.c

# ./matmult_c.studio nat 5 3 2
# ./matmult_c.studio lib 5 3 2
# ./matmult_c.studio blk 5 3 2

# ./matmult_c.studio mnk 5 3 2
# ./matmult_c.studio mkn 5 3 2
# ./matmult_c.studio knm 5 3 2
# ./matmult_c.studio kmn 5 3 2
# ./matmult_c.studio nmk 5 3 2
# ./matmult_c.studio nkm 5 3 2

TARGET	= libmatmult.so
LIBSRCS	= libmatmult.c
LIBOBJS	= libmatmult.o

OPT	= -g
PIC	= -fPIC

CC	= suncc
CFLAGS= $(OPT) $(PIC) $(XOPTS)

SOFLAGS = -shared 
XLIBS	= -L/usr/lib64/atlas -lcblas

$(TARGET): $(LIBOBJS)
	$(CC) -o $@ $(SOFLAGS) $(LIBOBJS) $(XLIBS)

clean:
	@/bin/rm -f core core.* $(LIBOBJS) 
