/*
Given the schema presented below write a query, which uses a window function, that returns two most viewed posts for every category.

Order the result set by:
    category name alphabetically
    number of post views largest to lowest
    post id lowest to largest

Note:
    Some categories may have less than two or no posts at all.
    Two or more posts within the category can be tied by (have the same) the number of views. Use post id as a tie breaker - a post with a lower id gets a higher rank.
*/

WITH top_2 AS (SELECT c.id AS category_id, c.category, p.title, 
               p.views,
               ROW_NUMBER() OVER (PARTITION BY c.id ORDER BY p.views DESC) AS rn,
               p.id AS post_id 
      
              FROM categories AS c
              LEFT JOIN posts AS p   --left join because there's one category with no post
                ON c.id = p.category_id
              ORDER BY c.category ASC, p.views DESC, p.id ASC
              ) /* in this cte, the posts are partitioned by category.
                   you can see all the posts partitioned while also ordered by views */
              
SELECT category_id, category, title, views, post_id
FROM top_2
WHERE rn <= 2; --just selecting the posts with the top 2 ranks of views

/*
The results should look like this:

category_id | category | title                             | views | post_id
------------+----------+-----------------------------------+-------+--------
5           | art      | Most viewed post about Art        | 9234  | 234
5           | art      | Second most viewed post about Art | 9234  | 712
2           | business | NULL                              | NULL  | NULL
7           | sport    | Most viewed post about Sport      | 10    | 126

*/


