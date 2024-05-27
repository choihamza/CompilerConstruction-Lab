%{
#include <stdio.h>
extern int yylex();
extern int yylval;
float result;
void yyerror(const char *s);
%}

%token NUMBER

%%

input: expression {printf("Result: %d\n",$1);}

expression: term
          | expression '+' term { $$ = $1 + $3; }
          | expression '-' term { $$ = $1 - $3; }
          ;

term: factor
    | term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }
    ;

factor: NUMBER         { $$ = $1; }
      | '(' expression ')' { $$ = $2; }
      ;

%%

int main() {
    printf("\nEnter Expression: ");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
