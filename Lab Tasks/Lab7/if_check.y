%{
#include <stdio.h>
%}

%token IF PARANTHESIS OPERAND RELOP

%%

start: IF PARANTHESIS OPERAND RELOP OPERAND PARANTHESIS {printf("IF FOUND\n");};
             | IF PARANTHESIS OPERAND RELOP OPERAND PARANTHESIS start {printf("NESTED IF FOUND\n");}
             ;
%%

int yyerror(){
int valid = 0;
printf("Invalid");
return 1;
}

int main(){
yyparse();
return 0;
}
