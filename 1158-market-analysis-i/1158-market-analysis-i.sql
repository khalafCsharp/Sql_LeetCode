
Select Distinct u.user_id As buyer_id,
        u.join_date,
        Count(o.order_id) Over(Partition By buyer_id)As orders_in_2019
From Users u
Left Join Orders As o
On o.buyer_id = u.user_id And Year(o.order_date)= 2019
