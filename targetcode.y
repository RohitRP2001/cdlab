%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
void AssemblyCode();
char AddToTable(char,char,char);
int ind=0;
char temp='A'-1;
struct incod
{
char opd1,opd2,opr;
};
%}

%union
{char sym ;}

%token <sym> LETTER NUMBER
%type <sym> expr
%left '-' '+'
%right '*' '/'
%%

statement: LETTER '=' expr ';' {AddToTable((char)$1,(char)$3,'=');}
| expr ';' {return 0;}
;
expr: expr '+' expr {$$ = AddToTable((char)$1,(char)$3,'+');}
| expr '-' expr {$$ = AddToTable((char)$1,(char)$3,'-');}
| expr '*' expr {$$ = AddToTable((char)$1,(char)$3,'*');}
| expr '/' expr {$$ = AddToTable((char)$1,(char)$3,'/');}
| '(' expr ')' {$$ = (char)$2;}
| NUMBER {$$ = (char)$1;}
| LETTER {$$ = (char)$1;}
;
%%
int yyerror(char *s){
printf("%s",s);
exit(0);
}
struct incod code[20];
int id=0;
char AddToTable(char opd1,char opd2,char opr)
{
code[ind].opd1 = opd1;
code[ind].opd2 = opd2;
code[ind].opr = opr; ind++;
temp++;
return temp;
}
void AssemblyCode()
{
int cnt=0; temp++;
printf("\n\n\t ASSEMBLY CODE\n\n");
while(cnt<ind){
printf("MOV R1 %c\n",code[cnt].opd1);
printf("MOV R2 %c\n",code[cnt].opd2);
switch(code[cnt].opr){
    case '+': printf("ADD R1, R2\nMOV %c R1\n",temp);
            break;
    case '-': printf("SUB R1, R2\nMOV %c R1\n",temp);
            break;
    case '*': printf("MUL R1, R2\nMOV %c R1\n",temp);
            break;
    case '/': printf("DIV R1, R2\nMOV %c R1\n",temp);
            break;
    case '=': printf("MOV %c, R2\n",code[cnt].opd1);
            break;
}
cnt++; temp++;
}
}

int main(){
printf("\nEnter the Expression: "); yyparse();
temp = 'A'-1;
AssemblyCode();
}
int yywrap(){
return 1;}

