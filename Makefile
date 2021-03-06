IDIR=include
SDIR=src
DEPS_H=token_parser.h helix_magnet.h coil.h
SOURCES_C=helix_magnet.cpp coil.cpp
MAIN_C=main.cpp

DEPS=$(addprefix $(IDIR)/,$(DEPS_H))
SOURCESC=$(addprefix $(SDIR)/,$(SOURCES_C) $(MAIN_C))
CC=g++
EXECUTABLE=HELIX_MAGNET
OBJECTSC=$(SOURCESC:.cpp=.o)
CFLAGS=-I$(IDIR) -lgsl -lgslcblas -std=c++11

all: $(EXECUTABLE) $(SOURCESC) $(DEPS)

$(EXECUTABLE): $(OBJECTSC)
	$(CC) -o $@ $(OBJECTSC) $(CFLAGS)

.cpp.o:
	$(CC) -c $(CFLAGS) $< -o $@

.PHONY: clean

clean:
	rm -f $(SDIR)/*.o  $(EXECUTABLE)
