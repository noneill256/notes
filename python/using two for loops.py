print(
  [[a, b] for a in range(0, 4)
	        for b in range(0, 3)]
  # can put a condition here, like if a + b != some number
)

"""
ORDER OF EXECUTION:
a = 0
then loops through b
b = 0, 1, 2
[0,0], [0,1], [0,2]

goes back to a
a = 1
b = 0, 1, 2
[1,0], [1,1], [1,2]

a = 2
b = 0, 1, 2
[2,0], [2,1], [2,2]

a = 3
b = 0, 1, 2
[3,0], [3,1], [3,2]

RESULTS:
[[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2], [3, 0], [3, 1], [3, 2]]
"""
