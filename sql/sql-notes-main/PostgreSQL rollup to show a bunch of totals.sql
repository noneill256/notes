/* So. This question is stupid. 
It asks for the total revenue for each date. However, the results want, for example, just in the month of January:
The revenue for January 1st, 2nd, etc... and then the whole total for all of January! */
                                

SELECT p.name AS product_name, 
  EXTRACT(YEAR FROM s.date)::int AS year,
  EXTRACT(MONTH FROM s.date)::int AS month, 
  EXTRACT(DAY FROM s.date)::int AS day,
  SUM(p.price*sd.count) AS total
-- calculate the total revenue for each day, month, year, and product

FROM products AS p
FULL OUTER JOIN sales_details AS sd
  ON p.id = sd.product_id
FULL OUTER JOIN sales AS s
  ON s.id = sd.sale_id

GROUP BY name, rollup(year, month, day)

ORDER BY p.name, year, month, day;
