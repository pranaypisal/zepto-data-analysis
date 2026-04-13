drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms Integer,
outOfStock boolean,
quantity Integer
);

--data exploration

--count of rows
select count (*) from zepto;

--sample data
select * from zepto
limit 10;

--null values
select * from zepto
where category is null or name is null or mrp is null or discountpercent is null 
or availablequantity is null or weightingms is null or outofstock is null or quantity is null;

--different product categories
select distinct category
from zepto
order by category;

--product in stock and out of stock
select outofstock,count(sku_id)
from zepto
group by outofstock;

--product name present multiple times

select name , count (sku_id) "Number of SKUs"
from zepto
group by name
having count(sku_id) >1
order by count(sku_id) desc

--data cleaning 

--products with price = 0 
select * from zepto
where mrp=0 or discountedSellingPrice=0

delete from zepto
where mrp = 0;

--convert paisa to rupees
update zepto
set mrp = mrp/100.0,
discountedSellingPrice= discountedSellingPrice/100.0;

select mrp , discountedSellingPrice from zepto

--Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name, mrp , discountPercent from zepto
order by discountpercent desc
limit 10;

--Q2.What are the Products with High MRP but Out of Stock.

select distinct name ,mrp,outofstock from zepto
where outofstock is true
order by mrp desc
limit 10;

--Q3.Calculate Estimated Revenue for each category
select category,sum(discountedsellingprice * availablequantity) totalrevnue
from zepto
group by category
order by totalrevnue;

--Q4. Find all products where MRP is greater than 500 and discount is less than 10%.
select distinct name ,mrp, discountpercent from zepto
where mrp>500 and discountpercent <10.00
order by discountpercent desc,mrp desc;

--Q5. Identify the top 5 categories offering the highest average discount percentage.
select category,round(avg(discountpercent),2) avgdiscount
from zepto
group by category
order by avgdiscount desc
limit 5;

--Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name,weightingms,discountedsellingprice,round(discountedsellingprice/weightingms,2) as price_per_gram 
from zepto
where weightingms >100
order by price_per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name, weightingms,
case
when weightingms <=1000 then 'low'
when weightingms <=5000 then 'medium'
else 'bulk'
end weightcategory
from zepto;

--Q8.what is the Total Inventory Weight Per Category
select category,sum(weightingms*availablequantity) invertoryweight
from zepto
group by category
order by invertoryweight;
