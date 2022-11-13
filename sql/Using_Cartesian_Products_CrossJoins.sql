SELECT IF(Grade < 8, NULL, Name), Grade, Marks
-- students whose grade > 8
    -- ELSE Name is NULL
FROM Students AS st
CROSS JOIN Grades AS gr -- creates a Cartesian product (every possible combination)
WHERE Marks BETWEEN Min_Mark AND Max_Mark -- filtering through all those results
ORDER BY Grade DESC, Name ASC, Marks ASC;

/* https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true */
