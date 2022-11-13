import matplotlib.pyplot as plt

x = list(range(1, 1001))
y = [i**2 for i in x] # a loop!
# calculating the square of x

plt.scatter(x, y, c='pink', s=5)
# can also use rgb-ish values like
# c = (0, 0, 0.8)
# the range of each value goes from 0 to 1.

plt.axis([0, 1100, 0, 1100000])
# the range of the axes

plt.show()
