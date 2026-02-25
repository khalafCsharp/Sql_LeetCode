/* Write your T-SQL query statement below */

Select e.name,b.bonus
From Employee As e
Left Join Bonus As b
On e.empId = b.empId
Where b.bonus <1000 Or b.bonus is null