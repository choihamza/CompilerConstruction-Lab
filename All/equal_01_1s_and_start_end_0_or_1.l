%{
#include "sequence.tab.h"
%}

%%

[0-9] { yylval = yytext[0]; return CHAR; }

\n { return NEWLINE; } /* Ignore newline characters */

%%

int yywrap() {
    return 1;
}
