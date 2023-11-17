%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern int yylex();
extern int yylineno;
void yyerror (char const *);
%}

%union{
    char* string;
}

%token <string> prolog
%token <string> opentag
%token <string> closetag

%start S

%%

S	: prolog tags {printf("correct XML syntax\n"); exit(0);}
	| error tags {yyerror("Error: no valid header found\n"); exit(0);};

tags  	: opentag closetag {if(strcmp($1+1, $2+2)!=0) {
		printf("Error: tag %s not properly closed \n(line: %d)\n", $1, yylineno); exit(2);}}
	| opentag values values {printf("Error: tag %s not properly closed \n(line: %d)\n", $1, yylineno); exit(2);}
	| opentag values closetag {if(strcmp($1+1, $3+2)!=0) {
		printf("Error: tag %s not properly closed \n(line: %d)\n", $1, yylineno); exit(2);}};

values	: values tags
       	| tags;

%%

int main() {
	yyparse();
	return 0;
}

