#include <stdio.h>

int WhatDoesItDo(int A[], int ALength){

	int a = 0;
	
	for(int i=0;i<=ALength-2;i++){
		for(int j=i+1;j<=ALength-1;j++){
			int x = 0;
			for(int k=i;k<=j;k++){
				if(A[k]%2 == 0){
					x = x + 1;
				}
				else{
					x = x - 1;
				}
			}
			if((x == 0)&&(j-i>a)){
				a = j - i;
			}
		}
	}
	return a;
}

void main(){
	
	int A[] = {7, 12, 23, 1};
	int ALength = sizeof(A)/sizeof(int);
	
	printf("%d", WhatDoesItDo(A,ALength));
	
}
