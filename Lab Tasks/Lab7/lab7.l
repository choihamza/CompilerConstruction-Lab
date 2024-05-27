%{
#include <stdio.h>
#include "lab7.tab.h"
%}

%%
"if" { return IF; }
"while" { return WHILE; }
"for" { return FOR; }
"(" { return PARANTHESIS; }
")" { return PARANTHESIS; }
"{" { return CURLYBRACE; }
"}" { return CURLYBRACE; }
"int" || "float" || "double" || "char" { return DATATYPE; }
[><=] { return RELOP; }
[+-] { return ARITH; }
[A-Za-z0-9]+ { return OPERAND; }
";" { return SEMICOLON; }

[ \t\n]+  ; // Ignore whitespace
. { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}
