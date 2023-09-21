select E.name, b.bonus
from employee E left join Bonus b ON
E.empId= b.empId
where b.bonus <1000 or b.bonus IS NULL
