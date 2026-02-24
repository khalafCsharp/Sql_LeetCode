/* Write your T-SQL query statement below */
With ExtraDetails_cte As
(
    Select id,
            recordDate As today,
            temperature As todayTemperature,
            Lag(temperature) Over(Order By recordDate Asc) As yesterdayTemperature,
            DateAdd(day,-1,recordDate) As yesterday,
            Lag(recordDate) Over(Order By recordDate Asc) As previousDay
    From Weather
)
Select id As Id
From ExtraDetails_cte
Where todayTemperature > yesterdayTemperature And yesterday = previousDay

