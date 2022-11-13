/* Your company has an internal policy to determine your customers' credit limit, but this procedure has been questioned recently by the board 
as being too conservative.

Your CEO wants to increase the current customer base credit limits in order to upsell a new line of products. In order to do that, the company 
hired several external consultancies to produce new credit limit estimates.

The problem is that each agency has produced the report in its own format. Some use the format "First-name Last-name" to identify a person, 
others use the format "Last-name, First-name". There is also no consensus on how to capitalize each word, so some used all uppercase, others 
used all lowercase, and some used mixed-case.

Internally, the data is structured as follows:

Table: customers
================
id: INT
first_name: TEXT
last_name: TEXT
credit_limit: FLOAT

The data you've received from all agencies was consolidated in the following table:

Table: prospects
================
full_name: TEXT
credit_limit: FLOAT

Keep in mind that the agencies had access only to a partial customer base. There is also the possibility of more than one agency prospecting the same customer, 
so it's highly likely that there will be duplicates. Finally, they've prospected customers that were not in your customer base as well.
For this task you are interested in the prospected customers that are already in your customer base and the prospected credit limit is higher than your 
internal estimate. When more than one agency prospected the same customer, chose the highest estimate.

You have to produce a report with the following fields:

first_name
last_name
old_limit [the current credit_limit]
new_limit [the highest credit_limit found]

Notes:
    only list the customers that a higher credit limit was found.

*/

WITH no_prefix AS ( -- removing the prefix
  SELECT full_name,
    UPPER(REPLACE(
    CASE
      WHEN LEFT(UPPER(full_name), 5) IN ('MRS. ', 'MISS ') -- listing them 2gether cuz they both have 5 characters
        THEN RIGHT(full_name, LENGTH(full_name) - 5) -- removes the first 5 characters
      WHEN LEFT(UPPER(full_name), 4) IN ('MR. ', 'MS. ', 'MRS ', 'DR. ')
        THEN RIGHT(full_name, LENGTH(full_name) - 4)
      WHEN LEFT(UPPER(full_name), 3) IN ('MR ', 'MS ', 'DR ')
        THEN RIGHT(full_name, LENGTH(full_name) - 3)
      ELSE full_name 
      END, ',', '')) AS pros_name, -- removes any commas in the name
    credit_limit
    FROM prospects),

no_suffix AS (
  SELECT TRIM(BOTH FROM -- trimming trailing whitespace
    CASE
      WHEN RIGHT(pros_name, 4) IN (' DDS', ' PHD', ' JR.', ' SR.', ' III', ' DVM')
        THEN LEFT(pros_name, LENGTH(pros_name) - 4)
      WHEN RIGHT(pros_name, 3) IN (' II', ' IV', ' MD')
        THEN LEFT(pros_name, LENGTH(pros_name) - 3)
      WHEN RIGHT(pros_name, 2) IN (' I', ' V')
        THEN lEFT(pros_name, LENGTH(pros_name) - 2)
      ELSE pros_name
    END) AS full_name,
    credit_limit
  FROM no_prefix
  ) -- okay so now the prefixes and suffixes have been removed.. hahahaha
  
SELECT first_name,
       last_name,
       c.credit_limit AS old_limit,
       MAX(GREATEST(p_fl.credit_limit, p_lf.credit_limit)) AS new_limit

FROM customers AS c
LEFT JOIN no_suffix AS p_fl -- drops the names that have been reversed with a comma
  ON p_fl.full_name = UPPER(CONCAT(c.first_name, ' ', c.last_name))
  AND p_fl.credit_limit > c.credit_limit
LEFT JOIN no_suffix AS p_lf -- now we join the names that have the last name first... observe
  ON p_lf.full_name = UPPER(CONCAT(c.last_name, ' ', c.first_name))
  AND p_lf.credit_limit > c.credit_limit
WHERE COALESCE(p_fl.credit_limit, p_lf.credit_limit) IS NOT NULL -- where there's a credit limit
GROUP BY first_name, last_name, c.credit_limit
ORDER BY first_name, last_name

/* a much shorter answer joins the two tables with a where statement
checking that the concatenated first and last names are in the full names
but doing this many concatenations in a join is super slow
:(
*/

