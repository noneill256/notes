student_tuples = [('john', 'A', 15), ('jane', 'B', 12), ('dave', 'B', 10)]

# key specifies a function to be called on each element before sorting
sorted(student_tuples, key=lambda student: student[2])   # sort by age, since it's [2] in each student
"""
function = lambda student # student is the function parameter
           return student[2]
"""
# result:
# [('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]

""" codewars problem:
There is a planet... in a galaxy far far away. It is exactly like our planet, but it has one difference: #The values of the digits 3 and 7 are twisted. Our 3 means 7 on the planet Twisted-3-7. And 7 means 3.

Your task is to create a method, that can sort an array the way it would be sorted on Twisted-3-7.

7 Examples from a friend from Twisted-3-7:

[1,2,3,4,5,6,7,8,9] -> [1,2,7,4,5,6,3,8,9]
[12,13,14] -> [12,14,13]
[9,2,4,7,3] -> [2,7,4,3,9]

"""

def sort_twisted37(arr):
           twisted = lambda n: int(''.join('3' if c=='7' else '7' if c == '3' else c for c in str(n)))
                    # for c in str(n) (with n as the parameter):
                       # if c == '7':
                            # join '3'
                       # if c == '3':
                            # join '7'
                       # else:
                            # join c
                    # the join is run on each element that will make up
                    # a new array, in this case the array that is
                    # returned at the end of the function
           
           res = sorted(arr, key=twisted)
                       # twisted is run for every element n of arr
                       # so it's basically a loop
           return res
  
