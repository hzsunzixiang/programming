CFLAGS 		= -g -W -Wall 
SRCS  		= main.c mode.c des.c tools.c key.c
OBJS		= $(SRCS:.c=.o)

all:		$(OBJS)
		gcc -o des $(OBJS)

clean:
		rm -f $(OBJS)

fclean:		clean
		rm -f des

re:		fclean all


check-syntax:
	        gcc -W -Wall -pedantic -ansi -Wstrict-prototypes -fsyntax-only $(SRC) $(CFLAGS)
