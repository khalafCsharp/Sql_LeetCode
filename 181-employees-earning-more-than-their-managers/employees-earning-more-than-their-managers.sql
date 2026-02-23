/* Write your T-SQL query statement below */


Select regularEmployee.name As Employee
From Employee As regularEmployee
Inner Join Employee As manager
On regularEmployee.managerId = manager.id
Where regularEmployee.salary > manager.salary