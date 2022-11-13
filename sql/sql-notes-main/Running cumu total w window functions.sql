/* Given a posts table that contains a created_at timestamp column write a query that returns date (without time component), 
a number of posts for a given date and a running (cumulative) total number of posts up until a given date. The resulting set 
should be ordered chronologically by date.

The resulting set should look similar to the following:

date       | count | total
-----------+-------+-------
2017-01-26 |    20 |    20
2017-01-27 |    17 |    37
2017-01-28 |     7 |    44
2017-01-29 |     8 |    52
*/

SELECT p1.created_at::date AS date, 
      COUNT(p1.*) AS count,
      (SUM(COUNT(p1.*)) OVER (
                             ORDER BY p1.created_at::date))::integer AS total

FROM posts AS p1
GROUP BY p1.created_at::date

ORDER BY date;
