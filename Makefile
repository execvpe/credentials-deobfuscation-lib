CC = gcc
CFLAGS = -pedantic -Wall -Wformat=2 -Wshadow -Wconversion
CPPFLAGS = -lstdc++ -std=c++20

.PHONY: all clean run

all: decrypt

clean:
	rm -f decrypt decrypt.o 

run: decrypt
	./$^

# TEST PROGRAM
decrypt: decrypt.o main.cpp
	$(CC) $(CFLAGS) $(CPPFLAGS) -o decrypt $^

# DECRYPT MODULE
decrypt.o: decrypt.cpp 
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^

# EXAMPLE HEADER
encData:
	java -jar ShuffleCrypt.jar "Not an SSID!" "Definitely not a password..." > $@.hpp
