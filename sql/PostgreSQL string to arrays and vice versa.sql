/* use this to go through strings word by word ! */

/* name
Greyson Tate Lebsack Jr.
Elmore Clementina O'Conner

you will be provided with a full name and you have to return the name in columns as follows.
 name           first_lastname    	second_lastname
Greyson Tate   Lebsack     	        Jr.
Elmore 	        Clementina        	O'Conner

Note: Don't forget to remove spaces around names in your result. Note: Due to multicultural context, if full name has more than 3 words, consider first 2 as name */

SELECT
  array_to_string(name[1:len-2], ' ') AS name, -- 3. the array back to a string. ' ' is the separator
                                               -- if there are 4 items (words) in the array (name),
                                               -- it gets the first 2 words. otherwise, just the 1st
  name[len-1]                         AS first_lastname, -- the second to last word
  name[len]                           AS second_lastname -- the last word
FROM (
  SELECT
    name, -- 2. the names that are now arrays
    array_length(name, 1) AS len -- the length of the name arrays
  FROM (
    SELECT
      string_to_array(name, ' ') AS name -- 1. turn names into arrays 
                                         -- since it's an array, each word is its own item.
    FROM people
  ) AS arr
) AS arr_and_len
