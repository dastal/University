#include<stdio.h>
#include<stdlib.h>
#include<time.h>

struct TreapNode {
    int key;
	int priority;
    struct TreapNode *left;
	struct TreapNode *right;
};

struct TreapNode *root;


struct TreapNode* newNode(int key) {
    struct TreapNode* temp = malloc(sizeof(struct TreapNode));
    
	temp->key = key;
    temp->priority = rand()%100;
    temp->left = temp->right = NULL;
    
	return temp;
}


struct TreapNode *rightRotate(struct TreapNode* y){
	
	struct TreapNode* x = y->left;
	struct TreapNode* T2 = y->right;
	x->right = y;
	y->left = T2;
	return x;
}


struct TreapNode* leftRotate(struct TreapNode* x){
	
	struct TreapNode* y = x->right;
	struct TreapNode* T2 = y->left;
	y->left = x;
	x->right = T2;
	return y;
}


struct TreapNode* search(struct TreapNode* root, int val) {
    
    struct TreapNode* temp = root;
    
    if(temp == NULL){
    	return NULL;
	}
	if(temp->key == val){
		return temp->key;
	}
	if(temp->key < val){
		return search(temp->right, val);
	}
	return search(temp->left, val);
}


struct TreapNode* insert(struct TreapNode* root, int val) {
   
   if(!root){
   		return newNode(val);
   }
   
   if(val <= root->key){
		root->left = insert(root->left, val);
		if(root->left->priority > root->priority){
			root = rightRotate(root);
		}
   }
   else{
   		root->right = insert(root->right, val);
   		if(root->right->priority > root->priority){
   			root = leftRotate(root);
		}
   }
   return root;
}


struct TreapNode* deleteNode(struct TreapNode* root, int val) {
   
   if(root == NULL){
   		return root;
   }
   if(val < root->key){
   		root->left = deleteNode(root->left,val);
   }
   else if(val > root->key){
   		root->right = deleteNode(root->right, val);
   }
   
   //if key is a root
   
   // if left is NULL
   else if(root->left == NULL){
   		struct TreapNode* temp = root->right;
   		free(root);
   		root = temp;
   }
   
   //if right is NULL
   else if(root->right == NULL){
   		struct TreapNode *temp = root->left;
   		free(root);
   		root = temp;
   }
   
   //if key is a root and both left an right are not NULL
   else if(root->left->priority < root->right->priority){
   		root = leftRotate(root);
   		root->left = deleteNode(root->left, val);
   }
   
   else{
   		root = rightRotate(root);
   		root->right = deleteNode(root->right, val);
   }
   return root;
}


void inorder(struct TreapNode* root) {
    if (root) {
        inorder(root->left);
        printf("key: %d | priority: %d ", root->key, root->priority);
        if (root->left)
        printf(" | left child: %d", root->left->key);
        if (root->right)
        	printf(" | right child: %d", root->right->key);
        printf("\n");
        inorder(root->right);
    }
}


void main() {
    srand(time(NULL));
    
	root = NULL;
    
	root = insert(root, 50);
    root = insert(root, 30);
    root = insert(root, 20);
    root = insert(root, 40);
    root = insert(root, 70);
    root = insert(root, 60);
    root = insert(root, 80);
 
    printf("Inorder traversal of the given tree \n");
    inorder(root);
 
    printf("\nDelete 20\n");
    root = deleteNode(root, 20);
    printf("Inorder traversal of the modified tree \n");
    inorder(root);
 
    printf("\nDelete 30\n");
    root = deleteNode(root, 30);
    printf("Inorder traversal of the modified tree \n");
    inorder(root);
 
    printf("\nDelete 50\n");
    root = deleteNode(root, 50);
    printf("Inorder traversal of the modified tree \n");
    inorder(root);
 
    struct TreapNode *res = search(root, 50);
    
    if(res == NULL){
    	printf("\n50 Not Found");
	} else {
		printf("\n50 Found");
	}
}
