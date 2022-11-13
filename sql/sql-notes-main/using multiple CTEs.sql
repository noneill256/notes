-- find all movies in which both actor-id = 105 and actor-id = 122 were cast TOGETHER!! both of them
WITH sidney AS ( -- all movies with sidney crowe
            SELECT f.title, f.film_id, a.actor_id

            FROM film AS f
            JOIN film_actor AS fa
              ON f.film_id = fa.film_id
            WHERE a.actor_id = 105),

salma AS ( -- all movies with salma nolte
            SELECT f.title, f.film_id, a.actor_id

            FROM film AS f
            JOIN film_actor AS fa
              ON f.film_id = fa.film_id
            WHERE a.actor_id = 122)

SELECT sidney.title

FROM sidney
JOIN salma 
  ON sidney.film_id = salma.film_id
-- all the movies in which only one actor was cast (but not the other) are dropped in the inner join

ORDER BY title ASC;



/* this isn't actually the best way to solve the problem though :I
   time for a TANGENT; see below: */
   
SELECT f.title

FROM film AS f
JOIN film_actor AS fa
  ON f.film_id = fa.film_id
WHERE fa.actor_id IN (105, 122) -- where the actor_id is either one of the two
GROUP BY f.film_id
HAVING COUNT(*) = 2 -- where both of the actors are accounted for

ORDER BY title ASC;

   
   
