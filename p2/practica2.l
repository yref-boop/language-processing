%{
#include <stdlib.h>
#include "practica2.tab.h"
%}

%option yylineno 
prolog "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
comment	"<!--"[^-]*"-->"
tag [A-Z|0-9|a-z]+
blank [" \t\n"]+
content ([A-Z|ÁÉÍÓÚ|0-9|a-z|áéíóú]+|[-\/\!\?¿¡\(\)''#\"\$\%\*\-\.,:=])*

%%

{prolog} { return prolog; }
"<"{tag}">" { yylval.string = strdup(yytext); return opentag;}
"</"{tag}">" { yylval.string = strdup(yytext); return closetag;}
{comment} {}
{blank} {}
. {}

%%
