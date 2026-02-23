/* Write your T-SQL query statement below */

With Employees_cte As 
(
    Select *,
        Max(salary) Over(Partition By departmentId) As HighestSalaryInDepartment
    From Employee
)
Select d.name As Department,
        e.name As Employee,
        e.salary As Salary
From Employees_cte As e
Inner Join Department As d
On e.departmentId = d.id
Where e.salary = e.HighestSalaryInDepartment;
