%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int count = 0;
char word[1000] = "";
%}

%%
[a-zA-Z]+ {if(strcmp(yytext, word) == 0) count++;}
. {}
%%

int yywrap(){}

int main() {
    FILE* fp;
    char filename[30];
    printf("Enter word to find: ");
    scanf("%s", word);
    printf("\nEnter File name: ");
    scanf("%s",filename);
    fp = fopen(filename,"r");
    yyin = fp;
    yylex();

    printf("Total Frequency of given word: %d\n", count);
    return 0;
}
