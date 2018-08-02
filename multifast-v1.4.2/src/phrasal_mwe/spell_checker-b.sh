#RUN: sh spell_checker.sh <file-name>
#EX:  sh spell_checker.sh Eng-Hnd_file.txt
#Output: missing_wrds.txt
#Note: Input file should be pasted output of Eng and Hnd_tokenised file.
#######################################################################

./check_hindi_words $1 > $1.txt
python find_missing_wrds.py  $1.txt > missing_wrds.txt

