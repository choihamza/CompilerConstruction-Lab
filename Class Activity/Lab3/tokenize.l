%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
%}

%%
[\t\n] {  }
[0-9]+ { printf("Number: %s\n", yytext); }
[A-Za-z+!=]+ {
        if (strcmp(yytext,"if")==0) {
            printf("Keyword: IF\n");
        } else if (strcmp(yytext,"else")==0) {
            printf("Keyword: ELSE\n");
        } else if (strcmp(yytext,"while")==0) {
            printf("Keyword: WHILE\n");
        } else if (strcmp(yytext,"for")==0) {
            printf("Keyword: FOR\n");
        } else if (strcmp(yytext,"int")==0) {
            printf("Keyword: INT\n");
        } else if (strcmp(yytext,"do")==0) {
            printf("Keyword: DO\n");
        } else if (strcmp(yytext,"switch")==0) {
            printf("Keyword: SWITCH\n");
        } else if (strcmp(yytext,"return")==0) {
            printf("Keyword: RETURN\n");
        } else if (strcmp(yytext,"float")==0) {
            printf("Keyword: FLOAT\n");
        } else if (strcmp(yytext,"double")==0) {
            printf("Keyword: DOUBLE\n");
        } else if (strcmp(yytext,"char")==0) {
            printf("Keyword: CHAR\n");
        } else if (strcmp(yytext,"void")==0) {
            printf("Keyword: VOID\n");
        } else if (strcmp(yytext,"==")==0) {
            printf("OPERATOR EQUALS: ==\n");
        } else if (strcmp(yytext,"!=")==0) {
            printf("OPERATOR: NOT EQUAL !=\n");
        } else if (strcmp(yytext,"+=")==0) {
            printf("OPERATOR ADD EQUAL: +=\n");
        } else if (strcmp(yytext,"=")==0) {
            printf("OPERATOR ASSIGN: =\n");
        } else {
            printf("Keyword: %s\n", yytext);
        }
}
\".*\" { printf("String: %s\n", yytext); }
[(){};] {printf("Delimeter: %s\n",yytext);}
[+\-*/] { printf("Operator: %s\n", yytext); }
. {}
%%

int yywrap() {return 1;}

int main() {
    FILE* fp;
    char filename[30];
    printf("\nEnter File name: ");
    scanf("%s", filename);
    fp = fopen(filename, "r");
    yyin = fp;
    yylex();
    return 0;
}
