/* Write your T-SQL query statement below */
    With Group_cte AS 
    (
        Select customer_number,
            Count(order_number) As NumberOfOrders
    From Orders
    Group By customer_number
    )

    Select Top 1 customer_number
    From Group_cte
    Where NumberOfOrders = (Select Max(NumberOfOrders) From Group_cte)