import sys
if len(sys.argv) < 2:
    print(":::Wrong parameter file name is missing:::")
    sys.exit(1)
else:
    en_to_dev={
        'A': 'e',
        'B': 'bI',
        'C': 'sI',
        'D': 'dI',
        'E': 'I',
        'F': 'eP',
        'G': 'jI',
        'H': 'eca',
        'I': 'AI',
        'J': 'je',
        'K': 'ke',
        'L': 'ela',
        'M': 'ema',
        'N': 'ena',
        'O': 'o',
        'P': 'pI',
        'Q': 'kyu',
        'R': 'Ara',
        'S': 'esa',
        'T': 'tI',
        'U': 'yu',
        'V': 'vI',
        'W': 'dabalyu',
        'X': 'eksa',    
        'Y': 'vAI',
        'Z': 'jZeda',    
    }
    with open(sys.argv[1], 'r') as inF:
        first = inF.read(1)
        if not first:
            print ("file is empty")
        else: 
            inF.seek(0)  
            for line in inF:
                for j in line.split():
                    newWord=[''.join([en_to_dev[ch] for ch in j])][0]
                    print "(eng_word-hin_word %s\t%s)"% (j, newWord)
