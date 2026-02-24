/* Write your T-SQL query statement below */

With JoinedSet_cte As(
    Select  t.request_at,
        Count(t.id) Over(Partition By request_at) As totalNumberOfTrips,
        Sum( Case status When 'completed' Then 0 Else 1 End) Over(Partition By request_at) As cancelledRequests
    From Users as u
    Inner Join Trips As t
    ON t.driver_id = u.users_id And  u.banned = 'No'
    Inner Join Users As uu On uu.users_id = t.client_id And
     uu.banned = 'No'
)

Select Distinct request_at As Day,
    Round(Cast(cancelledRequests As Float) / Cast(totalNumberOfTrips As Float),2) As [Cancellation Rate]
From JoinedSet_cte
Where request_at Between '2013-10-01' And '2013-10-03'