CXX = g++
CXXFLAGS = -pedantic -Wall -Wformat=2 -Wshadow -Wconversion -std=c++11

basedir=$(shell pwd)/

cxx_source_path = $(basedir)/src/
cxx_include_path = $(basedir)/include/

elf_name = decrypt-demo

vpath %.cpp $(cxx_source_path)
vpath %.hpp $(cxx_include_path)

.PHONY: all clean

all: $(elf_name)

clean:
	rm -f $(elf_name) *.o 

# DEMO PROGRAM
$(elf_name): deobfuscate.cpp.o demo.cpp.o 
	$(CXX) $(CXXFLAGS) -o $@ $^

demo.cpp.o: demo.cpp obfuscatedData.hpp deobfuscate.hpp 

# DEOBFUSCATE MODULE
deobfuscate.cpp.o: deobfuscate.cpp deobfuscate.hpp

%.cpp.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -I$(cxx_include_path) $< -o $(basedir)/$@
