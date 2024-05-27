%{
int count = 0;
%}

%%
[a-zA-Z]{6,9} {count++;}
\n {printf("\nwords with less than 10 and greater than 5 words are= %d\n",count);
count=0;}
%%
.
int yywrap(){
return 1;
}

int main(){
yylex();
return 0;
}
