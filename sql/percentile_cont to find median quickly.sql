/* find the min, median, and max of the scores */

SELECT MIN(score),
       CAST(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY score) AS FLOAT) AS median,
       MAX(score)

FROM result;

