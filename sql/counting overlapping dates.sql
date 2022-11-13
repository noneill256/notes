/* Your task is to create a SQL query which returns the maximum number of simultaneous uses of a service. 
Each usage ("visit") is logged with its entry and exit timestamps in a "visits" table structured as follows:

id          primary key
entry_time  timestamp of visit start
exit_time   timestamp of visit end

A visit starts at entry time and ends at exit time. At exactly exit time the visit is considered to have 
already finished. The visits table always contains at least one entry. Your query should return a single 
row, containing the following columns:
when_happened -- earliest timestamp when there were visits_count concurrent visits
visits_count  -- maximum count of overlapping visits

*/

SELECT v1.entry_time AS when_happened, count(*) AS visits_count

FROM visits AS v1
JOIN visits AS v2
  ON v1.entry_time >= v2.entry_time
  AND v1.entry_time < v2.exit_time -- entry time is between the visit time of another row
                                   -- joining v2 rows with v1 rows that have an entry time b/w v2's visit times
GROUP BY v1.id
ORDER BY visits_count DESC, when_happened ASC -- sort by when_happened since there could be multiple rows
                                              -- with the same number of visit counts
LIMIT 1;

