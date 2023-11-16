SOURCE = practica2
TEST = proba.txt
LIB = lfl

all: compile

compile:
	flex $(SOURCE).l
	gcc -o $(SOURCE) lex.yy.c -$(LIB)

clean:
	rm $(SOURCE) lex.yy.c

run:
	./$(SOURCE) < $(TEST)

run2:
	./$(SOURCE)

