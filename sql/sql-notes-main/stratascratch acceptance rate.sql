/* What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date 
the request was sent. Order by the earliest date to latest.

Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user 
(i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table 
logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.
*/

WITH sent AS (SELECT * FROM fb_friend_requests WHERE action = 'sent'),
  -- every friend request as it's sent
    accepted AS (SELECT * FROM fb_friend_requests
                WHERE action = 'accepted')
  -- every friend request that was actually requested

SELECT sent.date, 
    COUNT(accepted.user_id_receiver)/CAST(
    COUNT(sent.user_id_sender) AS decimal)
    -- grouping by date, the number of receivers who accepted the
    -- request, divided by the requests sent
FROM sent
LEFT JOIN accepted
    ON sent.user_id_sender = accepted.user_id_sender
    AND accepted.user_id_receiver = sent.user_id_receiver
    -- joined together, this shows every request sent and whether
    -- or not it was accepted (hence the LEFT join, which includes
    -- requests sent but not accepted)
GROUP BY sent.date

