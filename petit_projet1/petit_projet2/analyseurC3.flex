%option nounput noinput
%{
#include "proto-color.h"
%}
%x COMMENT

%%
"/*"	       { BEGIN(COMMENT); SET_COLOR(1);}
<COMMENT>"*/"  { BEGIN(INITIAL); SET_COLOR(0); }
<COMMENT>.|\n  { ECHO; }

%%

int yywrap(void) { return 1; }
int main(int argc, char *argv[]) { while (yylex()!=0) ; return 0; }
