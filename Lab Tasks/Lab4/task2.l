%{
#include "calc1.tab.h"
extern int yylval;
#include <stdlib.h>
%}

%%

[0-9]+       { yylval = atoi(yytext); return NUMBER; } // Convert matched string to integer
[\t]+        {}
[\n]         { return '\n'; }
.            { return yytext[0];}

%%

int yywrap(void)
{
   return 0;
}
