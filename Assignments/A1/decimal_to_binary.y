%{
#include <stdio.h>
#include <stdlib.h>

// function to convert decimal to binary
void dec_to_bin(int n) {
    int binary[32]; // array to store binary number
    int i = 0; // counter for binary array

    while (n > 0) { // convert decimal to binary
        binary[i] = n % 2;  // store remainder in binary array
        n = n / 2; // divide number by 2
        i++; // increment counter
    }

    printf("Binary Equivalent: "); // print binary equivalent
    for (int j = i - 1; j >= 0; j--) { // print binary number
        printf("%d", binary[j]); // print binary digit
    } 
    printf("\n");
}

int yylex(void);
void yyerror(const char *s);
%}

%token NUM
%token END

// rules
%%
input: NUM { printf("Binary Equivalent: "); dec_to_bin($1); }  // convert decimal to binary
     | input NUM { dec_to_bin($2); } // convert decimal to binary
     | input END { printf("\n"); } // print newline
     ;

%%

void yyerror(const char *s) { // error handling function
    fprintf(stderr, "%s\n", s);
}

int main() {
    printf("Enter Decimal Number(s): ");
    yyparse();
    return 0;
}
