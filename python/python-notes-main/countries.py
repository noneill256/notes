""" The mapping tool in Pygal expects data in a particular format:
	Countries need to be provided as country codes and populations as values.
	The codes included in this dataset are 3-letter codes, but pygal uses
	2-letter codes. We need a way to find the 2-digit code from the country
	name. """
from pygal.maps.world import COUNTRIES
""" COUNTRIES is a dictionary with the 2-letter country codes and their
	corresponding country names as values. """

def get_country_code(country_name):
	for code, name in COUNTRIES.items():
		if name == country_name:
			return code
	return None
