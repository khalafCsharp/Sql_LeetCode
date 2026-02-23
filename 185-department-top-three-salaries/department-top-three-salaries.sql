/* Write your T-SQL query statement below */

With Employees_cte As 
(
    Select *,
        Dense_Rank() Over(Partition By departmentId Order By salary Desc) salaryRankWithinDepartments
        From Employee
)
Select d.name As Department,
        e.name As Employee,
        e.salary As Salary
From Employees_cte As e
Inner Join Department As d
On e.departmentId = d.id
Where salaryRankWithinDepartments <4 ;