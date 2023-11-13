%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern int yylex();
extern int yylineno;
void yyerror (char const *);
}%

%union{
    char* string;
}

%token <string> prolog
%token <string> openingtag
%token <string> closingtag
%token <string> comment

%type body content

%start S

%%

S : prolog body {printf("correct XML syntax")}
  | error body {yyerror("no valid header found")}

%%

int main() {

}
void yyerror (char const *message) {fprintf (stderr, "%s\n", message)}
