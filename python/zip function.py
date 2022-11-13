def goodVsEvil(good, evil):

    points_good = [1, 2, 3, 3, 4, 10]
    points_evil = [1, 2, 2, 2, 3, 5, 10]
    
    good = good.split() # list of string numbers
    evil = evil.split()
    
    good = sum([int(x)*y for x, y in zip(good, points_good)])
              # zip(good, points_good) (if good and evil are just 1's) ->
                      # ((1, 1), (1, 2), (1, 3), (1, 3), (1, 4), (1, 10))
        # summing for x, y in zip(good, points_good)
            # 1*1 + 1*2 + 1*3 ...
    evil = sum([int(x)*y for x, y in zip(evil, points_evil)])

    result = 'Battle Result: '
    
    if good < evil:
        return result +'Evil eradicates all trace of Good'
    elif good > evil:
        return result + 'Good triumphs over Evil'
    else:
        return result + 'No victor on this battle field'
      
      
