%{
#include <stdio.h>
int count = 0;
%}

%%
[A-Za-z]" " {count++;}
[A-Za-z]\n {count++;
printf("\ncount = %d\n",count);
count=0;}

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
