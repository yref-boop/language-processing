SOURCE = practica2
TEST = test.xml
LIB = lfl

all: compile run

compile:
	flex $(SOURCE).l
	bison -o $(SOURCE).tab.c $(SOURCE).y -yd
	gcc -o $(SOURCE) lex.yy.c $(SOURCE).tab.c -$(LIB) -ly

run:
	./$(SOURCE) < $(TEST)

run2:
	./$(SOURCE) $(TEST)

clean:
	rm $(SOURCE) lex.yy.c $(SOURCE).tab.c $(SOURCEuu).tab.h
