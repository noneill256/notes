/* select all departments which had sales of prices over 90 */

WITH special_sales AS
  (select * from sales where price > 90)
  
SELECT id, name 
FROM departments
WHERE id IN (SELECT department_id FROM special_sales)
