/* For this challenge you need to create a RECURSIVE Hierarchical query. 
You have a table employees of employees, you must order each employee by level. 
You must use a WITH statement and name it employee_levels after that has been defined you must select from it.

A Level is in correlation what manager managers the employee. e.g. an employee with a manager_id of NULL is 
at level 1 and then direct employees with the employee at level 1 will be level 2. */

WITH RECURSIVE employee_levels as (
  SELECT  1 AS level, id, first_name, last_name, manager_id
          -- first level: 1
  FROM employees
  WHERE manager_id IS NULL -- the first step
                           -- the highest ranking person doesn't have a mgr
  UNION ALL
  SELECT l.level + 1, e.id, e.first_name, e.last_name, e.manager_id
          -- prints ALL of a given manager id with the same level
          -- when it moves on to the next manager id, then level increases
  FROM employee_levels AS l
  JOIN employees AS e
    ON l.id = e.manager_id
            )

SELECT *
FROM employee_levels

/* first few rows of results:

level	id	first_name	last_name	manager_id
1	1	Darrin	Nikolaus	
2	2	Roberto	Dach	1
2	3	Jeffrey	Mueller	1
2	16	Berneice	Johns	1
2	17	Emilio	Turcotte	1
3	4	Burma	Gutmann	2
3	5	Jeanmarie	Quitzon	2
3	6	Racheal	Rath	2
3	7	Kenneth	Cruickshank	3
3	9	Debby	Kling	3
... ... ... ...

*/
