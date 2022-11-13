/* pivot that same product/detail schema, but without crosstab. */

SELECT p.name, 
      COUNT(
            CASE WHEN detail = 'good' THEN 1
            END) AS good,
      -- just returns a 1 if the detail is 'good'
      -- we're counting how many 1's are returned
      COUNT(
            CASE WHEN detail = 'ok' THEN 1
            END) AS ok,
      COUNT(
            CASE WHEN detail = 'bad' THEN 1
            END) AS bad

FROM products AS p
JOIN details AS d
  ON p.id = d.product_id
GROUP BY p.name
ORDER BY p.name ASC

/* ORRRRRRR YOU COULD USE THE POSTGRES FILTER FEATURE!!! */

SELECT p.name, 
      COUNT(d.id) FILTER (WHERE d.detail = 'good') AS good,
      COUNT(d.id) FILTER (WHERE d.detail = 'ok') AS ok,
      COUNT(d.id) FILTER (WHERE d.detail = 'bad') AS bad
FROM products AS p
JOIN details AS d
  ON p.id = d.product_id
GROUP BY p.name
ORDER BY p.name ASC


