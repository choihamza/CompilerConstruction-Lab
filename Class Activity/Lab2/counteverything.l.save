%{
#include <stdio.h>
int count_capital=0;
int count_small=0;
int anything_else=0;
%}

%%
[A-Z] {count_capital++;}
[a-z] {count_small++;}
[^A-Za-z\n] {anything_else++;}
%%

int yywrap(){
}

int main() {
    char input[1000];
    printf("\nEnter something: ");
    scanf("%s",input);
    yy_scan_string(input);
    yylex();

    printf("\nCapital Letters: %d", count_capital);
    printf("\nSmall Letters: %d", count_small);
    printf("\nAny other Character: %d\n", anything_else);
    return 0;
}

