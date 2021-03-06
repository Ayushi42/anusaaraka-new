
 if ! [ -d $4/tmp/$1_tmp/$2 ] ; then
    echo "Sentence $2 does not exist in $1"
    exit
 fi

 MYPATH=$4/tmp

 cd $MYPATH/$1_tmp/$2
 echo "(defglobal ?*path* = $HOME_anu_test)" > global_path.clp
 echo "(defglobal ?*provisional_wsd_path* = $HOME_anu_provisional_wsd_rules)" >> global_path.clp
 echo "(Parser_used Stanford-Parser)" >> parser_type.dat
 echo "(Domain $5)" >> domain.dat
 echo "(hindi_parser $6)" >> hindi_parser.dat
 
 cd $HOME_anu_test/Anu_src/
 ./constituency_parse $MYPATH/$1_tmp/$2/E_constituents_info_tmp.dat  $MYPATH/$1_tmp/$2/Node_category_tmp.dat < $MYPATH/$1_tmp/$2/sd-lexicalize_info.dat

 cd $MYPATH/$1_tmp/$2
 myclips -f $HOME_anu_test/Anu_clp_files/run_modules_std.bat >  $1.error
 #Following two files are added to handle PropN fact and SYMBOL facts in layered o/p 
 python $HOME_anu_test/Anu_src/add-@_in-hindi_sentence.py hindi_meanings_tmp1.dat hindi_meanings.dat
 python $HOME_anu_test/Anu_src/add-@_in-hindi_sentence.py hindi_meanings_with_grp_ids_tmp1.dat hindi_meanings_with_grp_ids.dat
 
 cd $HOME_anu_test/Anu_src/
 perl   FinalGenerate.pl $HOME_anu_test/bin/hi.gen.bin  $HOME_anu_test/Anu_databases/AllTam.gdbm  $MYPATH/ $1 $2 $HOME_anu_test/bin/hi.morf.bin < $MYPATH/$1_tmp/$2/id_Apertium_input.dat > $MYPATH/$1_tmp/$2/id_Apertium_output1.dat

 cd $MYPATH/$1_tmp/$2
 python $HOME_anu_test/Anu_src/add-@_in-hindi_sentence.py  id_Apertium_output1.dat id_Apertium_output2.dat
 sed -e 's/#//g' $MYPATH/$1_tmp/$2/id_Apertium_output2.dat > $MYPATH/$1_tmp/$2/id_Apertium_output.dat

 cp $MYPATH/$1_tmp/underscore_hyphen_replace_info.txt  $MYPATH/$1_tmp/$2/underscore_hyphen_replace_info.dat

 #============================= minion purpose ==================================
 sh $HOME_anu_test/miscellaneous/SMT/MINION/alignment/get_group_mng.sh shallow_parser_output.dat
 $HOME_anu_test/miscellaneous/SMT/MINION/alignment/get_tam_info.out shallow_parser_GNP_info.dat shallow_parser_root_tmp.dat shallow_parser_tam.dat  < shallow_parser_output.dat > /dev/null

 if [ "$6" == "full" ]; then
 	$HOME_anu_test/miscellaneous/SMT/MINION/alignment/get_tam_info_from_full_parser.out shallow_parser_GNP_info.dat shallow_parser_root_tmp.dat shallow_parser_tam.dat full_parser_relation.dat < full_parser_output.dat > /dev/null
 fi
 myclips -f $HOME_anu_test/miscellaneous/SMT/MINION/alignment/run_H_gen_minion.bat >> $1.error
 
 sh $HOME_anu_test/miscellaneous/SMT/MINION/alignment/run_minion.sh minion_input.txt 
 
 if [ -s "minion_output_tmp.dat" ] ;
 then   echo "" >> $MYPATH/$1_tmp/no_sol_found_tmp.txt  
 else
	echo $2 >> $MYPATH/$1_tmp/re_executed_sentences.txt
	myclips -f $HOME_anu_test/miscellaneous/SMT/MINION/alignment/run_H_gen_minion1.bat >> $1.error
 fi

 var1="minion-resume-[0-9]*"
 if [ -s $var1  ] ; then
 	rm minion-resume*
	echo $2 >> $MYPATH/$1_tmp/re_executed_sentences.txt
        myclips -f $HOME_anu_test/miscellaneous/SMT/MINION/alignment/run_H_gen_minion1.bat >> $1.error
 fi

 sh $HOME_anu_test/miscellaneous/SMT/MINION/alignment/run_minion.sh minion_input.txt 

 myclips -f $HOME_anu_test/miscellaneous/SMT/MINION/alignment/alignment.bat >> $1.error
 #==========================================================================================

 cat  para_sent_id_info.dat original_word.dat word.dat punctuation_info.dat sd_chunk.dat cat_consistency_check.dat padasuthra.dat root.dat  revised_preferred_morph.dat parserid_wordid_mapping.dat lwg_info.dat relations.dat hindi_meanings.dat GNP_agmt_info.dat id_Apertium_output.dat  hindi_id_order.dat position.dat hindi_punctuation.dat catastrophe.dat English_sentence.dat word_alignment.dat >>$MYPATH/$1_tmp/$2/all_facts

 cat  para_sent_id_info.dat original_word.dat word.dat punctuation_info.dat sd_chunk.dat cat_consistency_check.dat padasuthra.dat root.dat  revised_preferred_morph.dat lwg_info.dat hindi_meanings.dat GNP_agmt_info.dat id_Apertium_output.dat catastrophe.dat  >>$MYPATH/$1_tmp/$2/facts_for_eng_html 

 cat  para_sent_id_info.dat word.dat sd_chunk.dat position.dat hindi_punctuation.dat >>$MYPATH/$1_tmp/$2/facts_for_tran_html
 cat  para_sent_id_info.dat word.dat sd_chunk.dat position.dat hindi_punctuation.dat catastrophe.dat English_sentence.dat word_alignment.dat manual_hindi_sen.dat confidence_level.dat hindi_id_order_for_minion.dat manual_id_mapping.dat >$MYPATH/$1_tmp/$2/facts_for_align_html
 cat proper_nouns.dat >> $MYPATH/$1_tmp/proper_nouns_list
 cat minion_sen_dic.txt >> $MYPATH/$1_tmp/minion_dic.txt

 if [ -s "minion_output_tmp.dat" ] ;
 then   echo $2 "  Solution Found" >> $MYPATH/$1_tmp/no_sol_found_tmp.txt
 else
	echo $2 "  No Solution Found" >> $MYPATH/$1_tmp/no_sol_found_tmp.txt
 fi
  
 var="minion-resume-[0-9]*"
 if [ -s $var  ] ; then
 	echo $2  "  Time-out"  >> $MYPATH/$1_tmp/no_sol_found_tmp.txt
 fi

# cat mngs_aligned_with_dic.dat >> $MYPATH/$1_tmp/meanings_aligned_with_dic_tmp.txt  
 cat wsd_errors_tmp.dat >> $MYPATH/$1_tmp/wsd_errors_tmp.txt  
 cat mngs_aligned_with_anu.dat >> $MYPATH/$1_tmp/meanings_aligned_with_anu_tmp.txt  
 cat mngs_aligned_with_minion.dat >> $MYPATH/$1_tmp/meanings_aligned_with_minion_tmp.txt  

 sh $HOME_anu_test/bin/abbr.sh
 python $HOME_anu_test/Anu_src/add-@_in-hindi_sentence.py  hindi_sentence_tmp1.dat hindi_sentence_tmp2.dat

 cat  hindi_sentence_tmp2.dat |  sed -e 's/\\@//g' | sed 's/@//g'  > hindi_sentence.dat
 cat  hindi_sentence.dat
 echo "(hin_sen " > hindi_sentence_SMT_tmp.dat 
 cat hindi_sentence.dat >> hindi_sentence_SMT_tmp.dat
 echo ")" >> hindi_sentence_SMT_tmp.dat
 sed 's/&/\&amp;/g' hindi_sentence_SMT_tmp.dat|sed -e s/\'/\\\'/g |sed 's/\"/\&quot;/g'  >hindi_sentence_SMT.dat

 grep "Warning:" $1.error > error.txt
 sort -u error.txt > errors.txt
 grep -B2 "FALSE\|halted" $1.error >> errors.txt

 cat errors.txt

 myclips -f $HOME_anu_test/Anu_clp_files/user_info.bat > /dev/null
 mv user_wsd_info.dat $MYPATH/$1_$2_user_wsd_info.dat
