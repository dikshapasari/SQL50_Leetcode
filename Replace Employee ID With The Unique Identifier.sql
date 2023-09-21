select EU.unique_id, E.name
from employees as E left join employeeUNI as EU 
ON E.id = EU.id
