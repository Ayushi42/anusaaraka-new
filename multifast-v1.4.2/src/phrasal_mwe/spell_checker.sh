#RUN: sh spell_checker.sh <eng-file-name> <hnd-file-name>
#EX:  sh spell_checker.sh Eng-file Hnd_file
#Output: missing_wrds.txt
#######################################################################

paste $1 $2 > final-file

cd $HOME_anu_test/multifast-v1.4.2/src/phrasal_mwe
utf8_wx < hi_IN.dic > hi_IN.dic.txt

cd $HOME_anu_test/multifast-v1.4.2/src/
sh get_multi_word-dic.sh  $HOME_anu_test/multifast-v1.4.2/src/phrasal_mwe/hi_IN.dic.txt  $HOME_anu_test/multifast-v1.4.2/src/phrasal_mwe/hi_IN.dic.c

cd $HOME_anu_test/multifast-v1.4.2/src/phrasal_mwe
./check_hindi_words final-file > final-file.txt
python find_missing_wrds.py  final-file.txt > missing_wrds.txt

#./check_hindi_words $1 > $1.txt
#python find_missing_wrds.py  $1.txt > missing_wrds.txt

