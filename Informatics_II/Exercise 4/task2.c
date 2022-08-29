#include <stdio.h>
#include <stdlib.h>

struct Queue{
	
	struct Node* stack1;
	struct Node* stack2;
};


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


void enQueue(struct Queue *q, int key){

	push(&q->stack1, key);	
}

int deQueue(struct Queue *q){
	
		int val1;
		int val2;
		
		if(q->stack1 == NULL && q->stack2 == NULL){
			
			return -1;
		}
		
		if(q->stack2 == NULL){
			
			while(q->stack1 != NULL){
				
				val1 = pop(&q->stack1);
				push(&q->stack2, val1);
			}
		}
		
		val1 = pop(&q->stack2);
		
		while(q->stack2 != NULL){
			
			val2 = pop(&q->stack2);
			push(&q->stack1, val2);
		}
		
		return val1;
}


void printQueue(struct Queue *q){
	
	int val;
	
	if(q->stack1 == NULL){
			
		printf("Q is empty.");
		return;
	}
	
	printf("\nStack:\n");
	
	while(q->stack1 != NULL){
		val = pop(&q->stack1);
		push(&q->stack2, val);
		printf("%d\n",val);
	}
	
	while(q->stack2 != NULL){
		val = pop(&q->stack2);
		push(&q->stack1, val);
	}	
}


void main(){
	
	struct Queue *q = (struct Queue*)malloc(sizeof(struct Queue));
    q->stack1 = NULL;
    q->stack2 = NULL;
    
    enQueue(q,2);
    enQueue(q,8);
    enQueue(q,11);
    enQueue(q,15);
    
    int first_remove;
    int second_remove;
    first_remove = deQueue(q);
    second_remove = deQueue(q);
    printf("Deleted: %d\n", first_remove);
    printf("Deleted: %d\n", second_remove);
    
    enQueue(q,1);
    enQueue(q,5);
    
    printQueue(q);
}
