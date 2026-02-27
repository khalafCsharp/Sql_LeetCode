/* Write your T-SQL query statement below */

Select  actor_id,
        director_id
From ActorDirector
group by actor_id, director_id
Having Count(*)> 2
