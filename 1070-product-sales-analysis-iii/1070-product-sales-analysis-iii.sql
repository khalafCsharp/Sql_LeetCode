/* Write your T-SQL query statement below */
With T_cte As 
( 
    Select *,
            Min(year) Over(Partition By product_id)As firstYearProductSold
    From Sales
)
Select product_id,
        firstYearProductSold As first_year,
        quantity,
        price
From T_cte
Where year = firstYearProductSold
