

infix : y.tab.c lex.yy.c main.c
	gcc -Wpedantic -ansi -g *.c -o infix

y.tab.c : bison.txt
	yacc -v -d -t bison.txt

lex.yy.c : lex.txt
	lex lex.txt

