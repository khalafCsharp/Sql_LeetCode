/* Write your T-SQL query statement below */

With ToBeDeletedEmails_cte As 
(
    Select id,
            email,
            Row_Number() Over(Partition By email Order By id Asc) As rank
    From Person
)
Delete From ToBeDeletedEmails_cte
Where rank != 1 ;