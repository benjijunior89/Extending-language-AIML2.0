/*********************************************************
**
** Fichero: MAIN.C
** Función: Pruebas de FLEX para practicas Proc.Leng
**
*********************************************************/
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin ;

int yyparse(void) ;


/************************************************************/
int main( int argc, char *argv[]){
	yyin= fopen(argv[1],"r");
	printf("%s\n", "Analizando archivo...");
	return yyparse();
}
