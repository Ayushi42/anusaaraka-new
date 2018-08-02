#python find_missing_wrds.py  $1.txt > missing_wrds.txt
#where $1.txt is the output of check_hindi_words.c 
#Written by Roja(17-08-17)
#########################################################
import sys,commands

f = open(sys.argv[1], 'r')
fr = f.readlines()

eng_sent = ''
hnd_sent = ''
dic = {}

punct_lst = ['.', '"', '`', '(', ')', '[', ']', '{', '}', '?', '!', ';', '\'', ':' , ',', '/', '@', '$', '&', '*', '%', '+', '=', '-']

missing_wrd_lst = []

for i in range(0, len(fr)):
#	print fr[i].strip()
	if fr[i].strip() == ';~~~~~~~~~~':
		hnd_lst = hnd_sent.split()
		for j in range(0, len(hnd_lst)):
			if j+1 not in dic.keys() and hnd_lst[j] not in punct_lst  :
				if not hnd_lst[j].isdigit():
					#my_cmd = 'echo "'+  hnd_lst[j] + '" | wx_utf8'
					#hnd_wrd = commands.getoutput(my_cmd) 
					#missing_wrd_lst.append(hnd_wrd)
					missing_wrd_lst.append(hnd_lst[j])
		if missing_wrd_lst != []:
			print 'ENG:: ' + eng_sent
#			my_cmd = 'echo "'+  hnd_sent + '" | wx_utf8' 
#			hnd_sent_utf8 = commands.getoutput(my_cmd)	
#			print 'HND:: ' + hnd_sent_utf8
			print 'HND:: ' + hnd_sent
			print '\n'.join(missing_wrd_lst)	
			print fr[i].strip() 
		dic = {}
		missing_wrd_lst = []
	elif '(hnd_wrd-hnd_id' in fr[i]: #Multifast output
		lst = fr[i].strip().split('\t')
		wrd = lst[1][1:-1]
		wrd_id = lst[2][:-2]
#		print wrd, wrd_id
		dic[int(wrd_id)] = wrd	
	else:
		lst = fr[i].strip().split('\t')
		eng_sent = lst[0]
		hnd_sent = lst[1]
