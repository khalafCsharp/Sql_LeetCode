/* Write your T-SQL query statement below */

    Select 
            score,
            Dense_Rank() Over(Order By score Desc) As rank
    From Scores;