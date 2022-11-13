/* find the two actors who were cast together the most */

WITH top_pair AS (SELECT fa1.actor_id AS id1, 
                    fa2.actor_id AS id2,
                    COUNT(fa1.film_id)
                 FROM film_actor AS fa1
                 JOIN film_actor AS fa2
                    ON fa1.film_id = fa2.film_id -- in the same film
                 WHERE fa1.actor_id <> fa2.actor_id -- not using pairs of the same actor
                 GROUP BY fa1.actor_id, fa2.actor_id
                 ORDER BY COUNT(fa1.film_id) DESC -- the number of films they were in
                 LIMIT 1)
                 -- this CTE is the pair of actors with the most collabs (7)
                 
SELECT (SELECT CONCAT(first_name, ' ', last_name)
       FROM actor
       WHERE actor_id = tp.id1) AS first_actor,
      (SELECT CONCAT(first_name, ' ', last_name)
      FROM actor
      WHERE actor_id = tp.id2) AS second_actor,
      title

FROM top_pair AS tp
JOIN film_actor AS fa1
  ON tp.id1 = fa1.actor_id
JOIN film_actor AS fa2
  ON tp.id2 = fa2.actor_id
JOIN film AS f
  ON fa1.film_id = f.film_id AND fa2.film_id = f.film_id
  
ORDER BY title ASC;



/* my much longer answer lol */

WITH full_data AS (SELECT a.actor_id AS actor_id, 
              CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
              f.film_id AS film_id,
              f.title AS title
             
            FROM film_actor AS fa
            JOIN actor AS a
              ON fa.actor_id = a.actor_id
            JOIN film AS f
              ON fa.film_id = f.film_id 
        ),
    actor_pairs AS (SELECT f1.actor_name AS first_actor, 
                    f2.actor_name AS second_actor,
                    f1.title
              FROM full_data AS f1
              JOIN full_data AS f2
              ON f1.film_id = f2.film_id
              WHERE f1.actor_id < f2.actor_id
    ),
    pair_count AS (SELECT first_actor, second_actor, COUNT(*)
                  
              FROM actor_pairs
              GROUP BY first_actor, second_actor
              ORDER BY COUNT(*) DESC
              LIMIT 1) -- SO NOW WE HAVE THE ACTORS WHO HAVE WORKED 2GETHER THE MOST!!
              -- Julia McQueen and Henry Berry have collab'd 7 times (wow)


SELECT DISTINCT pc.first_actor, pc.second_actor, ap.title
FROM actor_pairs AS ap
JOIN pair_count AS pc
  ON ap.first_actor = pc.first_actor AND ap.second_actor = pc.second_actor
--GROUP BY pc.first_actor, pc.second_actor
ORDER BY title ASC

