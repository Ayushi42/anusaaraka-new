mypath=`pwd`
utf8_wx < $1 > $1_wx
python $HOME/hindi-parsers/nsdp-cs/mono_jm_parser.py --load $HOME/hindi-parsers/nsdp-cs/PARSER/UD/HI/PARSER/hi-ud-parser --test $mypath/$1_wx --output-file $mypath/$1_out
gvim $mypath/$1_out
