%{
#include <stdio.h>
%}

%option noyywrap


DIGIT [0-9]
FLOAT (0|[1-9][0-9]*)\.[0-9]+
INT {DIGIT}+
HEADER_INIT #include
HEADER_FILE <[a-zA-Z0-9_]+\.h>
SWITCH_CASE "switch"|"case"|"default"

%%
{HEADER_INIT} { printf("Header Init: %s\n",yytext);}
{HEADER_FILE} { printf("Header File: %s\n", yytext); }
{SWITCH_CASE} { printf("Switch/Case: %s\n",yytext);}
{INT} { printf("Integer: %s\n", yytext); }
{FLOAT} { printf("Float: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9]* { printf("Identifier: %s\n", yytext); }
[(){}] {printf("Delimeter: %s\n",yytext);}
[;] {printf("Semicolon/Line End: %s\n",yytext);}
[:] {printf("Colon: %s\n",yytext);}
[,] {printf("Comma: %s\n",yytext);}
"[" {printf("Square Bracket: %s\n",yytext);}
"]" {printf("Square Bracket: %s\n",yytext);}
[+\-*/] { printf("Arith Operator: %s\n", yytext); }
[=+><] { printf("Operator: %s\n",yytext);}
[\".*\"] {printf("Literal: %s\n",yytext);}
[\t\n] {}
" " {}
. { printf("Unknown Token: %s\n",yytext);}
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
