%option nounput noinput

%{
#include "proto-color.h"

int level = 0;
%}

%x COMMENT

%%
"/*"	        { BEGIN(COMMENT); level++; SET_COLOR(level); ECHO;} 
<COMMENT>"/*"   { level++; SET_COLOR(level); ECHO; }
<COMMENT>"*/"   { level--; ECHO; SET_COLOR(level);
		  if (level == 0) BEGIN(INITIAL);
                }
 <COMMENT>.|\n  ECHO;
 .|\n           ECHO;

%%

int yywrap(void) { return 1; }
int main(int argc, char *argv[]) { while (yylex()!=0) ; SET_COLOR(0); return 0; } 
