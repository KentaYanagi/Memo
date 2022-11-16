// AJG22055 柳健大
#include <stdio.h>

int main(void)
{

    printf("Please enter a string! (less than 10000 characters and don't type space):");
    char s[10000];
    int n = 0;
    scanf("%s", s);
    for (int i = 0; i < 10000; i++)
    {
        if (s[i] == 'a')
        {
            n++;
        }
        if (s[i] == '\0')
        {
            break;
        }
    }
    printf("The number of 'a' is %d", n);
    return 0;
}