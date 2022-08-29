#include <stdio.h>
#include <stdlib.h>

int A[] = {8, 4, 2, 0, 9, 6, 3, 7};
int sizeA = sizeof(A)/sizeof(A[0]);

void swap(int A[], int i, int j){
	
	int temp;
	
	temp = A[i];
	A[i] = A[j];
	A[j] = temp;
	
}

int partitionHoare(int A[], int low, int high){
	
	int pivot = A[high];
	int i = low - 1;
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

void quicksort(int A[], int low, int high, int choice){
	
	if(low<high){
		int m;
		if(choice == 1){
			int first_element = A[low];
			int last_element = A[high-1];
			int middle_element = A[(high-1+low)/2];
		
			if(first_element<=middle_element && middle_element<=last_element){
				m = partitionHoare(A,low,low);
			}
			else if(middle_element<first_element && first_element<=last_element){
				m = partitionHoare(A,low,(high-1+low)/2);
			}
			else{
				m = partitionHoare(A,low,high-1);
			}
		}
		quicksort(A,A[low],m-1,1);
		quicksort(A,m+1,A[high],1);
	}
}

void printArray(int A[], int size){
	
	for(int i=0;i<size;i++){
		printf("%d ", A[i]);
	}
}

void main(){
	
	quicksort(A,1,6,1);
	printArray(A,sizeA);
}
