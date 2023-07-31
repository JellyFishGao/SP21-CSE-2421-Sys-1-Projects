/* Zheyuan Gao */

/* Header file for program BST, BBST, and cmdBST */

#define SIZE 300
struct Node *add(struct Node *root, char value);
struct Node *findMin(struct Node *root);
struct Node *newNode(char c);
void print(struct Node *root);
struct Node *rem(struct Node *root, char data);


