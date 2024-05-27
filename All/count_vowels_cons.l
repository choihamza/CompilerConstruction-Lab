%{
#include <stdio.h>
int count_vowels = 0;
int count_cons = 0;
%}

%%
[AaEeIiOoUu] {count_vowels++;}
[^AaEeIiOoUu\n] {count_cons++;}
\n {
printf("\nTotal Vowels = %d\n",count_vowels);
printf("\nTotal Consonants = %d\n",count_cons);
count_vowels=0;
count_cons=0;
}
%%

int yywrap(){
return 1;
}

int main(){
yylex();
return 0;
}
