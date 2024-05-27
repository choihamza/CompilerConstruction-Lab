%{
#include <stdio.h>
int largest = 0;
char largestword[1000] = "";
%}


%%
[A-Za-z0-9]+ {
	int length = yyleng;
	if (length > largest){
			largest = length;
			strcpy(largestword,yytext);
			}
		}
\n {
	printf("\nLargest Word is: %s\nLength of largest word is: %d\n",largestword,largest);
}

.  {}
%%


int yywrap(){
}

int main(){
	printf("\nEnter a string: ");
	yylex();
	return 0;
}
