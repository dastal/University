
#include <stdio.h>



int power(int base, int exponent)
{
    if(exponent == 0) {
        return 1;
    }
    return base * power(base,exponent-1);
}

// alternative implementation which is faster
int power_fast(int base, int exponent) {
    if (exponent == 0) {
        return 1;
    }

    if (exponent % 2) {
        return base*power_fast(base, exponent-1);
    } else {
        int temp = power_fast(base, exponent/2);
        return temp*temp;
    }
}

 int main(){
     int b;
     int e;

     printf("Enter the base: ");
     scanf("%d", &b);
     printf("Enter the exponent: ");
     scanf("%d", &e);

     printf("Result: %d\n", power(b, e));
     printf("Result faster: %d\n", power_fast(b, e));

     return 0;
 }