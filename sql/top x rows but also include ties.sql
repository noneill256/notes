/* lol
Find the top 5 states with the most 5 star businesses. Output the state name along with the number of 
5-star businesses and order records by the number of 5-star businesses in descending order. 
In case there are ties in the number of businesses, return all the unique states. 
If two states have the same result, sort them in alphabetical order. */

-- OK so basically if you only LIMIT 5, it will exclude a state that also has a value in the top 5 number of businesses
-- so we want everything with a rank of 5 or higher

WITH fstars AS (SELECT state,
                count(business_id) AS n_businesses
                FROM yelp_business
                WHERE stars = 5
                GROUP BY state)
           -- the number of 5 star businesses for every state
            
SELECT state, n_businesses, rnk

FROM (
    SELECT *,
        rank() OVER (ORDER BY n_businesses DESC) AS rnk
    FROM fstars) AS a
    -- this is a table of the cte that also creates ranks for them
WHERE rnk <= 5
ORDER BY n_businesses DESC,
    state ASC
    
    
