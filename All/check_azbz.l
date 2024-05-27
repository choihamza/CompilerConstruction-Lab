%{
#include "calc1.tab.h"
extern int yylval; // Make sure yylval is declared as an integer
#include <stdlib.h> // Include stdlib.h for the atoi function
qty = 0;
%}

%%

[0-9]+       { yylval = atoi(yytext); return NUMBER; } // Convert matched string to integer
[a-zA-Z]+    {
                if (strstr(yytext, "azbz") != NULL) {
			qty = qty+1;
                    return ALPHA;
                } else {
                    /* Ignore other letters */
                }
            }
[\t]+        ;  // Ignore tabs
[\n]         { return '\n'; } // Return newline character
.            { return yytext[0]; } // Return any other character

%%

int yywrap(void)
{
   return 0;
}
