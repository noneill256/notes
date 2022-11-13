from random import choice
import matplotlib.pyplot as plt

class RandomWalk():
	""" A class to generate random walks. """    
	def __init__(self, num_points=5000):
		""" Initialize attributes of a walk. """        
		self.num_points = num_points		   
		self.x = [0]        
		self.y = [0]    
	
	def get_step(self):        
		# Decide which direction to go in and how far        
		direction = choice([1, -1])        
		distance = choice([0, 5, 10])        
		step = direction * distance        
		
		return step        
	
	def fill_walk(self):
		""" Calculate all points in the walk """        
		# Keep taking steps until the walk reaches the desired length.        
		while len(self.x) < self.num_points:
			x_step = self.get_step()            
			y_step = self.get_step()            
			
			next_x = self.x[-1] + x_step            
			next_y = self.y[-1] + y_step            
			
			# Reject moves that go nowhere            
			if next_x == 0 and next_y:                
				continue			   
			
			self.x.append(next_x)            
			self.y.append(next_y)
    
           

# Make a random walk, and plot the points
rw = RandomWalk()
rw.fill_walk()

# Set the size of the plotting window.
plt.figure(figsize=(10,7))
# These numbers are in inches.
    
# We'll use a colormap to show the order of the
# points in the walk
plt.plot(rw.x, rw.y, c='pink')

# Emphasize the first and last points
plt.scatter(0, 0, c='green')
plt.scatter(rw.x[-1], rw.y[-1], c='red')
  
    
# Make sure to insert the code just before the call
# so it's drawn on top of all the other points.
plt.show()



