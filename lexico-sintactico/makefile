.SUFFIXES:
especificacion: main.o y.tab.o
	gcc -o especificacion main.o y.tab.o

y.tab.o: y.tab.c
	gcc -c y.tab.c

main.o: main.c
	gcc -c main.c

y.tab.c: especificacion.yacc lex.yy.c
	yacc -v -d -o y.tab.c especificacion.yacc

lex.yy.c: lexico.l
	lex lexico.l

limpia:
	rm -f especificacion main.o y.tab.o y.tab.c lex.yy.c

todo:
	make limpia
	make especificacion
