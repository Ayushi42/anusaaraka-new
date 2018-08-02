#Programme to find whether source and target word are transliterate word or not. If its a transliterate word then we get the shortest path that matched the target word.
#Written by Roja(10-07-17)
#RUN:: python trans_single.py  eng  hnd  Sound-list.txt  out
#OUTPUT: out
###########################################################################

import sys
import networkx as nx

eng_lst = []
hnd_lst = []
sound_lst = []
sound_dic = {}
graph_dict = []
index = 0

for line in open(sys.argv[1]): #eng sentences (or eng left over wrds)
	eng_lst = line.strip().split()

for line in open(sys.argv[2]): #hindi sentences (or hnd left over wrds)
	hnd_lst = line.strip().split()

for line in open(sys.argv[3]): #Sound dictionary
	sound_lst = line.strip().split('\t')
	sound_dic[sound_lst[0]] = sound_lst[1]

#Storing graph output
g_file = open(sys.argv[4], "w")


#function to get graph b/w src and tgt:
def transliterate(eng, hnd):
	pos = 0
	for each in sound_dic.keys():
		if each in eng:
			start_pos =  eng.index(each) + 1
			end_pos = start_pos + len(each)  
			if end_pos > pos: #Storing last index of a word 
				pos = end_pos
			tup =  (start_pos, end_pos, 1)
			val = sound_dic[each].split('/')
			for item in val:
				if item in hnd:
#					print each + '\t' + item + '\t' + str(start_pos) + ' ' + str(end_pos)
					if tup not in graph_dict:
						graph_dict.append(tup)
	return pos

#Checking each word in src with each wrd in target lang.
#If transliterate word found then printing its shortest path or else printing NO PATH
for eng_item in eng_lst:
	for hnd_item in hnd_lst:
		graph_dict = []
		#call transliteration function
		index = transliterate(eng_item.lower(), hnd_item)
#		print graph_dict, index
		 
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
			#print index
		        output= nx.shortest_path(GG,1,int(index))
		        g_file.write('%s\t%s\t%s\n' % (eng_item, hnd_item, output))
			print '(eng_word-tran_word\t' + eng_item + '\t' +  hnd_item + ' )'
			#print 'Shortest path'  , output
		except:
		        g_file.write("%s\t%s\tNO PATH\n" % (eng_item, hnd_item))
			#print 'NO PATH'
