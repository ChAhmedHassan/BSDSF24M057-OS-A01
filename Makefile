CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
PREFIX = /usr/local

LIB_OBJS = obj/mystrfunctions.o obj/myfilefunctions.o
LIB = lib/libmyutils.so

all: bin/client_dynamic

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

$(LIB): $(LIB_OBJS)
	$(CC) -shared -o $@ $^

bin/client_dynamic: obj/main.o $(LIB)
	$(CC) obj/main.o -Llib -lmyutils -o $@

install: all
	install -d $(PREFIX)/bin $(PREFIX)/lib $(PREFIX)/share/man/man3
	install -m 755 bin/client_dynamic $(PREFIX)/bin/client
	install -m 755 $(LIB) $(PREFIX)/lib/libmyutils.so
	install -m 644 man/man3/mystrfunctions.3 $(PREFIX)/share/man/man3/
	install -m 644 man/man3/myfilefunctions.3 $(PREFIX)/share/man/man3/
	ldconfig
	mandb -q

uninstall:
	rm -f $(PREFIX)/bin/client
	rm -f $(PREFIX)/lib/libmyutils.so
	rm -f $(PREFIX)/share/man/man3/mystrfunctions.3
	rm -f $(PREFIX)/share/man/man3/myfilefunctions.3
	ldconfig
	mandb -q

clean:
	rm -f obj/*.o lib/*.so bin/client_dynamic

.PHONY: all install uninstall clean
