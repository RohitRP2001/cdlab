%{
#include <stdio.h>
int count_multi=0,count_single=0,flag=0;
%}
%%
((\/)(\/).*"\n") {count_single++ ;}
(\/\*)|(("\n")*) {flag=1;}
"*/" {if(flag==1) {count_multi++; flag=0;}}
%%
int main(){
	yyin = fopen("test1.c","r");
	yyout = fopen("test2.c","w");
	yylex();
	printf("no of single line comments =%d",+count_single);
	printf("no of multi line comments =%d",+count_multi);
	return 0;	
	}
