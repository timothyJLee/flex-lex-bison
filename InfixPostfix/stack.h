



#ifndef STACK
#define STACK
#define SIZE 100


/*The stack pointer points to the position that the next element will be pushed*/
extern int index;


/*
* Pushes an integer to the stack.
* In case of stack overflow it returns -1 otherwise 0.
*/
int push (char element);
/*
* Pops an integer from the stack.
* In case of stack underflow it returns -1 otherwise 0.
*/
int pop (char *element);

/*The stack itself*/
char stack[SIZE];

void create();

#endif /*STACK*/
