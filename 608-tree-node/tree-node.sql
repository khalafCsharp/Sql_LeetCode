/* Write your T-SQL query statement below */

With ParentIds_cte AS
(
    Select Distinct p_id As parentId
    From Tree
    Where p_id is not null
)


Select  id,
        Case 
        When p_id is null Then 'Root'
        When id Not In (Select * From ParentIds_cte) Then 'Leaf'
        Else 'Inner'
        End As type
From Tree
