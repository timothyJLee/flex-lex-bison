

struct yylval {
   int integer;
   double real;
   char* string;
}yylval;


/* Tokens.  */
#define INT_TOKEN 258
#define REAL_TOKEN 259
#define STRING_TOKEN 260
#define PLUS_TOKEN 261
#define MINUS_TOKEN 262
#define MULT_TOKEN 263
#define DIV_TOKEN 264
#define MOD_TOKEN 265
#define POWER_TOKEN 266
#define LESS_THAN_TOKEN 267
#define GREATER_THAN_TOKEN 268
#define LESS_THAN_EQUAL_TOKEN 269 
#define GREATER_THAN_EQUAL_TOKEN 270
#define EQUAL_TOKEN 271
#define ASSIGN_TOKEN 272
#define BOOL_NOT_TOKEN 273
#define KEY_PAREN_LEFT_TOKEN 274
#define KEY_PAREN_RIGHT_TOKEN 275
#define KEY_BRACKET_LEFT_TOKEN 276
#define KEY_BRACKET_RIGHT_TOKEN 277
#define ENDOFLINE_TOKEN 278
#define UNREC 279




