
With RankPlayerEvents_cte As 
(   
    Select player_id, event_date,
        Row_Number() Over(Partition By player_id Order By event_date Asc) As rank
    From Activity
),
OnlyConsecutiveEventDates_cte As 
(
    Select t1.player_id As player_id
    From (Select * From RankPlayerEvents_cte Where rank=1) As t1 Inner Join (Select * From RankPlayerEvents_cte Where rank=2) As t2
    On t1.player_id = t2.player_id And DateDiff(day,t1.event_date,t2.event_date)=1
)



Select Round(
    Cast(
        (Select Count(*) From OnlyConsecutiveEventDates_cte)  As Float) /
    Convert(Float,
        (Select Count(Distinct player_id)From Activity)
             )
,2) As fraction