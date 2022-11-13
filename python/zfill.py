# string.zfill(x) adds 0s at the beginning of a string until it reaches the length of x.
# also, you can use a parameter in rstrip() to specify which characters to remove from the right side of a string.
"""
Your job is to write a function which increments a string, to create a new string.

    If the string already ends with a number, the number should be incremented by 1.
    If the string does not end with a number. the number 1 should be appended to the new string.

Examples:
foo -> foo1
foobar23 -> foobar24
foo0042 -> foo0043
foo9 -> foo10
foo099 -> foo100

Attention: If the number has leading zeros the amount of digits should be considered.
"""

def increment_string(strng):
    head = strng.rstrip('0123456789') # removes the numbers from the right side of the string
    tail = strng[len(head):] # the rest of the string
    if tail == "": # if there are no numbers at the end of the string
      return strng+"1"
    else:
      return head + str(int(tail) + 1).zfill(len(tail))
# turning tail into an integer removes the zeros at its beginning, but zfil replaces them    
    
    
