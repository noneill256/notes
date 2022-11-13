from die import Die
import pygal

# Create a D6 and a D10
d1 = Die()
d2 = Die(10)

# Make some rolls, and store results in a list
results = []
for roll_num in range(50000):
	result = d1.roll() + d2.roll()
	results.append(result)

# Analyze the results
frequencies = []
max_result = d1.num_sides + d2.num_sides
for value in range(2, max_result + 1):
	frequency = results.count(value)
	frequencies.append(frequency)

# Visualize the results
hist = pygal.Bar()

hist.title = "result of rolling a D6 and a D10 50,000 times"
hist.x_labels = [str(i) for i in range(2, max_result+1)]
hist.x_title = "result"
hist.y_title = "frequency of result"

hist.add('D6 + D10', frequencies)
hist.render_to_file('diff_dice_visual.svg')