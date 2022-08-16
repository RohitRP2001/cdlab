%{
#include<stdio.h>
#include<string.h>
#include <stdlib.h>
%}
%%
S:E F
;
E:'a'E'b'
|
;
F:'b'F'c'
|
;
%%
int main()
{
printf("enter the string\n");
yyparse();
printf("\n Valid string\n");
}
int yyerror(){

printf("invalid\n");
exit(0);
}
