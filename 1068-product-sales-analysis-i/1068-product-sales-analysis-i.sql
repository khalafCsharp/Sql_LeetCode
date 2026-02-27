/* Write your T-SQL query statement below */

Select  p.product_name, s.year, s.price
From Sales As s
Left Join Product As p
On s.product_id = p.product_id