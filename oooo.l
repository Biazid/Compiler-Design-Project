sml_letter [a-z]
cptl_letter [A-Z]
digit [0-9]

character ({sml_letter}+|{cptl_letter}+|{digit}+)

space [" "]
operator [+|-|*|/|;|:]


iint "var_int"
sstring "var_string"
ddouble "var_double"
vvoid "var_void"

variable ({iint}|{sstring}|{ddouble}|{vvoid})

main "main"
rtn "rtrn"


bt "gt"
st "st"
bet "get"
let "set"
eeq "eqq"
neq "neq"

Relational ({bt}|{st}|{bet}|{let}|{eeq}|{neq})


jj "jj"
bb "bb"

prf "pf"
scf "sf"

lfb "leftfb"
rfb "rightfb"
lsb "leftsb"
rsb "rightsb"


as "as"	
ffor "rof"
iif "iff"
eelse "elsee"
eelif "eliff"
wwhile "while"

include "@include"
stdo "stdio.h"
cnio "conio.h"

bk "brk"
continue "continue"


aand "and"
oor "or"
nnot "not"

jog "jog"
biyog "biyog"
goon "goon"
vag "vag"

joge "joge"
biyoge "biyoge"
goone "goone"
vage "vage"

%{
	int key_count = 0;
	int var_count =0;
	int text_count=0;
%}

%% 
{space}* {} 
"//"(.)* { printf("This is a Comment\n");}

{variable}{space}v_{character}+{space}":"{space}{lfb}{space}{variable}{space}v_{character}+{space}{rfb} {
																	printf("User Defined Function\n");
                                                                  }

{variable}{space}v_{character}+"["{digit}+"]" {printf("Array\n");}

({bk}|{continue}|{rtn}|{eelif}|{iif}|{eelse}|{prf}) {
														 printf("Keyword\n");
														 key_count++;
														}

{include}{space}{st}{space}({cnio}|{stdo}){space}{bt} {printf("Header Declaration!\n");}

({iint}|{vvoid}){space}{main}{space}":"{space}{lfb}{space}{rfb} {printf("This is main Function\n");}


{ffor}{space}{lfb}{space}v_{character}+":"v_{character}+"+"{digit}+":"[+|-]{space}{rfb} { 
													 printf("For Loop\n");
													 key_count++;
													}

{wwhile}{space}{lfb}{space}v_{character}+{space}({neq}|{bet}|{let}|{eeq}|{bt}|{st}){space}{digit}*{space}{rfb} {
													 printf("While Loop\n");
													 key_count++;
													}
{space}*{iif}{space}*{lfb}{space}*v_{character}+{space}*{Relational}{space}*v_{character}+{space}*{rfb} {
													printf("If statement\n");
													key_count++;
													}

{eelif}{space}{lfb}{space}v_{character}+{space}{Relational}{space}v_{character}+{space}{rfb} {
													printf("Else-if statement\n");
													key_count++;
													}
{eelse}{space}* {
	printf("Else statement\n");
	key_count++;
	}

v_{character}+ { printf("This is a variable\n"); var_count++; }

({aand}|{oor}|{nnot}) {printf("Logical Operator\n");}

({neq}|{bet}|{let}|{eeq}|{bt}|{st}) {printf("Relational Operator\n");}

({jj}|{bb}) {printf("Increment/Decrement Operator\n");}

({joge}|{biyoge}|{goone}|{vage}|{as}) {printf("Assignment Operator\n");}

({jog}|{biyog}|{goon}|{vag}) {printf("Arithmetic Operator\n");}

(variable) {printf("Data Type\n");}

{lsb} {printf("Block Start\n");}

{rsb} {printf("Block End\n");}

{scf}{space}{lfb}{space}v_{character}+{space}{rfb}";" {
				  printf("Read Function\n");
                }

":" {printf("Colon(punctuation)\n");}
";" {printf("SemiColon(punctuation)\n");}

{prf}{space}{lfb}{space}(\"({character}+|{space}+)+\"){space}{rfb}";" {
										printf("This is text for print\n");
										text_count++; 
									}


{digit}* {printf("It's a Number\n");}

%%

int yywrap(){
	return 1;
}

main()
{
	freopen("o.txt","r",stdin);
	printf("Starting\n");
	yylex();
	printf("Total Keyword: %d and variable = %d and text = %d ",key_count,var_count,text_count);
}