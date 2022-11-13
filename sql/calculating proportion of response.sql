/* Find the rate of processed tickets for each type. */

SELECT type,
    SUM(CASE WHEN processed = TRUE THEN 1 ELSE 0 END) :: NUMERIC / --counting all the processed complaints
        COUNT(*) AS processed_rate -- divided by all the complaints
FROM facebook_complaints
GROUP BY type

