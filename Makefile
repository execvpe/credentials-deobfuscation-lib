AR = ar
ARFLAGS = -rcs
CXX = g++
CXXFLAGS = -pedantic -Wall -Wformat=2 -Wshadow -Wconversion -std=c++11

basedir=$(shell pwd)/

cxx_source_path = $(basedir)/src/
cxx_include_path = $(basedir)/include/

elf_name = deobfuscate-demo
lib_name = deobfuscate

vpath %.cpp $(cxx_source_path)
vpath %.hpp $(cxx_include_path)

.PHONY: all clean lib

all: $(elf_name)

clean:
	rm -f $(elf_name) *.a *.o

lib: lib$(lib_name).a

# DEMO PROGRAM
$(elf_name): demo.cpp.o libdeobfuscate.a
	$(CXX) $(CXXFLAGS) -o $@ $< -L. -ldeobfuscate

demo.cpp.o: demo.cpp obfuscatedData.hpp deobfuscate.hpp 

# DEOBFUSCATION LIBRARY (static)

lib$(lib_name).a: deobfuscate.cpp.o
	$(AR) $(ARFLAGS) $@ $^

# DEOBFUSCATION MODULE
deobfuscate.cpp.o: deobfuscate.cpp deobfuscate.hpp

########################################

%.cpp.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -I$(cxx_include_path) $< -o $(basedir)/$@

