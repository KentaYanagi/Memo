//AJG22055 柳健大
#include <stdio.h>

int main(void)
{
    int A[3][3] = {
        {3, 0, 1},
        {1, 2, 0},
        {1, 1, -1}};

    int B[3][3] = {
        {1, 2, 3},
        {6, 4, 5},
        {8, 9, 7}};

    int C[3][3];
    int D[3][3];

    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            C[i][j] = A[i][j] + B[i][j];

    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            for (int k = 0; k < 3; k++)
                D[i][j] += A[i][k] * B[k][j];
    printf("A + B =\n");

    for (int i = 0; i < 3; i++)
    {

        for (int j = 0; j < 3; j++)
            printf("%d ", C[i][j]);
        printf("\n");
    }

    printf("A x B =\n");
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
            printf("%d ", D[i][j]);
        printf("\n");
    }
    return 0;
}