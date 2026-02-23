/* Write your T-SQL query statement below */

With Grouped_emails_cte As
(
    Select email As Email,
            Count(*) As NumberOfTimesAppeared
    From Person
    Group By email
)
Select Email
From Grouped_emails_cte
Where NumberOfTimesAppeared > 1