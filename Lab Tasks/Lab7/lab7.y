%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%token IF WHILE FOR PARANTHESIS CURLYBRACE OPERAND RELOP ARITH DATATYPE SEMICOLON

%%

start: IF PARANTHESIS OPERAND RELOP OPERAND PARANTHESIS { printf("Valid IF statement\n"); }
        | WHILE PARANTHESIS OPERAND RELOP OPERAND PARANTHESIS { printf("Valid WHILE statement\n"); }
        | FOR PARANTHESIS DATATYPE OPERAND RELOP OPERAND SEMICOLON OPERAND RELOP OPERAND SEMICOLON OPERAND ARITH OPERAND PARANTHESIS { printf("Valid FOR statement\n"); }
       ;

// statement: if_statement  { printf("IF FOUND\n"); }
//          | while_statement { printf("WHILE FOUND\n"); }
//          | for_statement { printf("FOR FOUND\n"); }
//          ;

// if_statement: IF PARANTHESIS OPERAND RELOP OPERAND PARANTHESIS
//              | IF PARANTHESIS OPERAND RELOP OPERAND PARANTHESIS statement
//              ;

// while_statement: WHILE PARANTHESIS OPERAND RELOP OPERAND PARANTHESIS statement
//                 ;

// for_statement: FOR "int" PARANTHESIS OPERAND RELOP OPERAND ';' OPERAND RELOP OPERAND ';' OPERAND ARITH PARANTHESIS statement
//               ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    return 0;
}

