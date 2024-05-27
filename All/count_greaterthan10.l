%{
int count = 0;
%}

%%
[a-zA-Z]{11,} {count++;}
\n {printf("\nwords = %d\n",count);count=0;}
%%

int yywrap(){
return 1;
}

int main(){
yylex();
return 0;
}
