%{
#include <stdio.h>
int pn=0,nn=0,pf=0,nf=0;
//definition section	
%}
%%
[-][0-9]+ nn++; 
[+]?[0-9]+ pn++;
[+]?[0-9]+[/][-][0-9]+ nf++;
[+]?[0-9]+[/][+]?[0-9]+ pf++;
[-][0-9]+[/][-][0-9]+ pf++;
[-][0-9]+[/][+]?[0-9]+ nf++;

[+]?[0-9]+[.][0-9]+ pf++;
[-][0-9]*.[0-9]+ nf++;
[-+]?[0-9]*+.[+-][0-9]+ ;
[-+]?[0-9]*+.[+-][0-9]+[/][-+]?[0-9]*+.[+-][0-9]+ ;






[%d] return 0; 
%%

int main(){
yylex();
printf("pf =%d \n nf =%d \n pn=%d \n nn=%d\n",pf,nf,pn,nn);


}



