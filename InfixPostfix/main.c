

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>


extern int yyparse();
extern FILE *yyin;
extern FILE *yyout;


int main (int argc, char **argv) 
{
	yyin = stdin;
	yyout = stdout;

	yyparse(); /* call the parser*/
	return 0;
}







