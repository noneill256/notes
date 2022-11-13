SELECT w.id, p.age, w.coins_needed, w.power
-- id, age, coins_needed, power of wands Ron's interested in. we need the minimum number 
-- of coins_needed to buy each non-evil wand of high power and age

FROM Wands AS w
JOIN Wands_Property AS p
ON w.code = p.code
WHERE p.is_evil = 0 
/* there can be multiple wands of the same power AND age of different costs!! */
    AND w.coins_needed = (SELECT MIN(coins_needed)
                       FROM Wands AS w1
                       JOIN Wands_Property AS p1
                       ON w1.code = p1.code
                       WHERE w1.power = w.power AND p1.age = p.age)

ORDER BY w.power DESC, p.age DESC;
