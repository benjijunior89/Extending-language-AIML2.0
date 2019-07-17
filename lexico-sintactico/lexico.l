%{

	/*********************************************************
	** Autor: Benjamin Vega Herrera
	** Fichero: PRUEBA.L
	** Función: nalizar lexico AIML 2.1.
	**
	*********************************************************/
	/** Buffer usado para almacenamiento temporal de cadenas de texto
	**/
	#define MAXLONBUFFER 200
	char buffer[MAXLONBUFFER];
	#include "y.tab.h"

%}

/** La siguiente declaración indica que no se va a escribir la función ’yywrap’
*** evita que se tenga que enlazar con -lfl, o que se tenga que escribir ’yywrap’
**/
%option noyywrap

COMENTARIO_LINEA 			"<!--".*"-->"
COMENTARIO_BLOQUE			"<!--"(.|\n)*"-->"

XML	"<?xml" 
ENCODING "encoding=\"UTF-8\""
XML_C	"?>"

NUEVA	"<nueva>"

PREFIX	[a-zA-Z0-9]+"+"
SUBFIX	"+"[a-zA-Z0-9]+
OPTIONAL	"("[a-zA-Z0-9]+")"
CHOOSE	"["([a-zA-Z0-9]+\ )+[a-zA-Z0-9]+"]"

PREFIX_E	([a-zA-Z0-9]+"+")+[a-zA-Z0-9]+"+"
SUBFIX_E	"+"[a-zA-Z0-9]+("+"[a-zA-Z0-9]+)+

MAS	"+"
APERTURA	"<"

ADDTOMAP	"<addtomap>"
ADDTOSET	"<addtoset>"
READKEYS	"<readkeys>"
READSET		"<readset>"
READFILE	"<readfile>"
WRITEFILE	"<writefile>"
MODIFYMAP	"<modifymap>"
KEY	"<key>"

REMOVEFROMMAP	"<removefrommap>"
REMOVEFROMSET	"<removefromset>"


ADDTOMAP_C	"</addtomap>"
ADDTOSET_C	"</addtoset>"
READKEYS_C	"</readkeys>"
READSET_C	"</readset>"
READFILE_C	"</readfile>"
WRITEFILE_C	"</writefile>"
MODIFYMAP_C	"</modifymap>"
KEY_C	"</key>"




REMOVEFROMMAP_C	"</removefrommap>"
REMOVEFROMSET_C	"</removefromset>"






SRAIX_ATTRIBUTES	"host="|"botid="|"hint="|"apikey="|"service="

NAME_ATTRIBUTE	"name="
VALUE_ATTRIBUTE	"value="
VAR_ATTRIBUTE	"var="
DATE_ATTRIBUTES "format=\"f\""|"jformat=\"j\"" 
TIMEOUT_ATTRIBUTE	"timeout=\""[0-9]+"\""
INDEX_ATTRIBUTE	"index=\""[0-9]+"\""
THAT_INDEX_ATTRIBUTE	"index=\""[0-9]+","[0-9]+"\""

SET_STATEMENT	"<set>"[A-Za-z0-9]+"</set>"
PATTERN_SIDE_BOT_PROPERTY_EXPRESSION	"<bot><name>"[A-Za-z0-9]+"</name></bot>"|"<bot name=\""[A-Za-z0-9]+\""/>"

AIML	"<aiml "

CATEGORY	"<category>"
PATTERN	"<pattern>"
TEMPLATE	"<template>"

TOPIC	"<topic"
TOPIC_CERRADO	"<topic>"
THAT	"<that"
THAT_CERRADO	"<that>"

RANDOM	"<random>"
CONDITION	"<condition"

CIERRE	">"

LOOP	"<loop/>"

SRAI	"<srai>"
SR	"</sr>"
SRAIX	"<sraix"
SRAIX_CERRADO	"<sraix>"

SET	"<set"
SET_CERRADO	"<set>"
GET	"<get"
GET_CERRADO	"<get>"
MAP	"<map"
MAP_CERRADO	"<map>"
BOT	"<bot>"

DATE	"<date"
DATE_CERRADO	"<date>"
FORMAT	"<format>"
JFORMAT	"<jformat>"
INTERVAL	"<interval>"
STYLE	"<style>"
FROM	"<from>"
TO	"<to>"

THINK	"<think>"
EXPLODE	"<explode>"
NORMALIZE	"<normalize>"
DENORMALIZE	"<denormalize>"

FORMAL	"<formal>"
LOWERCASE	"<lowercase>"
UPPERCASE	"<uppercase>"
SENTENCE	"<sentence>"

PERSON	"<person>"
PERSON2	"<person2>"
GENDER	"<gender>"

STAR	"<star"
STAR_CERRADO	"<star>"
INDEX	"<index>"
THATSTAR	"<thatstar"
THATSTAR_CERRADO	"<thatstar>"
TOPICSTAR	"<topicstar"
TOPICSTAR_CERRADO	"<topicstar>"
INPUT	"<input>"
REQUEST	"<request"
REQUEST_CERRADO	"<request>"
RESPONSE	"<response"
RESPONSE_CERRADO	"<response>"

LEARN	"<learn>"
LEARNF	"<learnf>"
EVAL	"<eval>"
ID	"<id/>"
VOCABULARY	"</vocabulary>"
PROGRAM	"</program>"
SYSTEM	"<system"
SYSTEM_CERRADO	"<system>"
TIMEOUT	"<timeout>"
SIZE	"<size>"

LI	"<li"

VERSION	"version="
VAR	"<var>"

NAME	"<name>"
VALUE	"<value>"


COMILLAS	"\""

NUM_VERSION	[0-9]+"."[0-9]+


AIML_C	"</aiml>"

CATEGORY_C	"</category>"
PATTERN_C	"</pattern>"
TEMPLATE_C	"</template>"

TOPIC_C	"</topic>"
THAT_C	"</that>"

RANDOM_C	"</random>"
CONDITION_C	"</condition>"


SRAI_C	"</srai>"
SRAIX_C	"</sraix>"

SET_C	"</set>"
GET_C	"</get>"
MAP_C	"</map>"
BOT_C	"</bot>"
DATE_C	"</date>"

FORMAT_C	"</format>"
JFORMAT_C	"</jformat>"
INTERVAL_C	"</interval>"
STYLE_C	"</style>"
FROM_C	"</from>"
TO_C	"</to>"

THINK_C	"</think>"
EXPLODE_C	"</explode>"
NORMALIZE_C	"</normalize>"
DENORMALIZE_C	"</denormalize>"
FORMAL_C	"</formal>"
LOWERCASE_C	"</lowercase>"
UPPERCASE_C	"</uppercase>"
SENTENCE_C	"</sentence>"
PERSON_C	"</person>"
PERSON2_C	"</person2>"
GENDER_C	"</gender>"
STAR_C	"</star>"
INDEX_C	"</index>"
THATSTAR_C	"</thatstar>"
TOPICSTAR_C	"</topicstar>"
INPUT_C	"</input>"
REQUEST_C	"</request>"
RESPONSE_C	"</response>"

LEARN_C	"</learn>"
LEARNF_C	"</learnf>"
EVAL_C	"</eval>"
SYSTEM_C	"</system>"
TIMEOUT_C	"</timeout>"
SIZE_C	"</size>"

LI_C	"</li>"

NAME_C	"</name>"
VALUE_C	"</value>"


WORD	[A-Za-z0-9]+
PRIORITY_WORD	"\$"[A-Za-z0-9]+
WILDCARD	"\*"|"\_"|"\^"

PUNTO	"."
COMA	","
PUNTOCOMA	";"
IGUAL	"="

HOST	"<host>"
BOTID	"<botid>"
HINT	"<hint>"
APIKEY	"<apikey>"
SERVICE	"<service>"

HOST_C	"</host>"
BOTID_C	"</botid>"
HINT_C	"</hint>"
APIKEY_C	"</apikey>"
SERVICE_C	"</service>"

VAR_C	"</var>"

BARRA	"/"

DOSPUNTOS ":"

%%

{AIML}	{return AIML;}

{CATEGORY}	{return  CATEGORY;}
{PATTERN}	{return  PATTERN;}
{TEMPLATE}	{return  TEMPLATE;}

{TOPIC}	{return  TOPIC;}
{TOPIC_CERRADO}	{return  TOPIC_CERRADO;}
{THAT}	{return  THAT;}
{THAT_CERRADO}	{return  THAT_CERRADO;}

{RANDOM}	{return  RANDOM;}
{CONDITION}	{return  CONDITION;}

{LOOP}	{return  LOOP;}

{SRAI}	{return  SRAI;}
{SR}	{return  SR;}
{SRAIX}	{return  SRAIX;}
{SRAIX_CERRADO}	{return  SRAIX_CERRADO;}

{SET}	{return  SET;}
{SET_CERRADO}	{return  SET_CERRADO;}
{GET}	{return  GET;}
{GET_CERRADO}	{return  GET_CERRADO;}
{MAP}	{return  MAP;}
{MAP_CERRADO}	{return  MAP_CERRADO;}
{BOT}	{return  BOT;}
{DATE}	{return  DATE;}
{DATE_CERRADO}	{return DATE_CERRADO;}
{THINK}	{return  THINK;}
{EXPLODE}	{return  EXPLODE;}
{NORMALIZE}	{return  NORMALIZE;}
{DENORMALIZE}	{return  DENORMALIZE;}
{FORMAL}	{return  FORMAL;}
{LOWERCASE}	{return  LOWERCASE;}
{UPPERCASE}	{return  UPPERCASE;}
{SENTENCE}	{return  SENTENCE;}
{PERSON}	{return  PERSON;}
{PERSON2}	{return  PERSON2;}
{STAR}	{return  STAR;}
{STAR_CERRADO}	{return  STAR_CERRADO;}
{INDEX}	{return  INDEX;}
{THATSTAR}	{return  THATSTAR;}
{THATSTAR_CERRADO}	{return  THATSTAR_CERRADO;}
{TOPICSTAR}	{return  TOPICSTAR;}
{TOPICSTAR_CERRADO}	{return  TOPICSTAR_CERRADO;}
{INPUT}	{return  INPUT;}
{REQUEST}	{return  REQUEST;}
{REQUEST_CERRADO}	{return  REQUEST_CERRADO;}
{RESPONSE}	{return  RESPONSE;}
{RESPONSE_CERRADO}	{return  RESPONSE_CERRADO;}

{LEARN}	{return  LEARN;}
{LEARNF}	{return  LEARNF;}
{EVAL}	{return  EVAL;}
{ID}	{return  ID;}
{VOCABULARY}	{return  VOCABULARY;}
{PROGRAM}	{return  PROGRAM;}
{SYSTEM}	{return  SYSTEM;}
{SYSTEM_CERRADO}	{return  SYSTEM_CERRADO;}
{INTERVAL}	{return  INTERVAL;}
{SIZE}	{return  SIZE;}

{LI}	{return  LI;}




{AIML_C}	{return AIML_C;}

{CATEGORY_C}	{return  CATEGORY_C;}
{PATTERN_C}	{return  PATTERN_C;}
{TEMPLATE_C}	{return  TEMPLATE_C;}

{TOPIC_C}	{return  TOPIC_C;}
{THAT_C}	{return  THAT_C;}

{RANDOM_C}	{return  RANDOM_C;}
{CONDITION_C}	{return  CONDITION_C;}


{SRAI_C}	{return  SRAI_C;}
{SRAIX_C}	{return  SRAIX_C;}

{SET_C}	{return  SET_C;}
{GET_C}	{return  GET_C;}
{MAP_C}	{return  MAP_C;}
{BOT_C}	{return  BOT_C;}
{DATE_C}	{return  DATE_C;}
{THINK_C}	{return  THINK_C;}
{EXPLODE_C}	{return  EXPLODE_C;}
{NORMALIZE_C}	{return  NORMALIZE_C;}
{DENORMALIZE_C}	{return  DENORMALIZE_C;}
{FORMAL_C}	{return  FORMAL_C;}
{LOWERCASE_C}	{return  LOWERCASE_C;}
{UPPERCASE_C}	{return  UPPERCASE_C;}
{SENTENCE_C}	{return  SENTENCE_C;}
{PERSON_C}	{return  PERSON_C;}
{PERSON2_C}	{return  PERSON2_C;}
{STAR_C}	{return  STAR_C;}
{INDEX_C}	{return  INDEX_C;}
{THATSTAR_C}	{return  THATSTAR_C;}
{TOPICSTAR_C}	{return  TOPICSTAR_C;}
{INPUT_C}	{return  INPUT_C;}
{REQUEST_C}	{return  REQUEST_C;}
{RESPONSE_C}	{return  RESPONSE_C;}

{LEARN_C}	{return  LEARN_C;}
{LEARNF_C}	{return  LEARNF_C;}
{EVAL_C}	{return  EVAL_C;}
{SYSTEM_C}	{return  SYSTEM_C;}
{INTERVAL_C}	{return  INTERVAL_C;}
{SIZE_C}	{return  SIZE_C;}

{LI_C}	{return  LI_C;}



{NUM_VERSION}	{return  NUM_VERSION;}


{COMILLAS}	{return  COMILLAS;}


{VERSION}	{return  VERSION;}
{VAR}	{return  VAR;}
{VAR_C}	{return  VAR_C;}


{SRAIX_ATTRIBUTES}	{return SRAIX_ATTRIBUTES;}
{NAME_ATTRIBUTE}	{return NAME_ATTRIBUTE;}
{VALUE_ATTRIBUTE}	{return VALUE_ATTRIBUTE;}
{VAR_ATTRIBUTE}		{return VAR_ATTRIBUTE;}

{WORD}	{return  WORD;}
{PRIORITY_WORD}	{return  PRIORITY_WORD;}
{WILDCARD}	{return  WILDCARD;}
{SET_STATEMENT}	{return  SET_STATEMENT;}
{PATTERN_SIDE_BOT_PROPERTY_EXPRESSION}	{return  PATTERN_SIDE_BOT_PROPERTY_EXPRESSION;}


{CIERRE}	{return  CIERRE;}

{NAME}	{return  NAME;}
{VALUE}	{return  VALUE;}
{NAME_C}	{return  NAME_C;}
{VALUE_C}	{return  VALUE_C;}


{HOST}	{return HOST;}
{BOTID}	{return BOTID;}
{HINT}	{return HINT;}
{APIKEY}	{return APIKEY;}	
{SERVICE}	{return SERVICE;}

{HOST_C}	{return HOST_C;}
{BOTID_C}	{return BOTID_C;}
{HINT_C}	{return HINT_C;}
{APIKEY_C}	{return APIKEY_C;}	
{SERVICE_C}	{return SERVICE_C;}

{BARRA}	{return BARRA;}
{PUNTO}	{return PUNTO;}
{COMA}	{return COMA;}
{PUNTOCOMA}	{return PUNTOCOMA;}
{IGUAL}	{return IGUAL;}


{FORMAT}	{return FORMAT;}
{JFORMAT}	{return JFORMAT;}
{STYLE}	{return STYLE;}
{FROM}	{return FROM;}
{TO}	{return TO;}

{FORMAT_C}	{return FORMAT_C;}
{JFORMAT_C}	{return JFORMAT_C;}
{STYLE_C}	{return STYLE_C;}
{FROM_C}	{return FROM_C;}
{TO_C}	{return TO_C;}

{DATE_ATTRIBUTES}	{return DATE_ATTRIBUTES;}

{GENDER}	{return GENDER;}
{GENDER_C}	{return GENDER_C;}

{TIMEOUT_ATTRIBUTE}	{return TIMEOUT_ATTRIBUTE;}
{TIMEOUT} {return TIMEOUT;}
{TIMEOUT_C} {return TIMEOUT_C;}

{INDEX_ATTRIBUTE}	{return INDEX_ATTRIBUTE;}
{THAT_INDEX_ATTRIBUTE}	{return THAT_INDEX_ATTRIBUTE;}

{PREFIX}	{return PREFIX;}
{SUBFIX}	{return SUBFIX;}
{OPTIONAL}	{return OPTIONAL;}
{CHOOSE}	{return CHOOSE;}


{ADDTOMAP}	{return ADDTOMAP;}
{ADDTOSET}	{return ADDTOSET;}
{READKEYS}	{return READKEYS;}
{READSET}	{return READSET;}
{READFILE}	{return READFILE;}
{WRITEFILE}	{return WRITEFILE;}
{MODIFYMAP}	{return MODIFYMAP;}
{KEY}	{return KEY;}

{ADDTOMAP_C}	{return ADDTOMAP_C;}
{ADDTOSET_C}	{return ADDTOSET_C;}
{READKEYS_C}	{return READKEYS_C;}
{READSET_C}	{return READSET_C;}
{READFILE_C}	{return READFILE_C;}
{WRITEFILE_C}	{return WRITEFILE_C;}
{MODIFYMAP_C}	{return MODIFYMAP_C;}
{KEY_C}	{return KEY_C;}


{REMOVEFROMMAP}	{return REMOVEFROMMAP;}
{REMOVEFROMSET}	{return REMOVEFROMSET;}

{REMOVEFROMMAP_C}	{return REMOVEFROMMAP_C;}
{REMOVEFROMSET_C}	{return REMOVEFROMSET_C;}


{MAS}	{return MAS;}
{APERTURA}	{return APERTURA;}

{COMENTARIO_LINEA}	{}
{COMENTARIO_BLOQUE}	{}

{NUEVA}	{return NUEVA;}

{DOSPUNTOS}	{return DOSPUNTOS;}

{XML}	{return XML;}
{ENCODING}	{return ENCODING;}
{XML_C}	{return XML_C;}

\n  {++numLinea;}

(\t|" ")  {}

{PREFIX_E}	{ /** token desconocido, se produce un mensaje de error **/
snprintf(buffer, MAXLONBUFFER, "Error en expresión prefix’%s’.",yytext);
yyerror(buffer);}

{SUBFIX_E}	{ /** token desconocido, se produce un mensaje de error **/
snprintf(buffer, MAXLONBUFFER, "Error en expresion subfix ’%s’.",yytext);
yyerror(buffer);}

.   { /** token desconocido, se produce un mensaje de error **/
snprintf(buffer, MAXLONBUFFER, "No hay ningún token que contenga el lexema ’%s’.",yytext);
yyerror(buffer);}
%%
