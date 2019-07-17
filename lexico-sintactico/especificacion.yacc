%{
	/*********************************************************
	** Autor: Benjamin Vega Herrera
	** Fichero: especificacion.Y
	** Funcion: Analisis sintatico de AIML 2.1
	**
	********************************************************/
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	//#include "tablaTokens.h"
	/** La siguiente declaracion permite que 'yyerror' se pueda invocar desde el
	*** fuente de lex (prueba.l)
	**/
	void yyerror(const char * msg ) ;
	int yylex();
	/** La siguiente variable se usara para conocer el numero de la linea
	*** que se esta leyendo en cada momento. Tambien es posible usar la variable
	*** 'yylineno' que tambien nos muestra la linea actual. Para ello es necesario
	*** invocar a flex con la opcion '-l' (compatibilidad con lex).
	**/
	int numLinea = 1 ;
%}

/** Para uso de mensajes de error sintactico con BISON.
*** La siguiente declaracion provoca que 'bison', ante un error sintactico,
*** visualice mensajes de error con indicacion de los tokens que se esperaban
*** en el lugar en el que produjo el error (SoLO FUNCIONA CON BISON>=2.1).
*** Para Bison<2.1 es mediante
***
***#define YYERROR_VERBOSE
***
*** En caso de usar mensajes de error mediante 'mes' y 'mes2' (ver apendice D)
*** nada de lo anterior debe tenerse en cuenta.
***

*** A continuacion declaramos los nombres simbolicos de los tokens.
*** byacc se encarga de asociar a cada uno un codigo
**/

%error-verbose

%token NUEVA


%token ADDTOMAP
%token ADDTOSET
%token READKEYS
%token READSET
%token READFILE
%token WRITEFILE
%token MODIFYMAP
%token KEY

%token ADDTOMAP_C
%token ADDTOSET_C
%token READKEYS_C
%token READSET_C
%token READFILE_C
%token WRITEFILE_C
%token MODIFYMAP_C
%token KEY_C

%token PREFIX
%token SUBFIX
%token OPTIONAL
%token CHOOSE

%token MAS
%token APERTURA

%token REMOVEFROMMAP
%token REMOVEFROMSET
%token REMOVEFROMMAP_C
%token REMOVEFROMSET_C




%token WORD

%token AIML

%token CATEGORY
%token PATTERN
%token TEMPLATE

%token TOPIC
%token TOPIC_CERRADO
%token PATTERNSIDE
%token THAT
%token THAT_CERRADO

%token RANDOM
%token CONDITION

%token LOOP

%token SRAI
%token SR
%token SRAIX

%token SET
%token SET_CERRADO
%token GET
%token GET_CERRADO
%token MAP
%token MAP_CERRADO
%token BOT
%token DATE
%token DATE_CERRADO
%token THINK
%token EXPLODE
%token NORMALIZE
%token DENORMALIZE
%token FORMAL
%token LOWERCASE
%token UPPERCASE
%token SENTENCE
%token PERSON
%token PERSON2
%token STAR
%token STAR_CERRADO
%token INDEX
%token THATSTAR
%token THATSTAR_CERRADO
%token TOPICSTAR
%token TOPICSTAR_CERRADO
%token INPUT
%token REQUEST
%token REQUEST_CERRADO
%token RESPONSE
%token RESPONSE_CERRADO

%token LEARN
%token LEARNF
%token EVAL
%token ID
%token VOCABULARY
%token PROGRAM
%token SYSTEM
%token SYSTEM_CERRADO
%token INTERVAL
%token SIZE

%token LI
 
%token COMILLAS

%token VERSION
%token VAR

%token NUM_VERSION

%token PRIORITY_WORD
%token WILDCARD
%token SET_STATEMENT
%token PATTERN_SIDE_BOT_PROPERTY_EXPRESSION


%token AIML_C

%token CATEGORY_C
%token PATTERN_C
%token TEMPLATE_C

%token TOPIC_C
%token PATTERNSIDE_C
%token THAT_C

%token RANDOM_C
%token CONDITION_C

%token LOOP_C

%token SRAI_C
%token SR_C
%token SRAIX_C

%token SET_C
%token GET_C
%token MAP_C
%token BOT_C
%token DATE_C
%token THINK_C
%token EXPLODE_C
%token NORMALIZE_C
%token DENORMALIZE_C
%token FORMAL_C
%token LOWERCASE_C
%token UPPERCASE_C
%token SENTENCE_C
%token PERSON_C
%token PERSON2_C
%token STAR_C
%token INDEX_C
%token THATSTAR_C
%token TOPICSTAR_C
%token INPUT_C
%token REQUEST_C
%token RESPONSE_C

%token LEARN_C
%token LEARNF_C
%token EVAL_C
%token ID_C
%token VOCABULARY_C
%token PROGRAM_C
%token SYSTEM_C
%token INTERVAL_C
%token SIZE_C

%token LI_C

%token CIERRE


%token SRAIX_ATTRIBUTES
%token NAME_ATTRIBUTE
%token VALUE_ATTRIBUTE
%token VAR_ATTRIBUTE
%token TIMEOUT_ATTRIBUTE

%token NAME
%token VALUE
%token NAME_C
%token VALUE_C



%token HOST
%token BOTID
%token HINT
%token APIKEY
%token SERVICE
%token HOST_C
%token BOTID_C
%token HINT_C
%token APIKEY_C
%token SERVICE_C

%token SRAIX_CERRADO

%token BARRA
%token PUNTO
%token COMA
%token PUNTOCOMA
%token IGUAL

%token VAR_C



%token FORMAT
%token JFORMAT
%token STYLE
%token FROM
%token TO

%token FORMAT_C
%token JFORMAT_C
%token STYLE_C
%token FROM_C
%token TO_C

%token DATE_ATTRIBUTES

%token GENDER
%token GENDER_C

%token TIMEOUT
%token TIMEOUT_C

%token INDEX_ATTRIBUTE
%token THAT_INDEX_ATTRIBUTE

%token XML
%token ENCODING
%token XML_C

%token DOSPUNTOS

%start cabecera

%%

cabecera	:	XML VERSION COMILLAS NUM_VERSION COMILLAS ENCODING XML_C aiml_file;

aiml_file	:	 AIML VERSION COMILLAS aiml_version COMILLAS CIERRE continuacion AIML_C | error;

aiml_version	:	NUM_VERSION | error;

continuacion	:	continuacion cont2 | ;
cont2	:	category_expression | topic_expression;

category_expression	:	CATEGORY expresion_pattern CATEGORY_C;


expresion_pattern	:	PATTERN pattern_expression PATTERN_C expresion_that;

expresion_that	:	THAT_CERRADO pattern_expression THAT_C expresion_topic | expresion_topic; 


expresion_topic	:	TOPIC_CERRADO pattern_expression TOPIC_C expresion_template | expresion_template;

expresion_template	:	TEMPLATE template_expression TEMPLATE_C;




pattern_expression :  pattern_expression pattern_forms | pattern_forms;

pattern_forms	:	WORD | PRIORITY_WORD | WILDCARD | SET_STATEMENT | PATTERN_SIDE_BOT_PROPERTY_EXPRESSION | PREFIX | SUBFIX | OPTIONAL | CHOOSE | error;


topic_expression	:	TOPIC NAME_ATTRIBUTE COMILLAS pattern_expression COMILLAS CIERRE category_exp TOPIC_C;
category_exp	:	category_exp category_expression | category_expression;



template_expression : template_expression opcion_template | opcion_template;

opcion_template : text | tag_expression;

text	:	WORD | BARRA | CIERRE | IGUAL | PUNTOCOMA | COMA | PUNTO | MAS | APERTURA | DOSPUNTOS;

tag_expression	:	random_expression |
			condition_expression |
			srai_expression |
			sraix_expression |
			get_predicate_expression |
			set_predicate_expression |
			date_expression |
			interval_expression |
			map_expression |
			bot_property_expression |
			think_expression |
			explode_expression |
			normalize_expression |
			denormalize_expression |
			person_expression |
			person2_expression |
			gender_expression |
			system_expression |
			star_expression |
			thatstar_expression |
			topicstar_expression |
			that_expression |
			request_expression |
			response_expression |
			learn_expression |
			addtomap_expression |
			addtoset_expression |
			readkeys_expression |
			readset_expression |
			modifymap_expression |
			removefrommap_expression |
			removefromset_expression |
			SR |
			ID |
			VOCABULARY |
			PROGRAM |
			NUEVA;


random_expression	:	RANDOM exp_li RANDOM_C;

exp_li	:	exp_li expression_li | expression_li;

expression_li	:	LI CIERRE template_expression LI_C| error;



condition_expression	:	CONDITION condition_attributes CIERRE cond_item_exp CONDITION_C;

condition_atributes_exp	:	condition_atributes_exp condition_attributes | ;

condition_attributes	:	condition_attr COMILLAS WORD COMILLAS;

condition_attr	:	NAME_ATTRIBUTE | VALUE_ATTRIBUTE;


cond_item_exp	:	cond_item_exp LI condition_atributes_exp CIERRE condition_item_exp LI_C | ;

condition_item_exp	:	condition_item_exp condition_item_component | ;

condition_item_component	:	NAME template_expression NAME_C | sig1 ;
sig1	:	VALUE template_expression VALUE_C | sig2;
sig2	:	LOOP | tag_expression | text;



srai_expression	:	SRAI template_expression SRAI_C;

sraix_expression	: SRAIX sraix_attributes CIERRE template_expression SRAIX_C |
			SRAIX_CERRADO sraix_exp template_expression SRAIX_C;

sraix_attributes	:	sraix_attributes SRAIX_ATTRIBUTES COMILLAS WORD COMILLAS | ;

sraix_exp	:	sraix_exp sraix_attributes_tags | ;

sraix_attributes_tags	:	HOST template_expression HOST_C |
				BOTID template_expression BOTID_C |
				HINT template_expression HINT_C |	
				APIKEY template_expression APIKEY_C |
				SERVICE template_expression SERVICE_C;

get_predicate_expression	:	GET get_attributes COMILLAS WORD COMILLAS BARRA CIERRE |
					GET_CERRADO NAME template_expression NAME_C GET_C |
					GET_CERRADO VAR template_expression VAR_C GET_C;

get_attributes	:	NAME_ATTRIBUTE | VAR_ATTRIBUTE;

set_predicate_expression	:	SET get_attributes COMILLAS WORD COMILLAS CIERRE template_expression SET_C |
					SET_CERRADO NAME template_expression NAME_C template_expression SET_C |
					SET_CERRADO VAR template_expression VAR_C template_expression SET_C;

map_expression	:	MAP NAME_ATTRIBUTE COMILLAS WORD COMILLAS CIERRE template_expression MAP_C|
			MAP_CERRADO NAME template_expression NAME_C template_expression MAP_C;

bot_property_expression	:	PATTERN_SIDE_BOT_PROPERTY_EXPRESSION |
				BOT NAME template_expression NAME_C BOT_C;


date_expression	:	DATE date_attributes BARRA CIERRE |
			DATE_CERRADO date_attribute_tag DATE_C;

date_attributes	:	date_attributes DATE_ATTRIBUTES | ;

date_attribute_tag	:	FORMAT template_expression FORMAT_C |
				JFORMAT template_expression JFORMAT_C | ;

interval_expression	:	INTERVAL date_attribute_tag STYLE cont_interval_exp;
cont_interval_exp	:	template_expression STYLE_C FROM cont_interval_exp2 | STYLE_C FROM cont_interval_exp2;
cont_interval_exp2	:	template_expression FROM_C TO cont_interval_exp3 | FROM_C TO cont_interval_exp3;
cont_interval_exp3	:	template_expression TO_C INTERVAL_C | TO_C INTERVAL_C;


think_expression	:	THINK template_expression THINK_C;

explode_expression	:	EXPLODE template_expression EXPLODE_C;

normalize_expression	:	NORMALIZE template_expression NORMALIZE_C;

denormalize_expression	:	DENORMALIZE template_expression DENORMALIZE_C;

person_expression	:	PERSON template_expression PERSON_C;

person2_expression	:	PERSON2 template_expression PERSON2_C;

gender_expression	:	GENDER template_expression GENDER_C;

system_expression	:	system_exp template_expression SYSTEM_C |
				SYSTEM_CERRADO TIMEOUT template_expression TIMEOUT_C SYSTEM_C;

system_exp	:	SYSTEM TIMEOUT_ATTRIBUTE CIERRE | SYSTEM_CERRADO;

star_expression 	:	STAR index_attribute BARRA CIERRE |
				STAR_CERRADO index_exp STAR_C;
index_attribute	:	INDEX_ATTRIBUTE | ;
index_exp	:	INDEX template_expression INDEX_C;

thatstar_expression	:	THATSTAR index_attribute BARRA CIERRE |
				THATSTAR_CERRADO index_exp THATSTAR_C;

topicstar_expression	:	TOPICSTAR index_attribute BARRA CIERRE | 					TOPICSTAR_CERRADO index_exp TOPICSTAR_C;

that_expression	:	THAT thatindex_exp BARRA CIERRE | 
			THAT_CERRADO index_exp THAT_C;

thatindex_exp	:	THAT_INDEX_ATTRIBUTE |;

request_expression	:	REQUEST index_attribute BARRA CIERRE |
				REQUEST_CERRADO index_exp REQUEST_C;

response_expression	:	RESPONSE index_attribute BARRA CIERRE | 				RESPONSE_CERRADO index_exp RESPONSE_C;




learn_expression	:	LEARN learn_category_expression LEARN_C |
				LEARNF learn_category_expression LEARNF_C;



learn_category_expression	:	CATEGORY PATTERN learn_pattern_expression PATTERN_C learn_that_exp TEMPLATE learn_template_expression TEMPLATE_C CATEGORY_C;

learn_pattern_expression	:	learn_pattern_expression learn_pattern_exp | learn_pattern_exp;


learn_that_exp	:	THAT_CERRADO learn_pattern_expression THAT_C learn_topic_exp | learn_topic_exp;

learn_topic_exp	:	TOPIC_CERRADO learn_pattern_expression TOPIC_C | ;

eval_expression	:	EVAL template_expression EVAL_C;


learn_pattern_exp	:	pattern_forms | eval_expression;


learn_template_expression	:	learn_template_expression learn_template_exp | learn_template_exp;

learn_template_exp	:	text | tag_expression | eval_expression;




addtomap_expression	:	ADDTOMAP NAME template_expression NAME_C KEY template_expression KEY_C VALUE template_expression VALUE_C ADDTOMAP_C;


addtoset_expression	:	ADDTOSET NAME template_expression NAME_C KEY template_expression KEY_C ADDTOSET_C;

readkeys_expression	:	READKEYS template_expression READKEYS_C;
readset_expression	:	READSET template_expression READSET_C;

modifymap_expression	:	MODIFYMAP NAME template_expression NAME_C KEY template_expression KEY_C VALUE template_expression VALUE_C MODIFYMAP_C;

removefrommap_expression	:	REMOVEFROMMAP NAME template_expression NAME_C KEY template_expression KEY_C REMOVEFROMMAP_C;

removefromset_expression	:	REMOVEFROMSET NAME template_expression NAME_C KEY template_expression KEY_C REMOVEFROMSET_C;




%%

/** aqui incluimos el fichero generado por el 'lex'
*** que implementa la funcion 'yylex'
**/
#include "lex.yy.c"

void yyerror(const char *msg ){
	fprintf(stderr,"[Linea %d]: %s\n", numLinea, msg);
}
