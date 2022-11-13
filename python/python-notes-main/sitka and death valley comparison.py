import csv # allows python to parse csv lines
from matplotlib import pyplot as plt
from datetime import datetime

filename = 'death_valley_2014.csv'
with open(filename) as f:
	dvreader = csv.reader(f) # all the data! as a reader object
	header_row = next(dvreader)
	# next() returns the next line in the file when passed the reader object
	
	dvdates, dvhighs, dvlows = [], [], []
	# The reader object continues from where it left off in the csv file
	# and automatically returns each line following its current position
	
	for row in dvreader:
		# each time we examine a row, we try to extract the date and temps.
		try:
			current_date = datetime.strptime(row[0], '%Y-%m-%d')
			high = int(row[1])
			low = int(row[3])
		# if any data is missing, raises a ValueError, and handles it by
		# printing an error message that includes the date of the missing data
		except ValueError:
			print(current_date, 'missing date')
		# after printing, the loop continues processing the next row
		else:			
			dvdates.append(current_date)
			dvhighs.append(high)
			dvlows.append(low)

filename = 'sitka_weather_2014.csv'			
with open(filename) as f:
	reader = csv.reader(f) # all the data! as a reader object
	header_row = next(reader)
	# next() returns the next line in the file when passed the reader object
	
	dates, highs, lows = [], [], []
	# The reader object continues from where it left off in the csv file
	# and automatically returns each line following its current position
	for row in reader:
		current_date = datetime.strptime(row[0], '%Y-%m-%d')
		dates.append(current_date)
		
		highs.append(int(row[1]))
	# the second column (index 1) is the date's max temperature
	# so we're extracting the second column from each row.
		
		lows.append(int(row[3]))

# Plot data
fig = plt.figure(dpi=128, figsize=(10, 6))
plt.plot(dvdates, dvhighs, c='orange', alpha=0.5, linewidth=2)
plt.plot(dvdates, dvlows, c='red', alpha=0.5, linewidth=2)
plt.fill_between(dvdates, dvhighs, dvlows, facecolor='yellow', alpha=0.1)
# and now sitka
plt.plot(dates, highs, c='green', alpha=0.5, linewidth=2)
plt.plot(dates, lows, c='purple', alpha=0.5, linewidth=2)
plt.fill_between(dates, highs, lows, facecolor='blue', alpha=0.2)


# Format plot
plt.title('Daily high and low temperatures - 2014\nDeath Valley', fontsize=20)
plt.xlabel('', fontsize=16)
fig.autofmt_xdate()
# ^ fig.autofmt_date() draws the date labels diagonally to avoid them
# getting crowded
plt.ylabel('Temperature (F)', fontsize=16)
plt.tick_params(axis='both', which='major', labelsize=16)

plt.show()