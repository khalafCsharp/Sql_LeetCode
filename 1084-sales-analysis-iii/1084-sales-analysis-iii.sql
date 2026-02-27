/* Write your T-SQL query statement below */

    With UnQualifiedProductNames_cte As
    (
        Select p.product_id, p.product_name
        From Sales As s
    Inner Join Product As p
    On p.product_id = s.product_id
        Where sale_date Not between '2019-01-01' And '2019-03-31'
    )

    Select Distinct p.product_id,p.product_name
    From Sales As s
    Inner Join Product As p
    On p.product_id = s.product_id
   
   Except
   Select *
   From UnQualifiedProductNames_cte