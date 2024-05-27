%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
int yywrap(void);
%}

%token ZERO ONE

%%
N: L {printf("\nDecimal Number is: %d\n", $1);}
L: L B {$$ = $1 * 2 + $2;}
 | B {$$ = $1;}

B: ZERO { $$ = 0; }
 | ONE { $$ = 1; }

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    printf("Enter Binary Number: ");
    yyparse();
    return 0;
}


