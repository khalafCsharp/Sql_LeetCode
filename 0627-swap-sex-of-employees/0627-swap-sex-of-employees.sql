/* Write your T-SQL query statement below */

Update Salary
Set sex = Case sex
When 'm' Then 'f'
When 'f' Then 'm'
End ;

