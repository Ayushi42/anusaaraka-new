
/* This programme converts wx to utf8 */
/* Added by Roja (07-09-12) 	 */

%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "clips.h"
#include <stddef.h>
char *utf8_string;
char *returnValue;
%}

ROM_WORD @[A-Za-z0-9-]+

NON_ALPHABETS [^@A-Za-z]+

%x consonant

%%
{ROM_WORD}	{	strcat(utf8_string, yytext+1);	BEGIN INITIAL;	}

A	{	strcat(utf8_string,"आ");	}
E	{	strcat(utf8_string,"ऐ");	}
I	{	strcat(utf8_string,"ई");	}
O	{	strcat(utf8_string,"औ");	}
U	{	strcat(utf8_string,"ऊ");	}
Q	{	strcat(utf8_string,"ॠ");	}
a	{	strcat(utf8_string,"अ");	}
e	{	strcat(utf8_string,"ए");	}
i	{	strcat(utf8_string,"इ");	}
o	{	strcat(utf8_string,"ओ");	}
u	{	strcat(utf8_string,"उ");	}
q	{	strcat(utf8_string,"ऋ");	}
aM	{	strcat(utf8_string,"अं");	}
aH	{	strcat(utf8_string,"अः");	}
eV	{	strcat(utf8_string,"ऎ");	}
oV	{	strcat(utf8_string,"ऒ");	}
eY	{	strcat(utf8_string,"ऍ");	}
oY	{	strcat(utf8_string,"ऑ");	}

<consonant>A	{	strcat(utf8_string,"ा");	BEGIN INITIAL;	}
<consonant>E	{	strcat(utf8_string,"ै");	BEGIN INITIAL;	}
<consonant>I	{	strcat(utf8_string,"ी");	BEGIN INITIAL;	}
<consonant>O	{	strcat(utf8_string,"ौ");	BEGIN INITIAL;	}
<consonant>U	{	strcat(utf8_string,"ू");	BEGIN INITIAL;	}
<consonant>Q	{	strcat(utf8_string,"ॄ");	BEGIN INITIAL;	}
<consonant>a	{		BEGIN INITIAL;	}
<consonant>e	{	strcat(utf8_string,"े");	BEGIN INITIAL;	}
<consonant>i	{	strcat(utf8_string,"ि");	BEGIN INITIAL;	}
<consonant>o	{	strcat(utf8_string,"ो");	BEGIN INITIAL;	}
<consonant>u	{	strcat(utf8_string,"ु");	BEGIN INITIAL;	}
<consonant>q	{	strcat(utf8_string,"ृ");	BEGIN INITIAL;	}
H		{	strcat(utf8_string,"ः");	BEGIN INITIAL;	}
M		{	strcat(utf8_string,"ं");	BEGIN INITIAL;	}
z		{	strcat(utf8_string,"ँ");	BEGIN INITIAL;	}
<consonant>eV	{	strcat(utf8_string,"ॆ");	BEGIN INITIAL;	}
<consonant>oV	{	strcat(utf8_string,"ॊ");	BEGIN INITIAL;	}
<consonant>eY   {       strcat(utf8_string,"ॅ");	BEGIN INITIAL;	}
<consonant>oY	{	strcat(utf8_string,"ॉ");	BEGIN INITIAL;	/*}
Z		{	strcat(utf8_string,"़");	BEGIN INITIAL;	*/}


k	{	strcat(utf8_string,"क");	BEGIN consonant;	}
K	{	strcat(utf8_string,"ख");	BEGIN consonant;	}
g	{	strcat(utf8_string,"ग");	BEGIN consonant;	}
G	{	strcat(utf8_string,"घ");	BEGIN consonant;	}
f	{	strcat(utf8_string,"ङ");	BEGIN consonant;	}
c	{	strcat(utf8_string,"च");	BEGIN consonant;	}
C	{	strcat(utf8_string,"छ");	BEGIN consonant;	}
j	{	strcat(utf8_string,"ज");	BEGIN consonant;	}
J	{	strcat(utf8_string,"झ");	BEGIN consonant;	}
F	{	strcat(utf8_string,"ञ");	BEGIN consonant;	}
t	{	strcat(utf8_string,"ट");	BEGIN consonant;	}
T	{	strcat(utf8_string,"ठ");	BEGIN consonant;	}
d	{	strcat(utf8_string,"ड");	BEGIN consonant;	}
D	{	strcat(utf8_string,"ढ");	BEGIN consonant;	}
N	{	strcat(utf8_string,"ण");	BEGIN consonant;	}
w	{	strcat(utf8_string,"त");	BEGIN consonant;	}
W	{	strcat(utf8_string,"थ");	BEGIN consonant;	}
x	{	strcat(utf8_string,"द");	BEGIN consonant;	}
X	{	strcat(utf8_string,"ध");	BEGIN consonant;	}
n	{	strcat(utf8_string,"न");	BEGIN consonant;	}
p	{	strcat(utf8_string,"प");	BEGIN consonant;	}
P	{	strcat(utf8_string,"फ");	BEGIN consonant;	}
b	{	strcat(utf8_string,"ब");	BEGIN consonant;	}
B	{	strcat(utf8_string,"भ");	BEGIN consonant;	}
m	{	strcat(utf8_string,"म");	BEGIN consonant;	}
y	{	strcat(utf8_string,"य");	BEGIN consonant;	}
r	{	strcat(utf8_string,"र");	BEGIN consonant;	}
l	{	strcat(utf8_string,"ल");	BEGIN consonant;	}
v	{	strcat(utf8_string,"व");	BEGIN consonant;	}
S	{	strcat(utf8_string,"श");	BEGIN consonant;	}
R	{	strcat(utf8_string,"ष");	BEGIN consonant;	}
s	{	strcat(utf8_string,"स");	BEGIN consonant;	}
h	{	strcat(utf8_string,"ह");	BEGIN consonant;	}
lY	{	strcat(utf8_string,"ळ");	BEGIN consonant;	}

<consonant>k	{	strcat(utf8_string,"्क");	BEGIN consonant;	}
<consonant>K	{	strcat(utf8_string,"्ख");	BEGIN consonant;	}
<consonant>g	{	strcat(utf8_string,"्ग");	BEGIN consonant;	}
<consonant>G	{	strcat(utf8_string,"्घ");	BEGIN consonant;	}
<consonant>f	{	strcat(utf8_string,"्ङ");	BEGIN consonant;	}
<consonant>c	{	strcat(utf8_string,"्च");	BEGIN consonant;	}
<consonant>C	{	strcat(utf8_string,"्छ");	BEGIN consonant;	}
<consonant>j	{	strcat(utf8_string,"्ज");	BEGIN consonant;	}
<consonant>J	{	strcat(utf8_string,"्झ");	BEGIN consonant;	}
<consonant>F	{	strcat(utf8_string,"्ञ");	BEGIN consonant;	}
<consonant>t	{	strcat(utf8_string,"्ट");	BEGIN consonant;	}
<consonant>T	{	strcat(utf8_string,"्ठ");	BEGIN consonant;	}
<consonant>d	{	strcat(utf8_string,"्ड");	BEGIN consonant;	}
<consonant>D	{	strcat(utf8_string,"्ढ");	BEGIN consonant;	}
<consonant>N	{	strcat(utf8_string,"्ण");	BEGIN consonant;	}
<consonant>w	{	strcat(utf8_string,"्त");	BEGIN consonant;	}
<consonant>W	{	strcat(utf8_string,"्थ");	BEGIN consonant;	}
<consonant>x	{	strcat(utf8_string,"्द");	BEGIN consonant;	}
<consonant>X	{	strcat(utf8_string,"्ध");	BEGIN consonant;	}
<consonant>n	{	strcat(utf8_string,"्न");	BEGIN consonant;	}
<consonant>p	{	strcat(utf8_string,"्प");	BEGIN consonant;	}
<consonant>P	{	strcat(utf8_string,"्फ");	BEGIN consonant;	}
<consonant>b	{	strcat(utf8_string,"्ब");	BEGIN consonant;	}
<consonant>B	{	strcat(utf8_string,"्भ");	BEGIN consonant;	}
<consonant>m	{	strcat(utf8_string,"्म");	BEGIN consonant;	}
<consonant>y	{	strcat(utf8_string,"्य");	BEGIN consonant;	}
<consonant>r	{	strcat(utf8_string,"्र");	BEGIN consonant;	}
<consonant>l	{	strcat(utf8_string,"्ल");	BEGIN consonant;	}
<consonant>v	{	strcat(utf8_string,"्व");	BEGIN consonant;	}
<consonant>S	{	strcat(utf8_string,"्श");	BEGIN consonant;	}
<consonant>R	{	strcat(utf8_string,"्ष");	BEGIN consonant;	}
<consonant>s	{	strcat(utf8_string,"्स");	BEGIN consonant;	}
<consonant>h	{	strcat(utf8_string,"्ह");	BEGIN consonant;	}
<consonant>lY	{	strcat(utf8_string,"्ळ");	BEGIN consonant;	}

<consonant>Z	{	strcat(utf8_string,"़");	BEGIN consonant;	}

<consonant>([ ]|\n|{NON_ALPHABETS})	{	strcat(utf8_string,"्");	strcat(utf8_string+3,yytext);	BEGIN INITIAL; /* previous devanagiri character(् ) takes 3 bytes so advancing buffer pointer to buf+3 */}
{NON_ALPHABETS}         { strcat(utf8_string, yytext);  BEGIN INITIAL;}

%%
