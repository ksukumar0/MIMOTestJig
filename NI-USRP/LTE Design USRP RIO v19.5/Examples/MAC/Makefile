TARGET := MACsimpleDL MACsimpleUE MACsimpleENB

CC := x86_64-nilrt-linux-g++
LINKER := x86_64-nilrt-linux-g++
INCDIRS := -I . -I util
LIBS := -lpthread
CFLAGS := -fpermissive -std=c++11 -fPIC -pthread -O3 -g -rdynamic
DEST := /usr/local/bin

MAINSRCFILES := mainDL.c mainUE.c maineNB.c
COMMONSRCFILES := $(wildcard */*.c)
COMMONSRCFILES := $(filter-out $(MAINSRCFILES), $(wildcard *.c) $(COMMONSRCFILES))
OBJFILES := $(patsubst %.c,%.o,$(COMMONSRCFILES))
MAINOBJFILES := $(patsubst %.c,%.o,$(MAINSRCFILES))
DEPFILES := $(patsubst %.c,%.d,$(COMMONSRCFILES))
MAINDEPFILES := $(patsubst %.c,%.d,$(MAINSRCFILES))

all: MACsimpleDL MACsimpleUE MACsimpleENB

MACsimpleDL: mainDL.o $(OBJFILES)
	$(LINKER) $(LIBS) $^ -o $@

MACsimpleUE: mainUE.o $(OBJFILES)
	$(LINKER) $(LIBS) $^ -o $@

MACsimpleENB: maineNB.o $(OBJFILES)
	$(LINKER) $(LIBS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) $(INCDIRS) -c $< -o $@

%.d: %.c
	$(CC) $(INCDIRS) -MM $< > $@

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJFILES) $(MAINOBJFILES) $(DEPFILES) $(MAINDEPFILES)

install: $(TARGET)
	cp $(TARGET) $(DEST)

-include $(DEPFILES) $(MAINDEPFILES)

.PHONY: uninstall
uninstall:
	$(RM) $(addprefix $(DEST)/,$(TARGET))
