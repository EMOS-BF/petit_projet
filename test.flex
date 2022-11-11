%option nounput noinput
%%
"a" printf("Evence");
%% 
int yywrap(void) { return 1; }
int main(int argc, char *argv[]) { while (yylex()!=0) ; return 0; } 