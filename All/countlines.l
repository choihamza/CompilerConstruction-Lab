%{
#include <stdio.h>
lines=0;
%}

%%
\n {lines++;}
. {}
%%

int yywrap(){
return 1;
}

int main(){
yylex();
printf("No. of lines %d",lines);
return 0;
}
