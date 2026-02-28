/* Write your T-SQL query statement below */

    With AddFirst_cte AS
    (
        Select *,
            Min(order_date) Over(Partition By customer_id) AS first_order
        From Delivery
    )
    , OnlyFirstOrders_cte As
    (
        Select customer_id,order_date, customer_pref_delivery_date, first_order 
        From AddFirst_cte
        Where order_date = first_order
    )

    Select  Round(
        Convert(Decimal(10,2),(Select Count(*) From OnlyFirstOrders_cte Where first_order = customer_pref_delivery_date)) /
            Convert(Decimal(10,2),(Select Count(*) From OnlyFirstOrders_cte)) *100
            ,2
            ) As immediate_percentage
