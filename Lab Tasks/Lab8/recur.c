#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int evaluate_expression(const char *expression);
int evaluate_term(const char **expr);
int evaluate_factor(const char **expr);


int main() {
    char expression[100];
    printf("Enter an arithmetic expression: ");
    fgets(expression, sizeof(expression), stdin);
    int result = evaluate_expression(expression);
    printf("Result: %d\n", result);
    return 0;
}


int evaluate_expression(const char *expression) {
    int result = evaluate_term(&expression);
    while (*expression == '+' || *expression == '-') {
        char op = *expression++;
        int right = evaluate_term(&expression);
        if (op == '+') {
            result += right;
        } else {
            result -= right;
        }
    }
    return result;
}


int evaluate_term(const char **expr) {
    int result = evaluate_factor(expr);
    while (**expr == '*' || **expr == '/') {
        char op = *(*expr)++;
        int right = evaluate_factor(expr);
        if (op == '*') {
            result *= right;
        } else {
            result /= right;
        }
    }
    return result;
}


int evaluate_factor(const char **expr) {
    if (**expr == '(') {
        (*expr)++;
        int result = evaluate_expression(*expr);
        while (**expr != ')') {
            (*expr)++;
        }
        (*expr)++;
        return result;
    } else {
        int result = 0;
        while (isdigit(**expr)) {
            result = result * 10 + (**expr - '0');
            (*expr)++;
        }
        return result;
    }
}
