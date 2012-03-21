/* Hello World program */

#include<stdio.h>

# define N 2



int main(void)
{
    
    int a[N][N] = {  1,  4,  7,  9,};
    //                               3, -2, -5,  0,
    //                               2,  1, 11, 17,
    //                              45,  3,-15, 16 };
    
    int b[N][N] = {   4, -7,  0,  1};
    //                       16, 32,  5, 18,
    //                       20,-15,  6,  1,
    //                       14,  3,  0, 18 };
    
    int c[N][N] =   {0};
    
    int i = 0;
    int j = 0;
    int k = 0;
    int x,y;
    
    while(i < N) {
        j=0;
        while(j < N) {
            k=0;
            while (k<N) {
                printf(" i = %d   j = %d   k = %d\n", i, j, k);
                
                c[i][j] += a[i][k] - b[k][j];
                //taking care of abs
                if (c[i][j] < 0) {
                    c[i][j] = -c[i][j];
                }
                
                //taking care of OVF
                if(c[i][j] >= 127) {
                    c[i][j] = 127;
                }
                //debug
                for (x=0; x< N; x++) {
                    for(y=0; y<N; y++) {
                        printf("  %d", c[x][y]);
                    }
                    printf("\n");
                }
                printf("\n");
                //enddebug
                
                k++;
            }
            j++;
        }
        i++;
    }
    
    printf("I'm done calulating: here is my result of C\n");
    
    
    
    for (i=0; i< N; i++) {
        for(j=0; j<N; j++) {
            printf("  %d", c[i][j]);
        }
        printf("\n");
    }
    
    
    
    return 0;
}