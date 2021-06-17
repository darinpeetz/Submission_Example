ifeq ($(DEBUG),yes)
    OPT_FLAG = -g3
else
    OPT_FLAG = -g0 -O3
endif

ifeq (, $(shell which icpc))
	CC = CC
else
	CC = icpc
endif

COMPILE = -fPIC -Wall -Wwrite-strings -Wno-strict-aliasing -Wno-unknown-pragmas ${OPT_FLAG}
LINK  =   -fPIC -Wall -Wwrite-strings -Wno-strict-aliasing -Wno-unknown-pragmas ${OPT_FLAG}
PAR   =   mpicxx
SER   =   ${CC}

all: Program Serial_Program
	@echo The executable file \'Program\' has been made

Program: Main.o Print.o Dot.o
	${PAR} ${LINK} Main.o Print.o Dot.o -o Program

Serial_Program: Serial_Main.o Print.o Dot.o
	${SER} ${LINK} Serial_Main.o Print.o Dot.o -o Serial_Program

Main.o: Main.cpp Print.h
	${PAR} ${COMPILE} Main.cpp -c -o Main.o

Serial_Main.o: Serial_Main.cpp Print.h
	${SER} ${COMPILE} Serial_Main.cpp -c -o Serial_Main.o

Print.o: Print.cpp Print.h
	${SER} ${COMPILE} Print.cpp -c -o Print.o

Dot.o: Dot.cpp Dot.h
	${SER} ${COMPILE} Dot.cpp -c -o Dot.o

clean:
	$(RM) *.o Program Serial_Program

tidy:
	$(RM) *.o
