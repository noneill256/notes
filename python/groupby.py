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
