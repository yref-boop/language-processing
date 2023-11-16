%{
unsigned charcount = 0, wordcount = 0, lowercount = 0, capitalcount = 0, numbercount=0, sentencecount = 0;
%}
word [^ \t\n"."]+
%%
[A-Z]+ {wordcount++; charcount += yyleng; capitalcount++;}
[A-Z]+"." {sentencecount++; wordcount++; charcount += yyleng; capitalcount++;}

[0-9]+ {wordcount++; charcount += yyleng; numbercount++;}
[0-9]+"." {sentencecount++; wordcount++; charcount += yyleng; numbercount++;}

[a-z]+ {wordcount++; charcount += yyleng; lowercount++;}
[a-z]+"." {sentencecount++; wordcount++; charcount += yyleng; lowercount++;}

{word} {wordcount++; charcount += yyleng;}
{word}"." {sentencecount++; wordcount++; charcount += yyleng;}

"." {charcount ++;}
\n {charcount++;}

%%
int main()
{
    yylex();
    printf ("char count = %d\n", charcount);
    printf ("word count = %d\n", wordcount);
    printf ("exclusively capital word count = %d\n", capitalcount);
    printf ("exclusively lowercase word count = %d\n", lowercount);
    printf ("exclusively numeric word count = %d\n", numbercount);
    printf ("number of sentences = %d\n", sentencecount);

    return 0;
}
