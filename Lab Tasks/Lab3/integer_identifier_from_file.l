%{
#include <stdio.h>
%}

%option noyywrap


DIGIT [0-9]
LETTER [a-zA-Z]
WHITESPACE [ \t\n]+
%%
{DIGIT}+ {printf("<Integer: %s>\n", yytext);}
{LETTER}+ {printf("<Identifier: %s>\n", yytext);}
{WHITESPACE} {}
. {printf("<Unknown Token: %s>\n",yytext);}
%%

int main() {
    FILE* fp;
    char filename[30];
    printf("\nEnter File name: ");
    scanf("%s",filename);
    fp = fopen(filename,"r");
    yyin = fp;
    yylex();
}
