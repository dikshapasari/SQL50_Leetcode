/* Approach
In this scenario, we want to identify each department's top 3 highest salaried employees. To achieve this, we'll utilize the DENSE_RANK() window function, which works similar to ROW_NUMBER() but with a slight difference in handling tied values. DENSE_RANK() assigns the same rank to rows with identical ORDER_BY values, ensuring that we can have multiple employees with the same salary but still rank them appropriately.

Here are the steps we will follow:
Partition by Department: We will partition our dataset by the departmentid column. This means that DENSE_RANK() will reset its ranking for each department, treating them as separate groups.
Order by Salary (Descending): Next, we will order the rows within each department by salary in descending order. This ensures that employees with the highest salaries receive the lowest DENSE_RANK() values within their respective departments.
Apply DENSE_RANK(): Finally, we will apply the DENSE_RANK() function to assign a rank to each employee within their department based on their salary. Since we've partitioned by department and ordered by salary, employees with the same salary will receive the same rank.

By doing this, we can easily identify the top 3 highest salaried employees in each department, as their DENSE_RANK() values will be 1, 2, and 3 within their respective departments.
This approach ensures that tied values (employees with the same salary) are handled correctly while still allowing us to determine the highest earners within each department */

Select t.department as department, t.employee as employee, t.salary as salary
from
(select d.name as department, e.name as employee, e.salary as salary,
DENSE_RANK() OVER (PARTITION BY departmentid ORDER BY salary DESC) AS row_num
from employee e
join department d ON
e.departmentid = d.id) as t
where t.row_num <=3
