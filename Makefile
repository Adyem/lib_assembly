
CC      = gcc
CFLAGS  = -Wall -g

AS      = as
ASFLAGS = -g

SRCS    = main.asm strlen.asm strcpy.asm ft_strcmp.asm ft_write.asm ft_read.asm ft_strdup.asm ft_putnbr.asm
OBJS    = $(SRCS:.asm=.o)

TARGET  = main

.PHONY: all clean fclean re

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(TARGET)

re: fclean all
