/* return all prime numbers smaller than 100 */

SELECT a.n AS prime

FROM generate_series(2, 100) AS a(n) -- table a with variable n

-- not divisible by any number other than 1 and itself
-- if you % it by any other number you should NOT get 0
WHERE NOT EXISTS ( -- % = 0
      SELECT 1
      FROM generate_series(2, a.(n-1)) AS b(n) -- table b with variable n 
            -- dividing a.n by every non-1 number less than a.n to check that there's a remainder
            -- if there is a remainder, return 1
      WHERE a.n % b.n = 0)
-- if it returns 1, remove that a.n from the results
