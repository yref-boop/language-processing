%{
unsigned charcount = 0, wordcount = 0, lowercount = 0, capitalcount = 0;
%}
word [^ \t\n]+
%%
[A-Z]+ {wordcount++; charcount += yyleng; capitalcount++;}
[a-z]+ {wordcount++; charcount += yyleng; lowercount++;}
{word} {wordcount++; charcount += yyleng;}
.  {charcount++;}
%%
main()
{
    yylex();
    printf ("word count = %d\n", wordcount);
    printf ("capital word count = %d\n", capitalcount);
    printf ("lowercase word count = %d\n", lowercount);
    printf ("char count = %d\n", charcount);
}
