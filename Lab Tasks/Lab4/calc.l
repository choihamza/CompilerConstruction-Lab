%{
#include "calc1.tab.h"
extern int yylval; // Make sure yylval is declared as an integer
#include <stdlib.h> // Include stdlib.h for the atoi function
%}

%%

[0-9]+       { yylval = atoi(yytext); return NUMBER; } // Convert matched string to integer
[a-zA-Z]+    { /* Do something appropriate here */ return ALPHA; } // You might want to change this to return LETTER or something appropriate
[\t]+        ;  // Ignore tabs
[\n]         { return '\n'; } // Return newline character
.            { return yytext[0]; } // Return any other character

%%

int yywrap(void)
{
   return 0;
}
