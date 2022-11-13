# a population increases every year by the formula p0 + (p0 * percent/100) + aug
# how many years does it take for the initial population p0 to reach the target population p?

def nb_year(p0, percent, aug, p):
    years = 0
    while p0 < p: # you CAN alter the parameters of functions. i'm dumb
        p0 = int(p0*(1 + percent/100)) + aug  # int rounds down, since you can't have half a person lol
        t += 1
    return years
