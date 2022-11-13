import matplotlib.pyplot as plt

x = list(range(1001))
y = [i**2 for i in x]

plt.scatter(x, y, c=y, cmap=plt.cm.Blues, edgecolor='none')
# it makes a blue gradient along the line!

# You can see all the colormaps available in
# pyplot at http://matplotlib.org/
# Go to Examples, scroll down to Color Examples,
# and click colormaps_reference.

plt.show()
