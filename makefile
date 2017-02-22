ifeq ($(DEBUG),yes)
    OPT_FLAG = -g3
else
    OPT_FLAG = -g0 -O3
endif

COMPILE = mpicxx -fPIC -Wall -Wwrite-strings -Wno-strict-aliasing -Wno-unknown-pragmas ${OPT_FLAG}

LINK  =   mpicxx -fPIC -Wall -Wwrite-strings -Wno-strict-aliasing -Wno-unknown-pragmas ${OPT_FLAG}

all: Program
	@echo The executable file \'Program\' has been made

Program: Main.o Print.o
	${LINK} Main.o Print.o -o Program

Main.o: Main.cpp Print.h
	${COMPILE} Main.cpp -c -o Main.o

Print.o: Print.cpp Print.h
	${COMPILE} Print.cpp -c -o Print.o

clean:
	$(RM) *.o Program

tidy:
	$(RM) *.o
