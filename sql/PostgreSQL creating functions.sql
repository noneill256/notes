/* For this challenge you need to create a basic Age Calculator function which calculates the 
age in years on the age field of the peoples table.

The function should be called agecalculator, it needs to take 1 date and calculate the age in 
years according to the date NOW and must return an integer. */


CREATE FUNCTION agecalculator(d DATE)
RETURNS INT
LANGUAGE PLPGSQL
AS
$$
-- DECLARE whatever you need here... INT or w.e ;
BEGIN
  RETURN EXTRACT(year FROM AGE(d));
    -- the AGE function returns an interval - includes years, days, whatever
    -- EXTRACT(year...) returns just the year of the interval
END;
$$;

