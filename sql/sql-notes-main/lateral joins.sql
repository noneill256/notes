/* write a query, which uses a LATERAL join, that returns two most viewed posts for every category.

Order the result set by:

 1.   category name alphabetically
 2.   number of post views largest to lowest
 3.   post id lowest to largest

Note:
    Some categories may have less than two or no posts at all.
    Two or more posts within the category can be tied by (have the same) the number of views. Use post id as a tie breaker - a post with a lower id gets a higher rank.
*/

SELECT c.id AS category_id, category, title, p.views, post_id
      -- the left join includes categories that have no posts, and thus have NULL titles
      -- using c's id instead of p's category_id makes sure the category id is still shown :)
FROM categories AS c
LEFT OUTER JOIN LATERAL (
  SELECT id AS post_id, category_id, title, posts.views
  
  FROM posts
  WHERE c.id = category_id
        -- for every category...
  ORDER BY posts.views DESC, posts.id ASC
  LIMIT 2) AS p
  ON c.id = p.category_id
ORDER BY category ASC, p.views DESC, p.post_id ASC


