vpath %.c ./src
vpath %.h ./inc

OUT := final_zeft.exe

CC := gcc
LINKER := gcc
INCDIRS := -I.

SRC_FILES := $(wildcard *.c) 
OBJ_FILES := $(patsubst %.c,%.o,$(SRC_FILES))
DEP_FILES := $(patsubst %.c,%.d,$(SRC_FILES))
CLEAN_TARGET = $(OUT) $(OBJ_FILES)

all:$(OUT)
	echo Bulding done !

clean:
	-del $(CLEAN_TARGET)
	echo Cleaning done !

QUIZ = X:\challenge3\objfiles\Peter_Abdelaziz_Randa_Omar.o

$(OUT): $(OBJ_FILES) $(QUIZ)
	$(LINKER) $^ -o $@
	echo Linking done !

%.o: %.c
	$(CC) $(INCDIRS) -c $< -o $@

%.d: %.c
	$(CC) $(INCDIRS) -MM $< > $@

-include $(DEP_FILES)
