
CC      = gcc
CFLAGS  = -Wall -g

AS      = as
ASFLAGS = -g

SRCS    = main.asm strlen.asm strcpy.asm ft_strcmp.asm ft_write.asm ft_read.asm ft_strdup.asm
OBJS    = $(SRCS:.asm=.o)

TARGET  = main

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJS) $(TARGET)
