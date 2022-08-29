#include <stdio.h>

struct list {
	struct node* head;
};


struct node {
	int val;
	struct node* next;
};

struct list* init();


void append(struct list **listA, int val){
	
	struct node *newnode = (struct node*)malloc(sizeof(struct node));
	newnode->val = val;
	newnode->next = NULL;
	struct node *temp = *listA;
	
	if(*listA == NULL){
		*listA = newnode;
	}
	else{
		while(temp->next != NULL)
		temp = temp -> next;
		temp->next = newnode;
	}
}


void print(struct list *listA){
	
	struct node *current = listA;
	
	while(current != NULL){
		printf("%d ", current -> val);
		current = current->next;
	}
	printf("\n");
}


void reverse(struct list** listA){
	
	struct node* prev = NULL;
	struct node* current = *listA;
	struct node* next = NULL;
	
	while(current != NULL){
		next = current->next;
		current->next = prev;
		prev = current;
		current = next;
	}
	*listA = prev;
}


void deleteElement(struct list **listA, int i){
	
	//if linked list is empty
	if(*listA == NULL){
		return;
	}
	
	//store head node
	struct node* temp = *listA;
	
	//if head needs to be removed
	if(i==0){
		*listA = temp->next;
		free(temp);
		return;
	}
	
	//find previous node of the node to be deleted
	for(int count=0;temp!=NULL && count<i-1;count++){
		temp = temp->next;
	}
	
	//if i is more than number of nodes
	if(temp == NULL || temp->next == NULL){
		return;
	}
	
	//node temp->next is the node to be deleted
	//store pointer to the next of node to be deleted
	struct node *next = temp->next->next;
	
	//Unlink the node from linked list
	free(temp->next);
	temp->next = next;
}


void deleteLast(struct list **listA){
	
	struct node* prev;
	struct node* current;
	current = *listA;
	
	while(current->next != NULL){
		prev = current;
		current = current->next;
	}
	prev->next = NULL;
	free(current);
}


void max(struct list **listA){
	
	int max = NULL;
	struct node* current;
	current = *listA;
	
	while(current->next != NULL){
		if(max<current->next->val){
			max = current->next->val;
		}
		current = current->next;
	}
	printf("%d\n", max);
}


void clear(struct list **listA){
	
	struct node* temp1 = *listA;
	struct node* temp2;
	
	while(temp1 != NULL){
		temp2 = temp1->next;
		free(temp1);
		temp1 = temp2;
	}
	*listA = NULL;
}


int main(){
	
	struct list *listA = NULL;
	
	append(&listA, 9);
	append(&listA, 4);
	append(&listA, 5);
	append(&listA, 3);
	append(&listA, 1);
	append(&listA, 2);
	append(&listA, 0);
	
	print(listA);
	
	reverse(&listA);
	
	print(listA);
	
	deleteElement(&listA, 6);
	deleteElement(&listA, 3);
	deleteElement(&listA, 0);
	
	print(listA);
	
	deleteLast(&listA);
	
	print(listA);
	
	max(&listA);
	
	clear(&listA);
	
	print(listA);
	
}
