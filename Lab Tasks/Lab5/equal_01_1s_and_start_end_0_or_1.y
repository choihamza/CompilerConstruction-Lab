%{
#include <stdio.h>
#include <string.h>
int yylex();
char prev;
int zeroes;
int ones;
%}

%token CHAR NEWLINE

%%
input : CHAR { if($1 == '1'){ones++;} else if($1 == '0'){zeroes++;}else {yyerror("Invalid input");exit(1);} }
      | input CHAR { if($2 == '1'){ones++;} else if($2 == '0'){zeroes++;} prev = $2;}
      | input NEWLINE {printf("");
	if($1 - prev==0)printf("Valid: Same start and end\n");
	else if(ones == zeroes) printf("Valid: Equal 0s/1s\n");
	else {yyerror("Invalid input");exit(1);}
	};
%%

int main() {
    yyparse();
    return 0;
}

int yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 0;
}
