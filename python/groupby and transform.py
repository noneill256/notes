# https://towardsdatascience.com/when-to-use-pandas-transform-function-df8861aa0dcf

df = pd.DataFrame({'Animal': ['Falcon', 'Falcon',

                              'Parrot', 'Parrot'],

                   'Max Speed': [380., 370., 24., 26.]})
df
"""   
   Animal  Max Speed
0  Falcon      380.0
1  Falcon      370.0
2  Parrot       24.0
3  Parrot       26.0
"""

df.groupby(['Animal']).mean()
"""        Max Speed
Animal
Falcon      375.0
Parrot       25.0
"""

### Transform:
# We can pass a function to the function in transform(). For example:

df = pd.DataFrame({'A': [1,2,3], 
                   'B': [10,20,30] })

def plus_10(x):
    return x+10

  df.transform(plus_10) # applying the function to the dataframe
  
# (You can also use a list of functions instead of just one o_o)
df.transform([np.sqrt, np.exp])


"""
EXAMPLE:
Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.
"""                              # grouping by department      the averages of the salaries
employee['avg_salary'] = employee.groupby(['department'])['salary'].transform('mean')

result = employee[['department', 'first_name', 'salary', 'avg_salary']]
result
