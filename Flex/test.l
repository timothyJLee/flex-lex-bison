
/*
   Timothy Lee
   10/02/14
   Flex Scanner
    - Create lexical scanner using flex that can recognize tokens including integers and floats
    - create test program to take place of yacc/bison
       - While loop to call yylex() and switch to determine which defined token recognized
          - returns different token based off of a variety of regex matched characters
       - Defined tokens and structure defining yylval in seperate header file
          - Attempts to use yylval to make future bison work more simple
       - And print: Token INTEGER, Value 123 (where 1 is TokenValue and 23 is yytextValue)
    - generate "lex.yy.c" file by using proper make commands from test.l

  Sources:
    - http://flex.sourceforge.net/manual/
    - http://luv.asn.au/overheads/lex_yacc/lex.html#lexc
    - http://www-h.eng.cam.ac.uk/help/tpl/languages/flexbison/
    - http://marvin.cs.uidaho.edu/Teaching/CS210/flex.html
    - http://www.csee.umbc.edu/courses/331/fall11/hw/hw4/calc/Makefile
    - http://regexlib.com/Search.aspx?k=integer&AspxAutoDetectCookieSupport=1
*/


%{
#include <math.h>
#include "y.tab.h"
%}

/* DEFINITIONS */
INTEGER    -?[0-9]
STRING   [a-zA-Z0-9]*

%%


{INTEGER}+    { yylval.integer = atoi(yytext); return INT_TOKEN; }     
{INTEGER}+"."{INTEGER}*        {sscanf(yytext,"%lf", &yylval.real); return REAL_TOKEN;}
"+" {sscanf(yytext,"%s", yylval.string); return PLUS_TOKEN;}
"-" {sscanf(yytext,"%s", yylval.string); return MINUS_TOKEN; }
"*" {sscanf(yytext,"%s", yylval.string); return MULT_TOKEN; }
"/" {sscanf(yytext,"%s", yylval.string); return DIV_TOKEN; }
"%" {sscanf(yytext,"%s", yylval.string); return MOD_TOKEN; }
"^" {sscanf(yytext,"%s", yylval.string); return POWER_TOKEN; }
"<" {sscanf(yytext,"%s", yylval.string); return LESS_THAN_TOKEN; }
">" {sscanf(yytext,"%s", yylval.string); return GREATER_THAN_TOKEN; }
"<=" {sscanf(yytext,"%s", yylval.string); return LESS_THAN_EQUAL_TOKEN; }
">=" {sscanf(yytext,"%s", yylval.string); return GREATER_THAN_EQUAL_TOKEN; }
"==" {sscanf(yytext,"%s", yylval.string); return EQUAL_TOKEN; }
"=" {sscanf(yytext,"%s", yylval.string); return ASSIGN_TOKEN; }
"!" {sscanf(yytext,"%s", yylval.string); return BOOL_NOT_TOKEN; }
"(" {sscanf(yytext,"%s", yylval.string); return KEY_PAREN_LEFT_TOKEN; }
")" {sscanf(yytext,"%s", yylval.string); return KEY_PAREN_RIGHT_TOKEN; }
"{" {sscanf(yytext,"%s", yylval.string); return KEY_BRACKET_LEFT_TOKEN; }
"}" {sscanf(yytext,"%s", yylval.string); return KEY_BRACKET_RIGHT_TOKEN; }
"\n" {sscanf(yytext,"%s", yylval.string); return ENDOFLINE_TOKEN;  }     
         .           {sscanf(yytext,"%s", yylval.string); return UNREC; }

%%


/* USER CODE */
int main( int argc, char **argv ) {     
        int token;
	token = 0;
	while (token = yylex()) { /* Call yylex() which returns a constant defined in the header file */
		switch (token) {
			case INT_TOKEN : printf("Token: INT_TOKEN Value: %d%s\n", INT_TOKEN, yytext); break;
			case REAL_TOKEN : printf("Token: REAL_TOKEN Value: %d%s\n", REAL_TOKEN, yytext); break;
			case STRING_TOKEN : printf("Token: STRING_TOKEN Value: %d%s\n", STRING_TOKEN, yytext); break;
			case PLUS_TOKEN : printf("Token: PLUS_TOKEN Value: %d%s\n", PLUS_TOKEN, yytext); break;
			case MINUS_TOKEN : printf("Token: MINUS_TOKEN Value: %d%s\n", MINUS_TOKEN, yytext); break;
			case MULT_TOKEN : printf("Token: MULT_TOKEN Value: %d%s\n", MULT_TOKEN, yytext); break;
			case DIV_TOKEN : printf("Token: DIV_TOKEN Value: %d%s\n", DIV_TOKEN, yytext); break;
			case MOD_TOKEN : printf("Token: MOD_TOKEN Value: %d%s\n", MOD_TOKEN, yytext); break;
			case POWER_TOKEN : printf("Token: POWER_TOKEN Value: %d%s\n", POWER_TOKEN, yytext); break;
			case LESS_THAN_TOKEN : printf("Token: LESS_THAN_TOKEN Value: %d%s\n", LESS_THAN_TOKEN, yytext); break;
			case GREATER_THAN_TOKEN : printf("Token: GREATER_THAN_TOKEN Value: %d%s\n", GREATER_THAN_TOKEN, yytext); break;
			case LESS_THAN_EQUAL_TOKEN : printf("Token: LESS_THAN_EQUAL_TOKEN Value: %d%s\n", LESS_THAN_TOKEN, yytext); break;
			case GREATER_THAN_EQUAL_TOKEN: printf("Token: GREATER_THAN_EQUAL_TOKEN Value: %d%s\n", GREATER_THAN_TOKEN, yytext); break;
			case EQUAL_TOKEN: printf("Token: EQUAL_TOKEN Value: %d%s\n", EQUAL_TOKEN, yytext); break;
			case ASSIGN_TOKEN: printf("Token: ASSIGN_TOKEN Value: %d%s\n", ASSIGN_TOKEN, yytext); break;
			case BOOL_NOT_TOKEN: printf("Token: BOOL_NOT_TOKEN Value: %d%s\n", BOOL_NOT_TOKEN, yytext); break;
			case KEY_PAREN_LEFT_TOKEN: printf("Token: KEY_PAREN_LEFT_TOKEN Value: %d%s\n", KEY_PAREN_LEFT_TOKEN, yytext); break;
			case KEY_PAREN_RIGHT_TOKEN: printf("Token: KEY_PAREN_RIGHT_TOKEN Value: %d%s\n", KEY_PAREN_RIGHT_TOKEN, yytext); break;
			case KEY_BRACKET_LEFT_TOKEN: printf("Token: KEY_BRACKET_LEFT_TOKEN Value: %d%s\n", KEY_BRACKET_LEFT_TOKEN, yytext); break;
			case KEY_BRACKET_RIGHT_TOKEN: printf("Token: KEY_BRACKET_RIGHT_TOKEN Value: %d%s\n", KEY_BRACKET_RIGHT_TOKEN, yytext); break;
			case ENDOFLINE_TOKEN: printf("Token: ENDOFLINE_TOKEN Value: %d%s\n", ENDOFLINE_TOKEN, yytext); break;
			default: printf("Error: %d%s not recognized\n" , UNREC, yytext);
             	}
	}
}
