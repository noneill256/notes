import csv
from countries import get_country_code
from pygal.maps.world import World

"""
Write a program that generates a dictionary with Pygal’s two-letter country codes
as its keys and your chosen data from the file as its values. Plot the data on a
Worldmap and style the map as you like.
"""

file = 'slum_populations.csv'
with open(file) as f:
	reader = csv.reader(f)
	header_row = next(reader)
	
	# country, population, country_code = [], [], []
	cc_populations = {}
	for row in reader:
		cc = get_country_code(row[0])
		if row[2] and cc: # if the population isn't NA and we have a code
			cc_populations[cc] = int(float(row[2])) * 1000000
			
wm = World() # blank world map
wm.title = 'Population of people living in slums, 2018'
wm.add('2018', cc_populations)

wm.render_to_file('slum_populations.svg')