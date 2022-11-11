%option nounput noinput
%{
#include "proto-color.h" 
%}
%%
for|if|while|do|else printf(GREEN("[KeyWord:%s]"), yytext);
"+"|"*"|"/"|"-" printf(RED("[Operateur:%s]"), yytext);
"<"|">" printf(BLUE("[comparateur:%s]"), yytext);
"("|")"|"{"|"}"|";"|","|"["|"]" printf(GREEN("[separateur:%s]") , yytext);
%%
int yywrap(void) { return 1; }
int main(int argc, char *argv[]) { while (yylex()!=0) ; return 0; } 

