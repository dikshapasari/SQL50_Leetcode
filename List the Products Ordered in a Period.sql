-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

select p.product_name, sum(o.unit) as unit
from orders o join products p ON
o.product_id = p.product_id
where o.order_date >= '2020-02-01' AND o.order_date <= '2020-02-29'
group by p.product_name
having sum(o.unit)>= 100
