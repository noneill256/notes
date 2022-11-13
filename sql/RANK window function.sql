/* Rank guests based on the number of messages they've exchanged with the hosts. 
Guests with the same number of messages as other guests should have the same rank. 
Do not skip rankings if the preceding rankings are identical.

Output the rank, guest id, and number of total messages they've sent. 
Order by the highest number of total messages first. */

select 
    DENSE_RANK() OVER (ORDER BY SUM(n_messages) DESC
        ) AS ranking,
       -- if we just used RANK(), it would skip rankings (1, 3, 3, 4, 5...) instead of (1, 2, 2, 3, 4...) etc.
       -- but they both have the same syntax!
    id_guest, SUM(n_messages) AS sum_n_messages
    
FROM airbnb_contacts
GROUP BY id_guest
ORDER BY sum_n_messages DESC;

