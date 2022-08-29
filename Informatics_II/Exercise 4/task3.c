#include <stdio.h>
#include <stdlib.h>

struct TreeNode{
	int val;
	struct node* left;
	struct node* right;
};


struct TreeNode* getNewNode(int val)
{
	struct TreeNode* newNode = malloc(sizeof(struct TreeNode));
	newNode->val = val;
	newNode->left = NULL;
	newNode->right = NULL;
	return newNode;
};


struct TreeNode* minimum(struct TreeNode* root){
	
	while(root->left != NULL){
		root = root->left;
	}
	return root;
}


void insert(struct TreeNode** root,int val){
	
	if(*root==NULL){
		*root = getNewNode(val);
	}
	
	else if(val <= (*root)->val){
		
		insert(&(*root)->left, val);
	}
	
	else if(val > (*root)->val){
		insert(&(*root)->right, val);
	}
}


struct TreeNode* search(struct TreeNode* root, int val){
	
	struct TreeNode* temp = root;
	int x = temp->val;
	
	if(root==NULL){
		return;
	}
	
	else{
		while(x != val){
			if(val <= x){
				temp = temp->left;
			}else if (val > x){
				temp = temp->right;
			}
		}
		return temp;
	}
}


void deleteNode(struct TreeNode** root,int val){
	
	if(*root==NULL){
		exit;
	}
	
	else if(val<(*root)->val){
		deleteNode(&(*root)->left,val);
	}
	
	else if(val>(*root)->val){
		deleteNode(&(*root)->right,val);
	}
	
	else{
		if((*root)->left==NULL && (*root)->right==NULL){
			free(*root);
			*root = NULL;
		}
		
		else if((*root)->left == NULL){
			struct TreeNode* temp = *root;
			*root = (*root)->right;
			free(temp);
		}
		
		else if((*root)->right == NULL){
			struct TreeNode* temp = *root;
			*root = (*root)->left;
			free(temp);
		}
		
		else{
			struct TreeNode* temp = minimum((*root)->right);
			(*root)->val = temp->val;
			deleteNode(&(*root)->right,temp->val);
		}
	}
}


void print(struct TreeNode* root){
	
	if (root != NULL){
		print(root->left);
		printf("%d\n", root->val);
		print(root->right);
	}
}


void main(){

	struct TreeNode* root = NULL;
	
	//insert(&root, 5);
	//insert(&root, 2);
	//insert(&root, 7);
	//insert(&root, 6);
	//insert(&root, 8);
	
	//printf("Tree:\n");
	//print(root);
	
	insert(&root, 4);
	insert(&root, 2);
	insert(&root, 3);
	insert(&root, 8);
	insert(&root, 6);
	insert(&root, 7);
	insert(&root, 9);
	insert(&root, 12);
	insert(&root, 1);
	
	printf("Tree:\n");
	print(root);
	printf("\n");
	
	deleteNode(&root, 4);
	deleteNode(&root, 7);
	deleteNode(&root, 2);
	
	printf("Tree:\n");
	print(root);
	printf("\n");
}
