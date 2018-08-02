from collections import defaultdict
from itertools import izip , count

import os
import re
import math
import sys
import operator

file1 = sys.argv[1]
f1 = open(file1, 'r')
lines = f1.readlines()


file2 = sys.argv[2]
f2 = open(file2, 'r')
lines2 = f2.readlines()

#file3 = sys.argv[3]
#f3 = open(file3, 'r')
#lines3 = f3.readlines()
#
#print '*****',lines3

#for i in lines3:
#	print lines3

trnslist = []


#words = ['are','as','been','but','came','case','can','done','for','from','got','had','has','have','here','his','him','is','later','like','make','made','of','runs','sure','same','some','so','that','they','this','us','use','was','we','were','with','will','your']



def transliteration(eng,trns):

                        soundlist = {('a', 'a'), ('a', 'E'), ('a', 'A'), ('a', 'O'), ('a', 'e'), ('a', 'at'),('aa', 'A'), ('b', 'bE'), ('b', 'bA'), ('b', 'be'), ('b', 'bi'), ('b', 'b'), ('b', 'B'), ('b', 'bo'), ('b', 'bu'), ('bb', 'ba'),('c', 'S'), ('c', 'k'), ('c', 'ke'), ('c', 'kE'), ('c', 'kA'), ('c', 'ko'), ('c', 'sI'), ('c', 'se'), ('c', 'ce'), ('c', 'cE'), ('c', 'cA'), ('c', 'cI'), ('c', 'ci'), ('c', 'c'), ('c', 'ko'), ('c', 'ku'), ('c', 'cA'), ('cc', 'k'), ('c', 's'),('c', 'sa'),('d', 'xE'), ('d', 'x'), ('d', 'xe'), ('d', 'xi'), ('d','xI'),('d','D'),('d', 'xA'), ('d', 'xo'), ('d', 'xu'), ('dd', 'x'), ('d', 'X'),('d','Xa'),('d','XI'),('e', 'I'), ('e', 'a'), ('e', 'E'), ('e', 'e'), ('e', 'i'), ('e', 'A'),('e', 'eM'), ('ee', 'I'), ('f', 'PE'), ('f', 'Pe'), ('f', 'PA'), ('f', 'Pi'), ('f', 'PI'), ('f', 'P'), ('f', 'Pa'), ('f', 'PU'), ('f', 'Po'), ('ff', 'fa'), ('g','g'),('g', 'ge'), ('g', 'j'),('g', 'go'), ('g', 'gE'), ('g', 'ga'), ('g', 'ja'), ('g', 'je'), ('g', 'Ga'), ('g', 'gA'), ('g', 'gi'), ('g', 'gu') , ('g', 'ji'), ('gg', 'g'), ('hy', 'hAi'),('hy', 'hAya'),('h', 'hE'), ('h', 'hI'), ('h', 'he'), ('h', 'hA'), ('h', 'hi'), ('h', 'hu'), ('h','Z'),('h', 'h'), ('h', 'ha'), ('h', 'ha'), ('i', 'Ai'), ('i', 'i'), ('ii', 'I'), ('i', 'I'),('j', 'jI'), ('j', 'ja'), ('j', 'ju'), ('j', 'j'), ('jj', 'j'), ('k', 'kA'), ('k', 'kI'), ('k', 'ki'), ('k', 'ko'), ('k', 'ni'), ('k', 'no'), ('kk', 'k'), ('k','ku'),('l', 'le'), ('l', 'lE'), ('l', 'lA'), ('l', 'la'), ('l', 'laY'), ('l', 'lI'), ('l', 'li'), ('l', 'lo'), ('l', 'l'), ('ll', 'la'), ('m', 'M'),('m', 'mE'), ('m', 'ma'), ('m', 'me'), ('m', 'maY'), ('m', 'mA'), ('m', 'mo'), ('m', 'mI'), ('m', 'm'), ('mm', 'm'),('n', 'ne'), ('n', 'nE'), ('n', 'N'),('n', 'nI'), ('n', 'n'), ('n', 'nA'), ('n', 'naY'),('n','M'),('nn', 'n'), ('o','or'),('o', 'o'), ('o', 'O'),('o','on'), ('o', 'oY'),('o', 'va'), ('o', 'A'), ('o', 'a'), ('oo', 'U'), ('o', 'U'), ('per', 'para'),('p','pe'), ('p', 'p'),('p', 'pI'), ('p', 'pE'), ('p', 'pa'), ('p', 'pA'), ('p', 'paY'), ('p', 'Pe'), ('p', 'Po'), ('p', 'Pi'), ('p', 'pi'), ('p', 'pO'), ('p', 'p'), ('p', 'sAI'), ('pp', 'pa'), ('q', 'k'),('r','r'), ('r', 'rE'), ('r', 'rA'), ('r', 're'), ('r', 'ra'), ('r', 'rI'), ('r','rk'),('rr', 'r'), ('s', 'se'), ('s', 'sE'), ('s', 'sa'), ('s', 'sA'), ('s', 'si'), ('s', 's'), ('s', 'su'), ('s', 'Se'), ('s', 'SA'), ('s', 'SI'), ('s', 'SI'), ('s', 'SaY'), ('th', 'W'),('t', 'tE'), ('t', 'te'), ('t', 'tA'), ('t', 'ti'), ('t', 'tI'),('t', 'S') ,('t', 'taY'), ('t', 't'), ('t', 'ta'), ('t', 'xe'), ('t', 'Wi'), ('tt','t'),('t', 'W'), ('t', 'WE'), ('t', 'w'),('u', 'u'),('u', 'U'), ('u', 'a'), ('u', 'yU'), ('u','ur'),('v', 'vE'), ('v', 'v'), ('v', 've'), ('v', 'vaY'), ('v', 'vA'),('v', 'vI'), ('v', 'vi'), ('v', 'vO'), ('w', 'vA'), ('w', 've'), ('w', 'vE'), ('w', 'vI'), ('w', 'vi'), ('w', 'va'), ('w', 'vu'), ('w', 'vU'), ('w', 'r'), ('x', 'eksa'),('x','ks'), ('y', 'yA'), ('y', 'yaY'), ('y', 'ya'), ('y', 'yi'), ('y', 'ye'), ('y', 'ya'), ('y', 'yo'), ('z', 'jZI'), ('z', 'jZa'), ('z', 'jZo') }

                        dictionary = defaultdict(list)
                        for key, value in soundlist:
                                dictionary[key].append(value)
                                dictitem = dictionary.items()
                        list1 = []
                        list2 = []
                        list3 = []
                        list4 = []
                        list5 = []
                        list6 = []
                        list7 = []
                        list8 = []
                        list9 = []
                        list10 = []
                        list11 = []


#			print eng , trns
                        for i in eng:
                                list2 = []
                                for key, value in dictitem:
                                                if i == key:
                                                        keys = (key,value)
                                                        list5.append(value)
                                              

                                                        for i,val in enumerate(trns):
                                                                        if val in value:
                                                                                list1.append(val)
                                                                                break

                                                        for i, val in enumerate(trns[:-1]):
                                                                value1 = trns[i:i+2]
                                                                value1 = ''.join(value1)
                                                                list2.append(value1)


                                                        break
#			print list2

                        listtemp = set([j for i in list5 for j in i]);
#			print
#			print listtemp
#			print 
                        for i in list2:
                                if i in listtemp:
                                     list8.append(i)
                        #print 'list8//////',list8

                        for i in trns:
                                list6.append(i)
                      #  print 'translate_word: ',list6

                        for i in eng:
                                list11.append(i)
                #       print 'english_word:', list11
			
#			print list11,len(list11) 
#			print list8 ,len(list8)
#			print
                        if len(list11) <= 4 and len(list8) >= 3:
                                list10.append(eng)

                                strr1 =  ''.join(str(x) for x in list10)
                                sre1 = strr1.replace(",","")
                                sre11 = sre1.replace("'","")
                                sre21 = sre11.replace(" ","")
                                sre31 = sre21.replace("[", "")
                                sre41 = sre31.replace("]", "")
                                trnslist.append(sre41)
#				print '*****',sre41
#				print "(eng_word-tran_word",  sre41, trns ,")"
#				print "1" ,list11, list8


			if len(list11) == 5 and len(list8) >= 4:
				list10.append(eng)

                                strr1 =  ''.join(str(x) for x in list10)
                                sre1 = strr1.replace(",","")
                                sre11 = sre1.replace("'","")
                                sre21 = sre11.replace(" ","")
                                sre31 = sre21.replace("[", "")
                                sre41 = sre31.replace("]", "")
                 		trnslist.append(sre41)
#		                print '*****',sre41
#				print "(eng_word-tran_word",  sre41, trns ,")"
#				print "2" ,list11, list8


	                if len(list11) == 6 and len(list8) >= 4:
        	                list10.append(eng)
	
        	                strr1 =  ''.join(str(x) for x in list10)
                	        sre1 = strr1.replace(",","")
                        	sre11 = sre1.replace("'","")
	                        sre21 = sre11.replace(" ","")
        	                sre31 = sre21.replace("[", "")
                	        sre41 = sre31.replace("]", "")
				trnslist.append(sre41)
#				print "(eng_word-tran_word",  sre41, trns ,")"
#                        	print '****',sre41
#				print "3" , list11, list8

	                if len(list11) == 7 and len(list8) >= 5:
        	                list10.append(eng)

                	        strr1 =  ''.join(str(x) for x in list10)
                        	sre1 = strr1.replace(",","")
	                        sre11 = sre1.replace("'","")
        	                sre21 = sre11.replace(" ","")
                	        sre31 = sre21.replace("[", "")
                        	sre41 = sre31.replace("]", "")
				trnslist.append(sre41)
#				print "(eng_word-tran_word",  sre41, trns ,")"
#	                        print '*****',sre41
#				print "4"

			if len(list11) == 8 and len(list8) >= 5:
				list10.append(eng)

                                strr1 =  ''.join(str(x) for x in list10)
                                sre1 = strr1.replace(",","")
                                sre11 = sre1.replace("'","")
                                sre21 = sre11.replace(" ","")
                                sre31 = sre21.replace("[", "")
                                sre41 = sre31.replace("]", "")
				trnslist.append(sre41)
#				print "(eng_word-tran_word",  sre41, trns ,")"
#				print "5"
				
 #                               print '*****',sre41

        	        if len(list11) == 9 and len(list8) >= 6:
                	        list10.append(eng)
	
        	                strr1 =  ''.join(str(x) for x in list10)
                	        sre1 = strr1.replace(",","")
                        	sre11 = sre1.replace("'","")
	                        sre21 = sre11.replace(" ","")
        	                sre31 = sre21.replace("[", "")
                	        sre41 = sre31.replace("]", "")
				trnslist.append(sre41)
#				print "(eng_word-tran_word",  sre41, trns ,")"
#				print "6"
	
#                        	print '*****',sre41


	                if len(list11) == 10 and len(list8) >= 7:
        	                list10.append(eng)



                	        strr1 =  ''.join(str(x) for x in list10)
                        	sre1 = strr1.replace(",","")
	                        sre11 = sre1.replace("'","")
        	                sre21 = sre11.replace(" ","")
                	        sre31 = sre21.replace("[", "")
                        	sre41 = sre31.replace("]", "")
	                	trnslist.append(sre41) 
#				print "(eng_word-tran_word",  sre41, trns ,")"
#				print "7"
			
#			        print '*****',sre41



        	        if len(list11) == 11 and len(list8) >=8:
                	        #print '11      Yes, This is transliterate Meaning '
                        	list10.append(eng)

	                        strr1 =  ''.join(str(x) for x in list10)
        	                sre1 = strr1.replace(",","")
                	        sre11 = sre1.replace("'","")
                        	sre21 = sre11.replace(" ","")
	                        sre31 = sre21.replace("[", "")
        	                sre41 = sre31.replace("]", "")
				trnslist.append(sre41)
#				print "(eng_word-tran_word",  sre41, trns ,")"
                	        #print '*****',sre41
#				print "8"

	                if len(list11) >= 12 and len(list8) >= 9:
        	                list10.append(eng)

                	        strr1 =  ''.join(str(x) for x in list10)
                        	sre1 = strr1.replace(",","")
	                        sre11 = sre1.replace("'","")
        	                sre21 = sre11.replace(" ","")
                	        sre31 = sre21.replace("[", "")
                        	sre41 = sre31.replace("]", "")
				trnslist.append(sre41)
#				print "(eng_word-tran_word",  sre41, trns ,")"
#				print "9"

#	                        print '*****',sre41




        	        a = list6
                	b = list5


	                list1 = list(zip(a, b))
#			print list1

        	        for  i in  list1:
                	        if i[0] in i[1]:
                        	        list7.append(i[0])

	                if len(list11) <= 4  and len(list7) >= 3:
        	                list9.append(eng)
                	        strr =  ''.join(str(x) for x in list9)
                        	sre = strr.replace(",","")
	                        sre1 = sre.replace("'","")
        	                sre2 = sre1.replace(" ","")
                	        sre3 = sre2.replace("[", "")
                        	sre4 = sre3.replace("]", "")
				trnslist.append(sre4)

	                        print "(eng_word-tran_word",  sre4, trns ,")"
#				print "10"

        	        if len(list11) == 5  and len(list7) >= 4:
                	        list9.append(eng)
                        	strr =  ''.join(str(x) for x in list9)
	                        sre = strr.replace(",","")
        	                sre1 = sre.replace("'","")
                	        sre2 = sre1.replace(" ","")
                        	sre3 = sre2.replace("[", "")
	                        sre4 = sre3.replace("]", "")
				trnslist.append(sre4)

 
        	                print "(eng_word-tran_word", sre4, trns , ")"
#				print "11"



                	if len(list11) == 6 and len(list7) >= 5:
                        	list9.append(eng)
	                        strr =  ''.join(str(x) for x in list9)
        	                sre = strr.replace(",","")
                	        sre1 = sre.replace("'","")
                        	sre2 = sre1.replace(" ","")
	                        sre3 = sre2.replace("[", "")
        	                sre4 = sre3.replace("]", "")
				trnslist.append(sre4)

                	        print "(eng_word-tran_word", sre4, trns , ")"
#				print "12"
                                             

	               	if len(list11) == 7 and len(list7) >= 6:
        	                list9.append(eng)
                	        strr =  ''.join(str(x) for x in list9)
                        	sre = strr.replace(",","")
	                        sre1 = sre.replace("'","")
        	                sre2 = sre1.replace(" ","")
                	        sre3 = sre2.replace("[", "")
                        	sre4 = sre3.replace("]", "")
				trnslist.append(sre4)


	                        print "(eng_word-tran_word", sre4, trns , ")"
#				print "13"

        	        if len(list11) == 8 and len(list7) >= 7:
                	        list9.append(eng)
                        	strr =  ''.join(str(x) for x in list9)
	                        sre = strr.replace(",","")
        	                sre1 = sre.replace("'","")
                	        sre2 = sre1.replace(" ","")
                        	sre3 = sre2.replace("[", "")
	                        sre4 = sre3.replace("]", "")
				trnslist.append(sre4)

        	                print "(eng_word-tran_word", sre4, trns , ")"
#				print "14"


                	if len(list11) == 9 and len(list7) >= 8:
                        	list9.append(eng)
	                        strr =  ''.join(str(x) for x in list9)
        	                sre = strr.replace(",","")
                	        sre1 = sre.replace("'","")
                        	sre2 = sre1.replace(" ","")
	                        sre3 = sre2.replace("[", "")
        	                sre4 = sre3.replace("]", "")
				trnslist.append(sre4)

                	        print "(eng_word-tran_word", sre4, trns , ")"
#				print "15"

			if len(list11) == 10 and len(list7) >= 8:
				list9.append(eng)
                                strr =  ''.join(str(x) for x in list9)
                                sre = strr.replace(",","")
                                sre1 = sre.replace("'","")
                                sre2 = sre1.replace(" ","")
                                sre3 = sre2.replace("[", "")
                                sre4 = sre3.replace("]", "")
				trnslist.append(sre4)
	
                                print "(eng_word-tran_word", sre4, trns , ")"
#				print "16"
	
			

	                if len(list11) == 11 and len(list7) >= 9:
        	                list9.append(eng)
                	        strr =  ''.join(str(x) for x in list9)
                        	sre = strr.replace(",","")
	                        sre1 = sre.replace("'","")
        	                sre2 = sre1.replace(" ","")
                	        sre3 = sre2.replace("[", "")
				sre4 = sre3.replace("]", "")
				trnslist.append(sre4)
				print "(eng_word-tran_word", sre4, trns , ")"
#				print "17"
                                                          

	                if len(list11) >=12 and len(list7) >= 10:
        	                list9.append(eng)
                	        strr =  ''.join(str(x) for x in list9)
                        	sre = strr.replace(",","")
	                        sre1 = sre.replace("'","")
        	                sre2 = sre1.replace(" ","")
                	        sre3 = sre2.replace("[", "")
                        	sre4 = sre3.replace("]", "")
				trnslist.append(sre4)

	                        print "(eng_word-tran_word", sre4, trns , ")"
#				print "18"


#print '-------',trnslist

list1 = []
list2 = []
list3 = []
for line1 in lines:
        lines_split1 = line1.split()
#	print lines_split1

        lines_split = []
        for item in lines_split1:
                lines_split.append(item.lower())
        list1.append(lines_split)

#print '=========',list1 

for item in list1:
#	print list1
#	for item1 in item:
#		if item1+'\n' in lines3:	
#			item.remove(item1)
	list3.append(item)
#print list3		




for line2 in lines2:
                lines2_split = line2.split()
                list2.append(lines2_split)


for x,y in zip(list3,list2):
        for i in x:
                for j in y:
                        transliteration(i,j)
