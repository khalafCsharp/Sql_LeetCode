/* Write your T-SQL query statement below */
With Managers_cte As 
(
Select managerId,
        Count(managerId) As NumberOfEmployees
From Employee
Group By managerId
Having Count(managerId)>4
)

Select e.name As name
From Managers_cte As m
Inner Join Employee As e
On m.managerId = e.id