#include <stdio.h>
#include <stdlib.h>

int A[] = {3, 8, 9, 1, 7};
int sizeA = sizeof(A)/sizeof(A[0]);

void Heapify(int A[], int i, int s){
	
	int m = i;
	int l = 2*i;
	int r = 2*i+1;
	int temp;
	
	if((l <= s) && (A[l] > A[m])){
		m = l;
	}
	if((r <= s) && (A[r] > A[m])){
		m = r;
  	}
  	if(i != m){
  		temp = A[i];
  		A[i] = A[m];
  		A[m] = temp;
   	} 
}

void buildMaxHeap(int A[], int n){
	
	for(int i=(n-1)/2;i>=0;i--){
		Heapify(A,i,n);
	}
}

void printHeap(int A[],int n){
	
	int left;
	int right;
	
	for(int i=0;i<n;i++){
		if(i==0){
				printf("%d -- %d \n", A[0], A[1]);
				printf("%d -- %d \n", A[0], A[2]);
		}
		else{
			left = 2*i+1;
			right = 2*i+2;
			if((left<n) && (right<n)){
				printf("%d -- %d \n", A[i], A[left]);
				printf("%d -- %d \n", A[i], A[right]);
			}
			
		}
	}
}

void heapSort(int A[], int n){
	
	int s = n;
	int temp;
	int constant = 1;
	
	buildMaxHeap(A,n);
	
	for(int i=n-1;i>=1;i--){
		s = s-1;
		Heapify(A,constant,s);
		}

		
	printHeap(A,n);
}

void printArray(int A[], int n){
	
	for(int i=0;i<n;i++){
		printf("%d ", A[i]);
	}
}

void main(){
	
	printArray(A,sizeA);
	printf("\n");
	heapSort(A,sizeA);
}
