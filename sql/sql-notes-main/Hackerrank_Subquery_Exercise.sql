/* print the ids + names of hackers who got full scores more than once */

SELECT h.hacker_id, h.name

FROM Hackers AS h
JOIN Submissions AS sub
    ON sub.hacker_id = h.hacker_id
JOIN Challenges AS ch
    ON sub.challenge_id = ch.challenge_id
JOIN Difficulty AS diff
    ON diff.difficulty_level = ch.difficulty_level
    
WHERE sub.score = diff.score 
    AND ch.difficulty_level = diff.difficulty_level -- full score if sub.score = diff.score

GROUP BY h.hacker_id, h.name

HAVING COUNT(sub.hacker_id) > 1 -- for hackers who achieved full scores for more than one challenge

ORDER BY COUNT(sub.hacker_id) DESC, h.hacker_id ASC;
