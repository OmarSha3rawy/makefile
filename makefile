#Generic folders
SOURCEDIR = ./src
HEADERDIR = ./Inc
DEPENDENCIESDIR = Dependencies/
OUT = App.exe
vpath %.c ./src

# Compiler and linker
CC = gcc
LINKER = gcc

# all files (sources - deps - objs)
SRC_FILES = $(subst $(SOURCEDIR)/,,$(wildcard $(SOURCEDIR)/*.c))
OBJ_FILES = $(SRC_FILES:.c=.o) 
QUIZ = X:\challenge3\objfiles\Peter_Abdelaziz_Randa_Omar.o
TEMP = $(SOURCE_FILES:.c=.d)
DEP_FILES = $(addprefix $(DEPENDENCIESDIR)\,$(TEMP))
CLEAN_TARGET = $(OUT) $(OBJ_FILES) $(DEP_FILES)

#generating the output
all:$(OUT)
	echo Bulding done !

#clean the disk
clean:
	del $(CLEAN_TARGET)
	echo Cleaning done !

#build if any file changed
$(OUT): $(OBJ_FILES) $(QUIZ) $(DEP_FILES)
	$(LINKER) $^ -o $@ 
	echo Linking done !

#build every c file individually
%.o: %.c  
	$(CC) -I$(HEADERDIR) -c $< -o $@
	$(CC) -MM -I$(HEADERDIR) $< > $(DEPENDENCIESDIR)\$*.d
	
-include $(DEP_FILES)
