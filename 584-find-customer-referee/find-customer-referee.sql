/* Write your T-SQL query statement below */

Select  c1.name
From Customer AS c1 Inner Join Customer As c2
On c1.id = c2.id
Where c1.referee_id is null Or c1.referee_id !=2