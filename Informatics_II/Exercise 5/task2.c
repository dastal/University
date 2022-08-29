#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define A (sqrt(7)-1)/2

struct element{
	int val;
	struct element *next;
};


void init(struct element* H[]) {
    int i;
    for (i = 0; i < 8; i++) { H[i] = NULL; }
}


int h(int val){
	
	return 8*(A*val - (int)(A*val));
}


struct element* search(struct element* H[], int val){
	
	int hashed_key = h(val);
	struct element* e = H[hashed_key];
	
	while(e != NULL){
		if(e->val == val){
			return hashed_key;
		}
		else{
			e = e->next;
		}
	}
	return NULL;
}


void insert(struct element** H[], int val){
	
	int i = h(val);
	struct element* e = malloc(sizeof(struct element));
	e->val = val;
	e->next = H[i];
	H[i] = e;
}


void printHash(struct element*H[]){
	
	struct element* e;
	
	for(int i=0; i<8; i++){
		if(H[i] != NULL){
			printf("i: %d\t key: ", i);
			e = H[i];
			while(e != NULL){
				printf("%d \t", e->val);
				e = e->next;
			}
			printf("\n");
		}
	}		
}


void main(){
	
	struct element*H[8];
	
	init(H);
	
	insert(&H, 111);
	insert(&H, 10112);
	insert(&H, 1113);
	insert(&H, 5568);
	insert(&H, 63);
	insert(&H, 1342);
	insert(&H, 21231);
	
	printHash(H);
	
	printf("\n");
	
	int s[5] = {1, 10112, 1113, 5568, 337};
	
	for (int i = 0; i < 5; i++) {
        if(search(H, s[i]) == NULL){
        	printf("%d not found.\n", s[i]);
		}
		else{
			printf("%d found at position %d in Hash Table.\n", s[i], search(H,s[i]));
		}
	}
}
