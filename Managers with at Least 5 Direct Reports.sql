Select name from employee 
where id IN
(select managerId
from employee 
group by managerId
having count(managerId)>=5)
