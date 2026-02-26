/* Write your T-SQL query statement below */
    With T_cte As 
    (
        Select num
        From MyNumbers
        Group By num
        Having Count(num) =1
    )

    Select Max(num) As num 
    From T_cte