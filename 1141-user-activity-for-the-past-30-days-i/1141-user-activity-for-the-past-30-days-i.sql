/* Write your T-SQL query statement below */

Select  activity_date as day,
         Count(Distinct user_id) As active_users
From Activity
Where activity_date Between DateAdd(day,-29,'2019-07-27') And '2019-07-27'
Group By activity_date