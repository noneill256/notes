/* This exercise is bonkers. Create a view that returns customers who have spent over
$1000 in total. Only include spending that was done in departments that have received
over $10,000 in revenue.
  
You need to CREATE a View, then SELECT it to show data for the unit tests.
Your solution needs to have these required fields (in this order): ID, Name, Email, Total_spending
"total_spending" is NOT the total spending of the member. It is "total amount spent by a member on 
  those departments which have total sales of more than $10,000.
 */

CREATE VIEW members_approved_for_voucher AS
    SELECT s.member_id AS id, m.name AS name, m.email AS email, -- member information
           SUM(p.price) AS total_spending -- all the money that the given member has spent
    
    FROM sales AS s
    JOIN products AS p
      ON s.product_id = p.id
    JOIN members AS m
      ON s.member_id = m.id
    JOIN (SELECT departments.id AS id, SUM(products.price) AS total_sales -- the total income for EACH DEPARTMENT
         FROM departments                    
         JOIN sales
          ON departments.id = sales.department_id
         JOIN products
            ON sales.product_id = products.id
         GROUP BY departments.id, departments.name
         HAVING SUM(products.price) > 10000) AS dept_sales -- only joining depts w enough sales
                                                 -- sales from other depts are dropped in the join
      ON dept_sales.id = s.department_id
    
    GROUP BY s.member_id, m.name, m.email -- grouping by member
    HAVING SUM(p.price) > 1000 -- members that have spent over $1000
    
    ORDER BY s.member_id ASC;
    
SELECT *
FROM members_approved_for_voucher;

