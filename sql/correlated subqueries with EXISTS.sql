/* return all the departments that have had sales of over $98. Use EXISTS */

SELECT d.* 
FROM departments d
WHERE EXISTS (SELECT s.department_id FROM sales s WHERE s.price>98 and s.department_id=d.id);

-- we're just using the list of depts as our first source
-- then we take all the sales with the one department we're looking at;
    -- that's what the s.dep_id = d.id is for!
-- we're just looking at !!one dept at a time!! in the sales table.
-- returns all the >$98 sales in that given department
-- the outer query retrieves the dept name that matches the returned dept id

