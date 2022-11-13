/* You need to create a function that calculates the number of weekdays (Monday through Friday) between two dates inclusively.

The function should be named weekdays accept two arguments of type DATE and return an INTEGER value.
weekdays(DATE, DATE) INTEGER

The order of arguments shouldn't matter. To illustrate both of the following queries
SELECT weekdays('2016-01-01', '2016-01-10');
SELECT weekdays('2016-01-10', '2016-01-01');

should produce the same result */

CREATE FUNCTION weekdays (
      d1 DATE,
      d2 DATE
    )
RETURNS INTEGER
AS
$$
  
  SELECT COUNT(*) FILTER (WHERE EXTRACT(dow FROM g.d) BETWEEN 1 AND 5)::int AS weekdays
  -- where the day of week is from monday to friday (sunday is 1, saturday is 6)
  -- i guess d of g is the date of the series we generated.....???
  FROM generate_series(least(d1, d2), greatest(d1, d2), interval '1 day') AS g(d);

$$
LANGUAGE SQL;

