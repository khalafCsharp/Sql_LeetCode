
    Select Distinct customer_id 
    From Customer As c
    Where (
        (Select Count(Distinct product_key) From Customer As k
     Where c.customer_id = k.customer_id )
     = (Select Count(Distinct product_key) As x From Product))