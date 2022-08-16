%{
#include"y.tab.h"
%}

%%
"int"|"float"|"void"|"char" return keyword;
[A-Za-z0-9]* return fn;
. return yytext[0];
\n return 0;
%%
