/* You are given a table named repositories, format as below:

** repositories table schema **
    project
    commits
    contributors
    address

The table shows project names of major cryptocurrencies, their numbers of commits and contributors and also a random donation address.
Your job is to split out the letters and numbers from the address provided, and return a table in the following format:

** output table schema **
    project
    letters
    numbers

Case should be maintained.*/

SELECT project,
       regexp_replace(address, '[^A-Za-z]', '', 'g') AS letters,
          -- [^letters] : replace anything but those letters
          -- 'g': global replacement
          -- so this function replaces everything except for letters with '' - nothing.
       regexp_replace(address, '[^0-9]', '', 'g') AS numbers
          -- replaces everything except for numbers with nothing
FROM repositories;

/* 

GO HERE FOR REGULAR EXPRESSION REFERENCES:
https://en.wikibooks.org/wiki/Regular_Expressions/POSIX-Extended_Regular_Expressions

https://www.postgresqltutorial.com/postgresql-string-functions/postgresql-regexp_matches/

*/

