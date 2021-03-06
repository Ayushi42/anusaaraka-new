/*Converting text to canonical form */
/*Added by Roja (13-08-12)  	    */

alphabets [a-zA-LN-Z]
anusvar   M
nukta	  Z

%{
extern void canonical_form(char* str , char* new_str);
char canonical_word[1000];
%}

%%

{alphabets}+{anusvar}{alphabets}+	{     canonical_form(yytext,canonical_word);
					      printf("%s", canonical_word);  /*Ex: AMkadZe  o/p: Afkade	*/
					}


{alphabets}+{nukta}{alphabets}+		{     canonical_form(yytext,canonical_word);
                                              printf("%s", canonical_word);  /*Ex: jadZawvIya  o/p: jadawvIya */
                                      	}

{anusvar}{alphabets}+			{     canonical_form(yytext,canonical_word);
                                              printf("%s", canonical_word);  /*Ex: saMbaMXiwa</text>  o/p: sambanXiwa</text>*/
                                        }

@[a-zA-Z]+				ECHO;

[a-zA-Z_]+iye				{	canonical_form(yytext,canonical_word); //To handle ke_liye
						printf("%s", canonical_word);
					}
%%
