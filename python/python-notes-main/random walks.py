from random import choice
import matplotlib.pyplot as plt

class RandomWalk():
    """ A class to generate random walks. """
    def __init__(self, num_points=50000):
        """ Initialize attributes of a walk.
            Default points = 50000 """
        self.num_points = num_points

        # All walks start at (0, 0)
        self.x = [0]
        self.y = [0]
        
    def fill_walk(self):
        """ Calculate all points in the walk. """

        # Keep taking steps until the walk reaches
        # the desired length.
        while len(self.x) < self.num_points:
            # Decide which direction to go in and how far
            x_direction = choice([1, -1])
            # chooses 1 or -1 randomly, etc.
            x_distance = choice([0, 1, 2, 3, 4, 5])
            x_step = x_direction * x_distance

            y_direction = choice([1, -1])
            y_distance = choice([0, 1, 2, 3, 4, 5])
            y_step = y_direction * y_distance

            # Reject moves that go nowhere
            if y_step == 0 and x_step == 0:
                continue
                # returns to beginning of loop

            # Calculate the next x and y values
            next_x = self.x[-1] + x_step
            next_y = self.y[-1] + y_step

            self.x.append(next_x)
            self.y.append(next_y)

# Keep making new walks, as long as the program is active
while True:
    # Make a random walk, and plot the points
    rw = RandomWalk()
    rw.fill_walk()

    # Set the size of the plotting window.
    plt.figure(figsize=(10,7))
    # These numbers are in inches.
    
    # We'll use a colormap to show the order of the
    # points in the walk
    point_numbers = list(range(rw.num_points))
    # [0 ... 5000]
    plt.scatter(rw.x, rw.y, c=point_numbers, s=15)

    # Emphasize the first and last points
    plt.scatter(0, 0, c='green', s=100)
    plt.scatter(rw.x[-1], rw.y[-1], c='red', s=100)
  
    
    # Make sure to insert the code just before the call
    # so it's drawn on top of all the other points.
    plt.show()

    

    keep_running = input('Make another walk? (y/n): ')
    if keep_running == 'n':
        break


