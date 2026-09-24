CC = gcc
CFLAGS = -Wall -Wextra -Iinclude

LIB_OBJS = obj/mystrfunctions.o obj/myfilefunctions.o
LIB = lib/libmyutils.so

all: bin/client_dynamic

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

$(LIB): $(LIB_OBJS)
	$(CC) -shared -o $@ $^

bin/client_dynamic: obj/main.o $(LIB)
	$(CC) obj/main.o -Llib -lmyutils -o $@

clean:
	rm -f obj/*.o lib/*.so bin/client_dynamic

.PHONY: all clean
