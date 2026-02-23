/* Write your T-SQL query statement below */


Select Customers.name As Customers
From Customers 
Left Join Orders 
On Customers.id = Orders.customerId
Where Orders.customerId Is Null;
