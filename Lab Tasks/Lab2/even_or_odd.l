%{
#include <stdlib.h>
#include <stdio.h>
int num1 = 0;
%}

%%
[0-9]+ {
    int num = atoi(yytext);
    if (num % 2 == 0) {
        printf("The Number %d is Even\n", num);
    } else {
        printf("The Number %d is Odd\n", num);
    }
}
. {printf("\n NOT A NUMBER\n");}
%%

int yywrap(){
return 1;
}

int main() {
    printf("Input a Number: ");
    num1 = yylex();

    return 0;
}
