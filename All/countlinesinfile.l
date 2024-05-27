%{
#include <stdio.h>
int count = 0;
%}


%%
\n {count++;}
. {}
%%

int yywrap(){
return 1;
}

int main(){
FILE* fp;
char filename[30];
printf("\nEnter File name: ");
scanf("%s",filename);
fp = fopen(filename,"r");
yyin = fp;
yylex();
printf("\nNo of Lines in file: %d\n",count);
return 0;
}
