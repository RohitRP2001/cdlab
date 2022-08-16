%{
#include<stdio.h>
int numkey=0,numid=0,numop=0;
%}

%%
[+][+] numop++;
[\-][\-] numop++;
[+\-*/!<>">=""<=""=="] numop++;
[i][f] numkey++;
[w][h][i][l][e] numkey++;
[i][n][t] numkey++;
[m][a][i][n] numkey++;
[c][h][a][r] numkey++;
[r][e][t][u][r][n] numkey++;
[A-Za-z_][A-Za-z_0-9]* numid++;
\n return 0;
. ;
%%
int main(){
printf("enter the input\n");
yylex();
printf("Number of operators %d\n",numop);
printf("Number of keywords %d \n",numkey);
printf("Number of identifiers %d\n",numid);
}
int yywrap(){}



