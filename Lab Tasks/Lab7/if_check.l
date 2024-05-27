%{
#include <stdio.h>
#include "if_check.tab.h"
%}

%%
"if" { return IF; }
"(" { return PARANTHESIS; }
")" { return PARANTHESIS; }
[><=] { return RELOP; }
[A-Za-z0-9]+ { return OPERAND; }
[ \t\n]+  ;
. { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}
