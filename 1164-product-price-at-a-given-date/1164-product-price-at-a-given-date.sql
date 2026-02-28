
With ProductsWithNewPrices_cte As
(
    Select product_id,
           First_Value(new_price) Over(Partition By product_id Order By change_date Desc)As price
    From Products
    Where change_date <= '2019-08-16'
)
, ProductsWithPrice10_cte As
(
    Select product_id,
           10 As price
    From Products
    Group By product_id
    Having Min(change_date) > '2019-08-16'
)

Select *
From ProductsWithNewPrices_cte
Union
Select *
From ProductsWithPrice10_cte ;