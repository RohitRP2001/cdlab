%{
#include<stdio.h>
#include<stdlib.h>
%}

%token keyword
%token fn
%%

S: X
;
X: keyword ' ' fn Y
;
Z: keyword ' ' fn Z
| ',' Z
|
;
Y: '(' keyword ' ' fn ')' '{' '}'
| '(' keyword ' ' fn ',' Z ')' '{' '}'
| '(' ')' '{' '}'
;
%%

int main(){
yyparse(); printf("VALID input\n");}

int yyerror(){
printf("ERROR"); exit(0); }

