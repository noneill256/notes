/* Given a table of purchases by date, calculate the month-over-month percentage 
change in revenue. The output should include the year-month date (YYYY-MM) and percentage 
change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.

The percentage change column will be populated from the 2nd month forward and can be calculated as 
((this month's revenue - last month's revenue) / last month's revenue)*100.*/

select year_month,
    ROUND((revenue_month - 
        (LAG(revenue_month, 1) OVER (ORDER BY year_month ASC))) / 
    LAG(revenue_month, 1) OVER (ORDER BY year_month ASC)*100,2)
    -- rounding:
    -- the current month's revenue minus the previous month's revenue
    -- divided by the previous month's revenue, times 100, rounded to 2 places
FROM (
/* sum all the revenue over each month */
    select to_char(created_at,'yyyy-mm') as year_month, 
        -- converts to 'yyyy-mm'
    sum(value) as revenue_month
    from sf_transactions
    group by year_month
    order by year_month ) AS m
    -- now we have all the revenue for each month
    
