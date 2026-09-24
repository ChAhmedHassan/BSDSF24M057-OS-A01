CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
AR = ar

LIB_OBJS = obj/mystrfunctions.o obj/myfilefunctions.o
LIB = lib/libmyutils.a

all: bin/client_static

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(LIB): $(LIB_OBJS)
	$(AR) rcs $@ $^
	ranlib $@

bin/client_static: obj/main.o $(LIB)
	$(CC) obj/main.o -Llib -lmyutils -o $@

clean:
	rm -f obj/*.o lib/*.a bin/client_static

.PHONY: all clean
