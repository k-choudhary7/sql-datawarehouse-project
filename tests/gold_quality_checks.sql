/*
--------------------------------------------------------------------------
The purpose of this script is to perform quality checks to validate
the integrity and accuracy of the gold layer such as uniqueness, and 
foreign key integrity(Dimensions)
--------------------------------------------------------------------------
*/
-- Quality checks for gold
-- check for the uniqueness of customer key in gold.dim_customers

select 
customer_key,
count(*) as duplicate_count
from gold.dim_customers
group by customer_key 
having count(*) > 1

-- check for the uniqueness of Product key in gold.dim_customers
select 
product_key,
count(*) as duplicate_count
from gold.dim_products
group by product_key 
having count(*) > 1

-- check the foreign key integrity(Dimensions)
select * from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key = f.customer_key
left join gold.dim_products p
on p.product_key = f.product_key
where p.product_key is null or c.customer_key is null
