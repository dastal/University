#include <stdio.h>

void printDifference(int A[],int B[], int nA, int nB){
	
	int count1 = 0;
	int count2 = 0;
	int newA[100];
	int differenceArray[100];
	
	
	//remove multiple occurring integers from A
	for(int i=0;i<nA;i++){
		int same = 0;
		for(int j=i+1;j<nA;j++){
			if(A[i]==A[j]){
				same += 1;
			}
		}
		if(same==0){
			newA[count2] = A[i];
			count2 += 1;
		}
	}
	
	//if A and B are empty
	if((nA == 0)&&(nB == 0)){
		printf("A and B are empty! \n");
	}
	//if A is empty
	else if(nA == 0){
		printf("A is empty! \n");
	}
	//if B is empty
	else if(nB == 0){
		for(int i=0;i<nA;i++){
		printf("%d ", A[i]);
		}
		printf("\n");		
	}
	else{
		for(int i=0;i<count2;i++){
			int res = 0;
			for(int j=0;j<nB;j++){
				if(newA[i]==B[j]){
					res = 1;
				}		
			}
			if(res==0){
				differenceArray[count1]=newA[i];
				count1 += 1;
			}
		}
		//if A=B
		if(count1 == 0){
			printf("NIL \n");
		}
		else{
			for(int i=0;i<count1;i++){
				printf("%d ", differenceArray[i]);
			}
		printf("\n");
		}
	}	
}

int main(){
	
	int A[] = {};
	int B[] = {};
	int A1[] = {};
	int B1[] = {1,2,3};
	int A2[] = {1,2,3};
	int B2[] = {};
	int A3[] = {2,3,4,5};
	int B3[] = {1};
	int A4[] = {1};
	int B4[] = {2,3,4,5};
	int A5[] = {1,2,3};
	int B5[] = {1,2,3};
	int A6[] = {1,1,1,2,3};
	int B6[] = {3,4};
	int A7[] = {1,2,3};
	int B7[] = {3,3,3,4};
	int A8[] = {-1,2,3};
	int B8[] = {3,4};
	int A9[] = {-1,2,3};
	int B9[] = {-1,3,4};
	
	int nA = sizeof(A)/sizeof(int);
	int nB = sizeof(B)/sizeof(int);
	int nA1 = sizeof(A1)/sizeof(int);
	int nB1 = sizeof(B1)/sizeof(int);
	int nA2 = sizeof(A2)/sizeof(int);
	int nB2 = sizeof(B2)/sizeof(int);
	int nA3 = sizeof(A3)/sizeof(int);
	int nB3 = sizeof(B3)/sizeof(int);
	int nA4 = sizeof(A4)/sizeof(int);
	int nB4 = sizeof(B4)/sizeof(int);
	int nA5 = sizeof(A5)/sizeof(int);
	int nB5 = sizeof(B5)/sizeof(int);
	int nA6 = sizeof(A6)/sizeof(int);
	int nB6 = sizeof(B6)/sizeof(int);
	int nA7 = sizeof(A7)/sizeof(int);
	int nB7 = sizeof(B7)/sizeof(int);
	int nA8 = sizeof(A8)/sizeof(int);
	int nB8 = sizeof(B8)/sizeof(int);
	int nA9 = sizeof(A9)/sizeof(int);
	int nB9 = sizeof(B9)/sizeof(int);
	
	printDifference(A,B,nA,nB);
	printDifference(A1,B1,nA1,nB1);
	printDifference(A2,B2,nA2,nB2);
	printDifference(A3,B3,nA3,nB3);
	printDifference(A4,B4,nA4,nB4);
	printDifference(A5,B5,nA5,nB5);
	printDifference(A6,B6,nA6,nB6);
	printDifference(A7,B7,nA7,nB7);
	printDifference(A8,B8,nA8,nB8);
	printDifference(A9,B9,nA9,nB9);
	
	return 0;
}
