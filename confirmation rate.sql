select s.user_id, IFNULL(subquery.confirmation_rate, 0) as confirmation_rate
from signups s left join
(select c.user_id, round(SUM(case when c.action = 'timeout' then 0 ELSE 1 end)/count(c.action), 2) as confirmation_rate
from confirmations c
group by c.user_id) as subquery
on s.user_id = subquery.user_id
