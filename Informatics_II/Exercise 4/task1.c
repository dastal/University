#include <stdio.h>
#include <stdlib.h>

struct Node {
	int key;
	struct Node* next;
};


int isEmpty(struct Node** stackTop){
	
	if(stackTop == NULL){
		return 1;
	}
	else{
		return 0;
	}
}


void push(struct Node** stackTop, int key){
	
	struct Node *temp;
	temp = (struct Node *)malloc(sizeof(struct Node));
	int res = isEmpty(stackTop);
	
	if(res == 1){
		printf("stack overflow\n");
		return;
	}
	
	temp->key = key;
	temp->next = *stackTop;
	*stackTop = temp;
}

int pop(struct Node **stackTop){
	
	struct Node *temp;
	int num;
	int res = isEmpty(stackTop);
	
	if(res == 1){
		return -1;
	}
	else{
		temp = *stackTop;
		num = temp->key;
    	temp = temp->next;
    	*stackTop = temp;
		return num;
	}
}

void printStack(struct Node* stackTop){
	
	struct Node *p = stackTop;
	int res = isEmpty(&stackTop);
	
	if(res == 1){
		printf("stack underflow\n");
		return;
	}
	
	printf("\nStack: \n");
	
	while(p!=NULL){
		printf("%d\n", p->key);
		p = p->next;
	}
	printf("\n");
}


int main(){
	
	struct Node *stackTop = NULL;
	
	push(&stackTop, 3);
	push(&stackTop, 4);
	push(&stackTop, 6);
	push(&stackTop, 9);
	push(&stackTop, 10);
	
	printStack(stackTop);
	
	int first_remove = pop(&stackTop);
	printf("Deleted: %d\n",first_remove);
	int second_remove = pop(&stackTop);
	printf("Deleted: %d\n", second_remove);
	
	push(&stackTop, 4);
	push(&stackTop, 17);
	push(&stackTop, 30);
	
	printStack(stackTop);
}
