name = 'Noah ONeill'
text = '.'.join(w[0] for w in name.split()).upper() # name.split = ['Noah', 'ONeill']
                                                    # w of 0 [0] = 'N'
                                                    # w of 1 [0] = 'O'
           # join() combines the two w values with a . in between
print(text) # prints 'N.O'
