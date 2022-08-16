%{
int l=0,w=0,s=0,c=0;
%}
%%
[a-zA-Z]+ {w++; c=c+yyleng;}
[\n] l++;
[ ] s++;
. c++;
%%
int main(){
yyin=fopen("t1.txt","r");
yylex();
printf("no of character %d \n, words=%d\n,lines=%d\n,spaces=%d\n",c,w,l,s);

}
