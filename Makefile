# ----- Makefile -----

# Use GCC to link
CC      = gcc
CFLAGS  = -Wall -g

# Use the assembler (as) to turn .asm into .o
AS      = as
ASFLAGS = -g

# List of all .asm sources
SRCS    = main.asm strlen.asm strcpy.asm
OBJS    = $(SRCS:.asm=.o)

# Name of the final executable
TARGET  = main

.PHONY: all clean

all: $(TARGET)

# Link step: combine all .o files into 'main'
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Generic rule: assemble each .asm into a .o
%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJS) $(TARGET)
