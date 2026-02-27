/* Write your T-SQL query statement below */

    With Table1_cte AS 
    (
        Select id,
                student,
                Lead(student) Over(Order By id)As LeadStudent,
                Lag(student) Over(Order By id) AS previousStudent
        From Seat
    )

    Select id,
        Case
        When (id % 2 != 0 And Lead(id) Over(Order By id) is not null) Then  LeadStudent
        When (Lead(id) Over(Order By id) is  null And Count(id) Over() %2 !=0) Then  student
        Else previousStudent
        End As student
    From Table1_cte
