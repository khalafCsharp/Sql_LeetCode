/* Write your T-SQL query statement below */

With AllId_cte As 
(
    Select requester_id As id From RequestAccepted
    Union All
    Select accepter_id From RequestAccepted
)

Select Top 1 id,
        Count(id) As num
From AllId_cte
Group By id
Order By Count(id) Desc