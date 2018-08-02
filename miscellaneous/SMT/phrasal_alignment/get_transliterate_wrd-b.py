#Written by Roja(21-07-17)
#RUN:: python get_transliterate_wrd.py <eng_wrd> <hnd_wrd> <sound_dic>
#Ex::  python get_transliterate_wrd.py  paneer  panIra  Sound_dic.txt
#################################################################################
import sys

eng = str(sys.argv[1])
hnd = str(sys.argv[2])

sound_dic = {}
stack = []
eng_index = 0
hnd_index = 0

print 'original words: ', eng, hnd

#Sound dic:
for line in open(sys.argv[3]):
	sound_lst = line.strip().split('\t')
	sound_dic[sound_lst[0]] = sound_lst[1]

#Function to check keys in sound dic with each char
def check_key_in_dic(char):
	lst = []
	for key in sound_dic.keys():
		if key.startswith(char):
			lst.append(key)
	return lst


#Function to check sound present in target word:
def check_sound_in_tgt(s_lst, e_index, h_index, eng):
	ind = []
	for k in range(0, len(s_lst)):
		if s_lst[k] == hnd[h_index:h_index+len(s_lst[k])]:
			if k == len(s_lst)-1 :
				h_index = h_index + len(s_lst[k])
				stack.append(eng + ' ' + s_lst[k] + ' ' +  str(e_index) + ' ' + str(h_index))
			else:
				j = h_index + len(s_lst[k])
				stack.append(eng + ' ' + s_lst[k] + ' ' +  str(e_index) + ' ' + str(j))
		if s_lst[k] == '-': #To handle silent words
			stack.append(eng + ' ' + s_lst[k] + ' ' +  str(e_index) + ' ' + str(h_index))
	print stack
	if stack != []:
		pair = stack.pop()
		ind = pair.split()
	else:	#If stack empty then return indexes passed to the function
		ind.append(e_index)
		ind.append(h_index)
	return ind #return eng and hnd indexes

str1 = ''
str2 = ''
partial_eng_match = ''
partial_hnd_match = ''
max_eng_len = 0
max_hnd_len = 0
ind = 0
count = 0


while eng_index < len(eng):
	count += 1
	e = eng[eng_index]
	eng_keys = check_key_in_dic(e)
	for each in eng_keys:
		if each in eng and each in sound_dic :
#			print '^^^', e , eng_index, hnd_index, eng_keys
			s = sound_dic[each].split('/')
			ind = eng_index
			eng_index = eng_index + len(each)
			o = check_sound_in_tgt(s, eng_index, hnd_index, each)
			l =  o
			if len(l) == 4:
				eng_index = int(l[2])
				hnd_index = int(l[3])
#				print '%%', eng_index, hnd_index, str1
				#To get string partial or transliterate string
				if len(str1) >= eng_index:
					str1 = str1[0:eng_index-1] + l[0]
				else:
					str1 = str1 + l[0]
					if max_eng_len < eng_index:
						max_eng_len = eng_index
						partial_eng_match = str1
				if len(str2) >= hnd_index and l[1] != '-': #To handle silent words
					str2 = str2[0:hnd_index-1] + l[1]
				else:
					if l[1] != '-': #To handle silent words
						str2 = str2 + l[1]
						if max_hnd_len < hnd_index:
							max_hnd_len = hnd_index
							partial_hnd_match = str2
			else:
				eng_index = ind
				hnd_index = int(l[1])
#	print partial_eng_match , partial_hnd_match, max_eng_len , max_hnd_len, count, stack
	if count > max_eng_len+10 and stack == []: #To stop while loop assuming maximum index+10 len
		break

#####################
#print '-----------'
if str1 == eng  and str2 == hnd:
	print '(eng_word-tran_word\t' + str1 + '\t' +  str2 + ' )'
#	print 'Transliterate word ::', str1 , str2
###Rule 1: In hindi last letter 'a' is silent. Ex:  panIra, kaNtrola etc.
elif str2 + 'a' == hnd:
	print 'Transliterate word ::', str1 , str2 + 'a'
else:
	print 'Partial match ::', partial_eng_match , partial_hnd_match , max_eng_len , max_hnd_len


