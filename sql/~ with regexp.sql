text ~ regex -> boolean
  string matches regular expression, case sensitive
  'thomas' ~ 't.*ma' -> TRUE
 
text ~* regex
  string matches, case insensitive
  'thomas' ~* 'T.*ma' -> TRUE
 
text !~ regex
  string does not match regular expression, case sensitive
  'thomas' !~ 't.*max' -> TRUE
  
text !~* regex
  string does not match, case insensitive
  'thomas' !~* 'T.*ma' -> FALSE
  

    | denotes alternation (either of two alternatives).

    * denotes repetition of the previous item zero or more times.

    + denotes repetition of the previous item one or more times.

    ? denotes repetition of the previous item zero or one time.

    {m} denotes repetition of the previous item exactly m times.

    {m,} denotes repetition of the previous item m or more times.

    {m,n} denotes repetition of the previous item at least m and not more than n times.

    Parentheses () can be used to group items into a single logical item.

    A bracket expression [...] specifies a character class, just as in POSIX regular expressions.


/* *** EXAMPLE *** */
Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut. 
To make it more simple, look only for singular form of the mentioned aromas.

Output unique winery values only. */


SELECT DISTINCT winery 
FROM winemag_p1
WHERE lower(description) ~ '\y(plum|cherry|rose|hazelnut)\y'
              -- the \y makes it so that we don't include words that have, for example, 'rose' in the middle
              -- like 'prosecco'.
              
              
