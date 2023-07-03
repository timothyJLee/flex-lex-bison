

#include "stack.h"


/*The stack pointer points to the position that the next element will be pushed*/
int index = 0;


/*
* Pushes an integer to the stack.
* In case of stack overflow it returns -1 otherwise 0.
*/
int push (char element) 
{
	if (index == 0) create(); 
	stack[index++] = element; /*else push the element*/
	return 0;
}

/*
* Pops an integer from the stack.
* If the stack is empty it returns -1 otherwise the popped element.
*/
int pop (char *element) 
{
	if (index == 0) return -1; /* in case of empty stack*/
	*element = stack[--index]; /* else pop the element*/
	return 0;
}

void create()
{
	int i =0;
	while(i < SIZE)
	{
		stack[i] = '\0';
	}
}
