"""
You are going to be given a word. Your job is to return the middle character of the word. If the word's length is odd, return the middle character. If the word's length is even, return the middle 2 characters.

#Examples:

Kata.getMiddle("test") should return "es"

Kata.getMiddle("testing") should return "t"

Kata.getMiddle("middle") should return "dd"

Kata.getMiddle("A") should return "A"
"""

def get_middle(s):
    x = len(s) 
    y = int(x/2) # rounds down
    if x%2==0: # if the string has an even number of characters
        print(s[y-1:y+1]) # doesn't actually print s[y+1], just s[y-1] and s[y]
        return s[y-1:y+1]
    else:
        print(s[y])
        return s[y]
