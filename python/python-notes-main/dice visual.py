import pygal
from die import Die

# create 2 D6 dice.
d1 = Die()
d2 = Die()

# Make some rolls, and store results in a list
results = []
for roll_num in range(1000):
	result = d1.roll() + d2.roll()
	results.append(result)

# Analyze the results
frequencies = []
max_result = d1.num_sides + d2.num_sides
for value in range(2, max_result + 1): # from 2 to 12
	frequency = results.count(value) # the frequency of each result 2 to 12
	frequencies.append(frequency)
	
# Visualize the results
hist = pygal.Bar()

hist.title = "results of rolling two D6 dice 1000 times"
hist.x_labels = [str(i) for i in range(2, max_result+1)]
# ['2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
hist.x_title = "result"
hist.y_title = "frequency of result"

hist.add('D6 + D6', frequencies)
hist.render_to_file('dice_visual.svg')
# 7 is the most common result because there are six ways to roll a 7