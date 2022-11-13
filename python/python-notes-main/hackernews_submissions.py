import requests
import pygal
from operator import itemgetter

# Make an API call and store the response
url = 'https://hacker-news.firebaseio.com/v0/topstories.json'
r = requests.get(url)
print('status code:', r.status_code)

# Process informatio abt each submission
submission_ids = r.json()
submission_dicts = []
for submission_id in submission_ids[:30]: # looping through top 3 submissions
	# Make a separate API call for each submission
	url = ('https://hacker-news.firebaseio.com/v0/item/' + str(submission_id) + '.json')
	# a url for each submission id
	submission_r = requests.get(url)
	print(submission_r.status_code)
	response_dict = submission_r.json()
	
	submission_dict = {
		'title': response_dict['title'],
		'link': 'http://news.ycombinator.com/item?id=' + str(submission_id),
		'comments': response_dict.get('descendants', 0)
		} # when you're not sure if a key exists in a dictionary, use the
			# dict.get() method, which returns the value associated with
			# the given key if it exists, or the value you provide if the key
			# doesn't exist -- 0 in this case
	submission_dicts.append(submission_dict)
	
submission_dicts = sorted(submission_dicts, key=itemgetter('comments'), reverse=True)
			# itemgetter pulls the value associated with the key from each
			# dictionary in the list
			# sorted then sorts by the key 
titles, comments = [], []
for submission_dict in submission_dicts:
	titles.append(submission_dict['title'])
	comments.append(submission_dict['comments'])
	print('\nTitle:', submission_dict['title'])
	print('Dicussion link:', submission_dict['link']),
	print('Comments:', submission_dict['comments'])   
	
# Make a bar chart showing the most active discussions :D
chart = pygal.Bar()
chart.x_label_rotation = 45
chart.show_legend = False
chart.title = 'Most active comment sections on Hacker News'
chart.x_labels = titles

chart.add('', comments)
chart.render_to_file('hacker_news_bar_chart.svg')