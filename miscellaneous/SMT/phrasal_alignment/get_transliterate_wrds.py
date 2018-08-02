#Programme to find whether source and target word are transliterate word or not. If its a transliterate word then we get the shortest path that matched the target word.
#Written by Roja(13-07-17)
#RUN:: python get_transliterate_wrds.py  eng  hnd  Sound-list.txt  out > transliterate.txt
#OUTPUT: out file contains path if found or else NO PATH if not transliterate wrd
#	 transliterate.txt file contains all the words that are transliterate in src and tgt
#############################################################################################
import sys
import networkx as nx

eng_lst = []
hnd_lst = []
sound_lst = []
sound_dic = {}
dic = {}
graph_dict = []
index = 0
max_key_len = 0
pos = 0
hlen = 0

for line in open(sys.argv[1]): #eng sentences (or eng left over wrds)
	eng_lst = line.strip().split()

for line in open(sys.argv[2]): #hindi sentences (or hnd left over wrds)
	hnd_lst = line.strip().split()

#Sound dictionary
for line in open(sys.argv[3]):
	sound_lst = line.strip().split('\t')
	sound_dic[sound_lst[0]] = sound_lst[1]
        if len(sound_lst[0]) > max_key_len:
                max_key_len = len(sound_lst[0])

#Storing graph output
g_file = open(sys.argv[4], "w")


#func to get sound dic in tgt:
def check_sound_in_tgt(lst, hnd, wrd, tup):
	l = 0
	for each in lst:
		if each in hnd:
			l = len(each)
			if tup not in graph_dict:
				graph_dict.append(tup)
				dic[tup] = l

def check_sound_in_src(eng, index, pos, hnd):
	start_pos = index + 1
	end_pos =  index + len(eng) + 1
	if end_pos > pos: #Storing last index of a word
		pos = end_pos
	tup =  (start_pos, end_pos, 1)
	val = sound_dic[eng].split('/')
	check_sound_in_tgt(val, hnd, eng, tup)
	return pos

def check_transliterate(eng_wrd, hnd_wrd):
  pos = 0
  dic = {}	
  for i in range(0, len(eng_wrd)):
	if len(eng_wrd[i:i+max_key_len]) == max_key_len:
		if  eng_wrd[i:i+max_key_len] in sound_dic.keys():
			wrd = eng_wrd[i:i+max_key_len]
			pos = check_sound_in_src(wrd, i, pos, hnd_wrd)
	if len(eng_wrd[i:i+max_key_len-1]) == max_key_len-1:
		if  eng_wrd[i:i+max_key_len-1] in sound_dic.keys():
			wrd = eng_wrd[i:i+max_key_len-1]
			pos = check_sound_in_src(wrd, i, pos, hnd_wrd)
	if len(eng_wrd[i:i+max_key_len-2]) == max_key_len-2:
		if  eng_wrd[i:i+max_key_len-2] in sound_dic.keys():
			wrd = eng_wrd[i:i+max_key_len-2]
			pos = check_sound_in_src(wrd, i, pos, hnd_wrd)
  return pos

#print sorted(graph_dict), pos
  
  
for eng in eng_lst:
	for hin in hnd_lst:
		graph_dict = []
		hlen = 0
		dic = {}
		index = check_transliterate(eng.lower(), hin)
# 		print eng, hin 
		#Usage of Multigraph
		MG = nx.MultiGraph()
		MG.add_weighted_edges_from(graph_dict)
		
		#Converting Multigraph to normal graph
		GG=nx.Graph()
		for n,nbrs in MG.adjacency_iter():
			for nbr,edict in nbrs.items():
		               minvalue=min([d['weight'] for d in edict.values() ])
		               GG.add_edge(n,nbr, weight = minvalue)
		try:
			output= nx.shortest_path(GG,1,int(index))
			for i  in range(0, len(output)-1):
				t = (output[i] , output[i+1], 1)
				hlen = hlen + dic[t]
#			print output, hlen, len(hin), dic
			if hlen == len(hin) or hlen-1 == len(hin): #Ex: association	asosIeSana, Lodha	loDZA
			#if hlen == len(hin) : #Ex: association	asosIeSana, Lodha	loDZA
				g_file.write('%s\n' % output)
#		        	print 'Shortest path'  , output
				print '(eng_word-tran_word\t' + eng + '\t' +  hin + ' )'
			else:
				g_file.write("NO PATH\n")
		except:
			        g_file.write("NO PATH\n")
