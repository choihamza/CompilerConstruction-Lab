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
    char input[1000];
    printf("\nEnter string: ");
    scanf(" %[^\n]", input);

    printf("\nEnter word to find: ");
    scanf("%s", word);
    
    yy_scan_string(input);
    yylex();

    printf("Total Frequency of given word: %d\n", count);
    return 0;
}
