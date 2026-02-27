/* Write your T-SQL query statement below */

Select id,
        movie,
        description,
        rating
From Cinema
Where id % 2 != 0 And description != 'boring'
Order By rating Desc