/* Write your T-SQL query statement below */
With Table_cte As 
(
Select player_id, event_date As first_login,
    Row_Number() Over(Partition By player_id Order By event_date)As logs_rank
From Activity
)
Select player_id,
        first_login
From Table_cte
Where logs_rank =1;