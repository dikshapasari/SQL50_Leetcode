-- Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null.

select
(select distinct Salary 
from Employee order by salary desc 
limit 1 offset 1) 
as SecondHighestSalary;
