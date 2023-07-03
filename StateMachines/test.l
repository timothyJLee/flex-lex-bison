
/*
   Timothy Lee
   09/25/14
    STATEMACHINE
    - Create state machine to find tokens within inputs
    - Run test file and produce output
       - While loop to call yylex() and switch to determine which defined token recognized
          - returns different token based off of a variety of regex matched characters
       - Defined tokens and structure defining yylval in seperate header file
       - And print: Token, Value/State
    - generate "lex.yy.c" file by using proper make commands from test.l
*/


%{
#include <math.h>
#include "y.tab.h"

int yywrap(void);
%}

/* DEFINITIONS */
APPLE    "APPLE"
ANN      "ANN"
ANNEX    "ANNEX"
WSP [ \t]

%%



{APPLE} {yylval.string = yytext; return APPLE; } 
{ANNEX} {yylval.string = yytext; return ANNEX; }
{ANN} {yylval.string = yytext; return ANN; }
[\n] { return ENDOFLINE; } /*For the rest Bison need only the token.*/
{WSP}+ { ; } /*The whitespace is dropped*/
. { }

%%


/* USER CODE */
int main( int argc, char **argv ) {     
        int token;
	token = 0;
	while (token = yylex()) { /* Call yylex() which returns a constant defined in the header file */
		switch (token) {
			case APPLE : printf("Token: APPLE Value: %d : %s\n", APPLE, yytext); break;
			case ANNEX : printf("Token: ANNEX Value: %d : %s\n", ANNEX, yytext); break;
			case ANN : printf("Token: ANN Value: %d : %s\n", ANN, yytext); break;
			case ENDOFLINE: printf("Token: ENDOFLINE Value: %d : %s\n", ENDOFLINE, yytext); break;
			default: printf("Error: %d%s not recognized\n" , UNREC, yytext);
             	}
	}
}


