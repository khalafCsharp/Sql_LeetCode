/* Write your T-SQL query statement below */

Select Distinct p.project_id,
  Round( Avg(Cast(e.experience_years As Decimal(10,2))) Over(Partition By project_id),2) As average_years
From Project As p
Left Join Employee As e
On p.employee_id = e.employee_id