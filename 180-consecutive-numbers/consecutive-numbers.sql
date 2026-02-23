
-- creating two new columns, First row_number of each num separately, Second the difference between the id (which is row_number) and the First column, then group by (num,the difference column), after that counting each group and applying the condition
With Set_cte As 
    (
        Select num As Number,
            id As Rank,
            Row_Number() Over(Partition By num Order By id Asc) As rankWithinSameNumber,
            id - Row_Number() Over(Partition By num Order By id Asc) As toBeGroupedByColumn
        From Logs
    )
    , Grouped_cte As 
    (
        Select Number,
        Count(*) As NumberOfConsecutiveAppearances
        From Set_cte
        Group By toBeGroupedByColumn, Number
    )

    Select Distinct Number As ConsecutiveNums
    From Grouped_cte
    Where NumberOfConsecutiveAppearances >= 3


