#include <stdio.h>
#include <stdlib.h>

int A[] = {4, 3, 2, 5, 6, 7, 8, 9, 12, 1};
int sizeA = sizeof(A)/sizeof(A[0]);

void swap(int A[], int i, int j){
	
	int temp;
	
	temp = A[i];
	A[i] = A[j];
	A[j] = temp;
	
}

int partitionHoare(int A[], int low, int high){
	
	int pivot = A[high];
	int i = low-1;
	int j = high + 1;
	
	while (1) {
        do  j--; while (A[j] > pivot);
        do  i++; while (A[i] < pivot);

        if  (i < j)
            swap(A,i,j);
        else
            return j;
    }
}

void quicksort(int A[], int low, int high){
	
	if(low<high){
		int m = partitionHoare(A,low,high);
		quicksort(A,low,m-1);
		quicksort(A,m+1,high);
	}
}

void printArray(int A[], int size){
	
	for(int i=0;i<size;i++){
		printf("%d ", A[i]);
	}
}

void main(){
	
	int constant = 0;
	
	quicksort(A,constant,sizeA-1);
	printArray(A,sizeA);
}
