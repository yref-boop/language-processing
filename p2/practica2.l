%{
#include <stdlib.h>
#include "practica2.tab.h"
}%
%option yylineno 
prolog "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
comment "<--"UTF-8"-->"
openingtag "<"[A-Za-z0-9]">"
closingtag "</"[A-Za-z0-9]">"
blank ["^ \t\n"]+
%%
prolog { return prolog; }
openingtag { yylval.string = strdup(yytext); return opening;}
closingtag { yylval.string = strdup(yytext); return closing;}
{comment} {}
%%
