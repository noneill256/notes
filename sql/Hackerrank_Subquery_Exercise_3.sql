/* Julia asked her students to create some coding challenges. Write a query to print the hacker_id, 
name, and the total number of challenges created by each student. Sort your results by the total number of 
challenges in descending order. If more than one student created the same number of challenges, then sort the 
result by hacker_id. If more than one student created the same number of challenges and the count is less than 
the maximum number of challenges created, then exclude those students from the result. */

SELECT ch.hacker_id, h.name, COUNT(ch.hacker_id) AS c_count
-- hacker_id, name, total # of challenges created by each student

FROM Hackers AS h
JOIN Challenges AS ch
ON h.hacker_id = ch.hacker_id
GROUP BY ch.hacker_id, name
             
/* having a challenge count equal to... */
HAVING c_count = (SELECT MAX(temp1.cnt)
                 FROM (SELECT COUNT(hacker_id) AS cnt
                       FROM Challenges
                       GROUP BY hacker_id
                       ORDER BY hacker_id) AS temp1)
                 /* the max number of challenges. we can have more than 1 of these */
                 
    /* or counts without any duplicates */
    OR c_count IN (SELECT temp2.cnt
                   FROM (SELECT COUNT(hacker_id) AS cnt
                         FROM Challenges
                         GROUP BY hacker_id) AS temp2
                   GROUP BY temp2.cnt
                   HAVING COUNT(temp2.cnt) = 1)
                       
-- if more than one student created the same # of challenges, and the count < MAX(#),
-- exclude those students from result

ORDER BY c_count DESC, ch.hacker_id ASC;
