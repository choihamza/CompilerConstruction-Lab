%{
#include <stdlib.h>
#include <stdio.h>
int yylex(void);
void yyerror(char *errormsg);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
grammer: expr '\n' {
    printf("\n Result : %d\n", $1);
    exit(0);
}

expr: expr '+' expr { $$ = $1 + $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | '(' expr ')'  { $$ = $2; }
    | NUMBER        { $$ = $1; }
    ;

%%

int main(void)
{
    printf("\nEnter the Arithmetic Expression: ");
    yyparse();
    return 0;
}

void yyerror(char *errormsg)
{
    printf("Arithmetic expression is Invalid\n");
    exit(1);
}
