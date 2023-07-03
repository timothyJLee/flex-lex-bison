

infix : y.tab.c lex.yy.c main.c
	gcc -Wpedantic -ansi *.c -o infix

y.tab.c : bison.txt
	yacc -d bison.txt

lex.yy.c : lex.txt
	lex lex.txt

