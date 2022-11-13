/* idk why i did this lol */

CREATE FUNCTION east_or_west (
	@long DECIMAL(9,6) -- parameters
)
RETURNS CHAR(4) AS -- RETURNS datatype
BEGIN
	DECLARE @return_value CHAR(4);
	SET @return_value = 'same';
    IF (@long > 0.00) SET @return_value = 'east';
    IF (@long < 0.00) SET @return_value = 'west';
 
    RETURN @return_value
END;


/* to use it inside a query: */

SELECT dbo.east_or_west(0) AS argument_0, 
       dbo.east_or_west(-1) AS argument_minus_1, 
       dbo.east_or_west(1) AS argument_plus_1;

-- it'll return one row with three columns

SELECT *, 
	dbo.east_or_west(city.long) 
	-- runs the function for every longitude in every row
FROM city;


/* returning a table from a function: */

CREATE FUNCTION east_from_long (
	@long DECIMAL(9,6)
)
RETURNS TABLE AS -- returning a table
RETURN
	SELECT *
	FROM city
	WHERE city.long > @long; -- 
	
	
/* using a function-returned table in a query */

SELECT *
FROM east_from_long(0.00);
-- returns * from city where city.long > 0.00

