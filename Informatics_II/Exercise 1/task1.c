
#include <stdio.h> // for printf & scanf
#include <string.h> // for strlen

int isSubstring(char str1[], char str2[]) {

    int l1 = strlen(str1);
    int l2 = strlen(str2);
    int sub=0;

    // larger string
    for(int i=0;i<l2;i++) {
        if ( (i+l1-1) < l2) {
            // loop over search string
            for(int j=0;j<l1;j++) {
                if( str2[i+j] == str1[j]) {
                    sub=1;
                } else {
                    sub=0;
                    break;
                }
            }
            // we found the substring and don't care about the rest of str2
            if(sub ==1) {
                break;
            }
        }

    }
    return sub;
}

int main() {

    char str1[] = "thesis";
    char str2[] = "hypothesis";

    int result = isSubstring(str1, str2);

    if (result == 1) {
        printf("Is Substring: %s\n", "True");
        } else {
        printf("Is Substring: %s\n", "False");
    }

    /* or read custom strings */
    char str3[100];
    printf("Enter the first string:");
    scanf("%s", str3);

    char str4[100];
    printf("Enter the second string:");
    scanf("%s", str4);

    result = isSubstring(str4, str3);

    if (result == 1) {
        printf("Is Substring: %s\n", "True");
    } else {
        printf("Is Substring: %s\n", "False");
    }
    
    return 0;
}















