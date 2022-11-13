import pygal

animals = ['rodents', 'label', 'cats', 'isopods']
values = [{'value': 4, 'label': 'soft and round :3'},
		  {'value': 4, 'label': 'my best friends'},
		  {'value': 2, 'label': 'my BESTEST friends fr'},
		  {'value': 10, 'label': 'ok these r epic'}
		  ]
# these HAVEEE to say 'value' and 'label' ok?

chart = pygal.Bar(x_label_rotation=45, show_legend=False)
chart.title = 'Pets Owned'
chart.x_labels = animals

chart.add('', values)
chart.render_to_file('pets_owned.svg')
