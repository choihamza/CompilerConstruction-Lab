#include <stdio.h>
#include <ctype.h>
void FIRST(char[], char);
void addToResultSet(char[], char);
int numOfProductions;
char productionSet[10][10];
void main()
{
    int i, j;
    char choice;
    char c, g;
    char result[20];
    printf("How many number of productions ? :");
    scanf(" %d", &numOfProductions);
    for (i = 0; i < numOfProductions; i++) 
    {
        printf("Enter production Number %d : ", i + 1);
        scanf(" %s", productionSet[i]); 
    }
    printf("FIRST OF : \n");
    for (i = 0; i < numOfProductions; i++)
    {
        c = productionSet[i][0];
        FIRST(result, c); 
        if (productionSet[i][2] != '$')
        {
            printf("(%c) ={", c);
            for (j = 0; result[j] != '\0'; j++)
            {
                printf("%c ", result[j]);
            } // Display result
            printf("}\n");
        }
    }
}
void FIRST(char *Result, char c)
{
    int i, j, k;
    char subResult[20];
    int foundEpsilon;
    subResult[0] = '\0';
    Result[0] = '\0';
    // If X is terminal, FIRST(X) = {X}.
    if (!(isupper(c)))
    {
        addToResultSet(Result, c);
        return;
    }
    for (i = 0; i < numOfProductions; i++)
    {
        if (productionSet[i][0] == c)
        {
            if (productionSet[i][2] == '$')
                addToResultSet(Result, '$');
            else
            {
                j = 2;
                while (productionSet[i][j] != '\0')
                {
                    foundEpsilon = 0;
                    FIRST(subResult, productionSet[i][j]);
                    for (k = 0; subResult[k] != '\0'; k++)
                        addToResultSet(Result, subResult[k]);
                    for (k = 0; subResult[k] != '\0'; k++)
                        if (subResult[k] == '$')
                        {
                            foundEpsilon = 1;
                            break;
                        }
                    if (!foundEpsilon)
                        break;
                    j++;
                }
            }
        }
    }
    return;
}
void addToResultSet(char Result[], char val)
{
    int k;
    for (k = 0; Result[k] != '\0'; k++)
        if (Result[k] == val)
            return;
    Result[k] = val;
    Result[k + 1] = '\0';
}
