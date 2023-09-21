-- Write a solution to find for each date the number of different products sold and their names.
-- The sold products names for each date should be sorted lexicographically.
-- Return the result table ordered by sell_date.

select sell_date, count(distinct product) as num_sold, 
GROUP_CONCAT(distinct product ORDER BY product ASC) AS products
from activities
group by sell_date
order by sell_date
