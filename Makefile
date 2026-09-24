CC = gcc
CFLAGS = -Wall -Wextra -Iinclude

SRC = src/main.c src/mystrfunctions.c src/myfilefunctions.c

all: bin/client

bin/client: $(SRC)
	$(CC) $(CFLAGS) -o bin/client $(SRC)

clean:
	rm -f bin/client obj/*.o

.PHONY: all clean

