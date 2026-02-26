/* Write your T-SQL query statement below */

    With Two As 
    (
        Select id,
                people,
                visit_date,
            id -  Row_Number() Over(Order By id Asc) As groupNumber
        From Stadium
        Where people >=100
    )
    
    Select id, visit_date, people
    From Two
    Where groupNumber In (Select groupNumber As numberOfRows From Two Group By groupNumber Having Count(*) >2)

