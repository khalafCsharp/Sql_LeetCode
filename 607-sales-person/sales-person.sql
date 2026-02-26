/* Write your T-SQL query statement below */

With Table_cte AS 
(
    Select o.order_id,s.name AS salesman,c.name As com_name
    From SalesPerson AS s
    Left Join Orders as o
    On o.sales_id = s.sales_id
    Left Join Company As c
    On o.com_id = c.com_id
)

Select name 
From SalesPerson
--Where name Not In 
Except  --slightly better in test cases
(Select salesman As name
From Table_cte
Where com_name = 'RED')
