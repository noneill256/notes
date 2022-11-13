from random import randint
import pygal
from die import Die

die = Die()

# Make some rolls, and store results in a list
results = []
for roll_num in range(500):
	result=die.roll()
	results.append(result)

# The frequencies of each result
frequencies = []
for value in range(1, die.num_sides+1):
	frequency = results.count(value)
	frequencies.append(frequency)


# Visualize the results with a histogram.
hist = pygal.Bar()
# This is just creating a blank histogram with no data for now

hist.title = "Results of rolling D6 1000 times."
hist.x_labels = ['1,' '2,' '3', '4', '5', '6']
hist.x_title = "Result"
hist.y_title = "Freq of Result"

# Now we add the values to the histogram
hist.add('D6', frequencies)
hist.render_to_file('die_visual.svg')
# IT CREATES AN INTERACTIVE CHART HOLY FUCK





