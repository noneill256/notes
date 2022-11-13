import matplotlib.pyplot as plt

x = [1, 2, 3, 4, 5]
y = [1, 4, 9, 16, 25]
plt.scatter(x, y, s=100)
# s: point size

# set chart title and label axes
plt.title("square numbers", fontsize=20)
plt.xlabel("value", fontsize=14)
plt.ylabel("square of value", fontsize=14)

# set size of tick labels
plt.tick_params(axis='both', which='major', labelsize=14)
# axis: which axis to apply the parameters to
# which: apply arguments to which ticks

plt.show()
