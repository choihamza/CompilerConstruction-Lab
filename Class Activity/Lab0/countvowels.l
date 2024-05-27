%{
#include <stdio.h>
int count = 0;
%}

%%
[AaEeIiOoUu]"" {count++;}

\n {printf("\ncount = %d\n",count);
count=0;}
%%

int yywrap(){
return 1;
}

int main(){
yylex();
return 0;
}
