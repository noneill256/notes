import json
from countries import get_country_code
from pygal.maps.world import World

# Load the data into a list
filename = 'population_data.json'
with open(filename) as f:
	pop_data = json.load(f)
	
# Build a dictionary of population data
cc_populations= {}
for pop_dict in pop_data:
	if pop_dict['Year'] == '2010':
		country_name = pop_dict['Country Name']
		population = int(float(pop_dict['Value']))		
		# float takes care of numbers with decimals in them
		code = get_country_code(country_name)
		if code == None:
			print('error', country_name)
		else:
			cc_populations[code] = population
		# ^ filling the dictionary!

wm = World()
wm.title = 'World population in 2010, by country'
wm.add('2010', cc_populations)

wm.render_to_file('world_population.svg')