select customer_id, count(count_no_trans) as count_no_trans
from(
  select v.customer_id, count(t.transaction_id) as count_no_trans
  from visits as v left join transactions as t
  on v.visit_id = t.visit_id
  group by v.visit_id
  having count(t.transaction_id) = 0
) AS subquery
group by customer_id
