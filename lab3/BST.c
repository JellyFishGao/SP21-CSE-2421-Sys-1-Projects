/* Zheyuan Gao */

/* This program ask user for input and construct a BST contains characters as 
    nodes. It can add, delete, and print nodes in BST based on user choice. It 
    quits when user ask for quitting. */

#include <stdio.h>
#include <stdlib.h>
#include "header.h"

/*Creating Node stuct. It contains a char as value and pointer to left node and 
    right node as BST structure.*/
typedef struct Node{
    char value; 
    struct Node *lt; 
    struct Node *rt;

}Node;

/* Function to create new Node with input character as value */
struct Node *newNode(char c){
    Node *nodePtr;
    nodePtr = malloc(sizeof(Node));
    if(nodePtr == NULL){
        /* Not allocate memory correctly, print error message, quit function. */
        printf("Problem allocating memory to new node.\n");
        exit(0);
        
    }else{
        /* Assign value to members in Node */
        nodePtr->value = c;
        nodePtr->lt = NULL;
        nodePtr->rt = NULL;
    }
    return nodePtr;
}

/* Function to add new node into BST. Takes pointer to root node as first 
    parameter and the value to add as second parameter. Reture the pointer to 
    the root of the tree. */
Node *add(Node *root, char value){
    
    if(root == NULL){
        /* Tree is empty. Construct Node with value as root of tree */
        root = newNode(value);
    }else{
        /* Tree is not empty. */
        if((root->value) > value){
            /* Value is less then the root, add it in left tree */
            root->lt = add(root->lt, value);
        }else{
            /* Value is greater or equal to root, add it in right tree */
            root->rt = add(root->rt, value);
        }
    }
    return root;
}

/* Function to find the smallest character value in BST */
Node *findMin(Node *root){
    if(root != NULL && (root->lt) != NULL){
        /* Tree is not empty and there is still smaller character than root */
            return findMin(root->lt);
    }else{
        /* tree is empty or root is the smallest character in BST */
        return root;
    }
}

/* Function to remove an existing node in BST. Takes pointer to root node as first 
    parameter and the value to remove as second parameter. Return the pointer to
    the root of the updated BST */
Node *rem(Node *root, char data){
    Node *temp; /* Temp node pointer to store desired node */
    if(root != NULL){
        /* Tree is not empty */
        if((root->value) != data){
            /* The root is not target, search the subtree of root */
            if((root->value) > data){
                /* data is less than root, then search, remove node, and update 
                the left tree */
                root->lt = rem(root->lt, data);
            }else{
                /* data is greater than root, then search, remove node, and 
                update the right tree */
                root->rt = rem(root->rt, data);
            }
        }else{
            /* Root is target to be removed */
            if(root->rt != NULL){
                /* Right tree is not empty, make the smallest node of the Right
                tree to be new root */
                temp = findMin(root->rt);
                root->value = temp->value;
                /* Remove the smallest value in right tree */ 
                root->rt = rem(root->rt, temp->value);
            }else{
                /* Right tree is empty, make the left tree the new BST */
                temp = root->lt;
                free(root);
                return temp;
            }
        }
    }else{
        /* Tree is empty, return NULL */
        return NULL;
    }
    return root;
}

/* Function to print the tree structure. It prints the prefix representation of 
    the given BST. For example, BST with 'b'as root and 'a' as lt and 'c' as rt 
    will be print as "b(a(()())c(()())". */
void print(Node *root){
    if(root != NULL){
        /* Tree is not empty */
        printf("%c(", root->value);
        /* Print left tree */
        print(root->lt);
        /* Print right tree */
        print(root->rt);
        printf(")");
    }else{
        /* Tree is empty */
        printf("()");
    }
    
}

int main() {
    char instruc;/* char to determine user instruction */
    char data;/* char to store the target node value */
    /* Construct a BST */
    Node *root = NULL;
    /* Ask user for instruction. */
    printf("Please enter 'a' to add a node, 'r' to remove a node, 'p' to print ");
    printf("the BST, 'q' to quit: \n");
    scanf(" %c", &instruc);
    while(instruc != 'q'){
        if(instruc == 'a'){
            /* Add user input data in BST */
            printf("Please enter the character to be add: \n");
            scanf(" %c", &data);
            root = add(root, data);
        }
        if(instruc == 'r'){
            /* Remove user input value from BST */
            printf("Please enter the character to be removed: \n");
            scanf(" %c", &data);
            root = rem(root, data);
            
        }
        if(instruc == 'p'){
            /* Print the BST */
            print(root);
        }
        /* Ask user for instruction. */
        printf("\n");
        printf("Please enter a to add a node, r to remove a node, p to print the BST, q to quit: \n");
        scanf(" %c", &instruc);
    }
    printf("Program quit. Thank you.\n");
    
    return 0;
}

