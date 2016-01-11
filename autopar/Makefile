CC=sunCC
CFLAGS=-g -fast
LDFLAGS=-xautopar -xloopinfo -xreduction
#LDFLAGS=-xopemmp

EXECUTABLE=prog
SOURCES=pi.c
OBJECTS=$(SOURCES:.c=.o)

all: $(SOURCES) $(EXECUTABLE)
    
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@ 


clean:
	@rm -f *.o core

