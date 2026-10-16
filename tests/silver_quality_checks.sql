/*
-----------------------------------------------------------------------------------
The purpose of this script is to check for data integrity, data standardization
and quality checks.
------------------------------------------------------------------------------------
*/
-- Check for nulls or duplicates in the primary key for bronze.crm_cust_info 
select
cst_id,
count(*)
from bronze.crm_cust_info 
group by cst_id
having count(*) > 1 or cst_id is null

-- Check for unwanted spaces for all string values
select cst_firstname from bronze.crm_cust_info
where cst_firstname != trim(cst_firstname)

select cst_lastname from bronze.crm_cust_info
where cst_lastname != trim(cst_lastname)

select cst_gndr from bronze.crm_cust_info
where cst_gndr != trim(cst_gndr)

-- Data Standardization and Consistency
select distinct cst_gndr from bronze.crm_cust_info


-- Check for nulls or duplicates in the primary key for bronze.crm_prod_info 
select
prd_id,
count(*)
from bronze.crm_prd_info 
group by prd_id
having count(*) > 1 or prd_id is null

-- check for leading and trailing spaces
select prd_nm from bronze.crm_prd_info 
where prd_nm != trim(prd_nm)

-- check for nulls and negative numbers
select prd_cost from bronze.crm_prd_info
where prd_cost < 0 or prd_cost is null


-- Check for nulls or duplicates in the primary key
select
cst_id,
count(*)
from silver.crm_cust_info 
group by cst_id
having count(*) > 1 or cst_id is null

-- finding leading and trailing spaces

select cst_firstname from silver.crm_cust_info
where cst_firstname != trim(cst_firstname)

select cst_lastname from silver.crm_cust_info
where cst_lastname != trim(cst_lastname)

select cst_gndr from silver.crm_cust_info
where cst_gndr != trim(cst_gndr)

-- checking for data integrity
select 
ci.cst_gndr,
ca.gen, 
case when ci.cst_gndr != 'n/a' then ci.cst_gndr
	 else ca.gen
end as new_gndr
from silver.crm_cust_info ci
left join silver.erp_cust_az12 ca
on ci.cst_key = ca.cid
where ci.cst_gndr != ca.gen

-- filtering historical data
select
prd_id,
cat_id,
prd_key,
prd_nm,
prd_cost,
prd_line,
prd_start_dt,
prd_end_dt
from silver.crm_prd_info 
where prd_end_dt is null
