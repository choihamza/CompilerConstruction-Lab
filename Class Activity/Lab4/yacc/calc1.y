%{
#include <stdlib.h>
#include <stdio.h>
int yylex(void);
void yyerror(char *errormsg);
%}

%token NUMBER ALPHA
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
grammer: expr '\n' {
    printf("\n Arithmetic Expression is valid\n");
    printf("\n Expression Result : %d\n", $1); // Changed $$ to $1 to reflect the result
    exit(0);
}

expr: expr '+' expr { $$ = $1 + $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | '(' expr ')'  { $$ = $2; }
    | NUMBER        { $$ = $1; }
    | ALPHA         { /* Handle alpha tokens appropriately */ }
    ;

%%

int main(void)
{
    printf("Enter the Arithmetic Expression\n");
    yyparse();
    return 0;
}

void yyerror(char *errormsg)
{
    printf("Arithmetic expression is Invalid\n");
    exit(1);
}
