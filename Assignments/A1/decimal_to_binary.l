%{
#include <stdio.h>
#include "decimal_to_binary.tab.h"
%}

%%
[0-9]+ { yylval = atoi(yytext); return NUM; } // Recognize decimal numbers and return NUM token
\n    { return END; } // Recognize end of input and return END token
.     { ; } // Ignore any other characters
%%

/**
 * This function is called when the end of input is reached.
 * It returns 1 to indicate that there is no more input to process.
 */
int yywrap() {
    return 1;
}
