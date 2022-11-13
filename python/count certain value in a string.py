"""
In a string, remove every word that has only one ! in it.
"""

def remove(s):
    res = []
    for i in s.split(' '): # splitting the sentence into a list
        if i.count('!') != 1: # if there isn't only one ! in the word
            res.append(i) # add the acceptable word to the list
    return  ' '.join(res) # convert the list to a string with spaces in between
