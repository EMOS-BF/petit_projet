%option nounput noinput
%{
#include "proto-color.h"
%}
%%
-|[0-9]+ printf(RED("[int:%s]"), yytext);
-|[0-9]+"."[0-9]+ printf(BLUE("[float:%s]"), yytext);
"int"[" "]+[a-zA-Z][a-zA-Z0-9]* printf(GREEN("[Variable:%s]"), yytext);
"float"[" "]+[a-zA-Z][a-zA-Z0-9]* printf(GREEN("[Variable:%s]"),yytext);
"char"[" "]+[a-zA-Z][a-zA-Z0-9]* printf(GREEN("[Variable:%s]"),yytext);
[" "] printf(GREEN("[ESPACE:%s]"), yytext);
["\n"] printf(BLUE("[Retour à la ligne:%s]"), yytext);
%%
int yywrap(void) { return 1; }
int main(int argc, char *argv[]) { while (yylex()!=0) ; return 0; } 
