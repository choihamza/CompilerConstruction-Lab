%{
#include <stdio.h>
%}


%%
"hello world" printf("goodbye\n");
\n {return 0;}
%%

int yywrap(){
return 1;
}

int main(){
yylex();
return 0;
}
