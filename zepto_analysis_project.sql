drop table if exists zepto;

create table zepto (
sku_id INT PRIMARY KEY auto_increment,
category VARCHAR (120),
name varchar (150) not null,
mrp numeric (8,2), 
discountPercent numeric (5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC (8,2),
weightInGms INTEGER,
outOfStock boolean,
quantity INTEGER );


DROP TABLE zepto;


select*
from zepto limit 20;


select*from zepto
where name is null
or category is null
or mrp is null
or discountPercent is null
or availableQuantity is null 
or discountedSellingPrice is null
or weightinGms is null
or outOfStock is null
or quantity is null;

select distinct category 
from zepto
order by category;


select outOfstock, COUNT(*) AS product_count
from zepto
group by outOFstock;


select name, count(*) as 'number of skus' 
from zepto 
group by name
having count(*)>1 
order by count(*)desc;


SELECT* from zepto
WHERE mrp=0 or discountedSellingPrice=0;

delete from zepto
where mrp = 0;


set sql_safe_updates = 0;



update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;


select mrp, discountedSellingPrice FROM zepto;


SELECT DISTINCT name,mrp,discountPercent
from zepto
order by discountPercent DESC
LIMIT 10;


select distinct name,mrp 
from zepto 
where outOFStock='true'
AND mrp>300
order by mrp DESC;


select distinct category,
sum(discountedSellingPrice*availableQuantity) AS Estimated_revenue
FROM zepto
GROUP BY category
order by estimated_revenue DESC;


select distinct name , mrp , discountPercent 
FROM zepto 
where mrp >500
and discountPercent <10
ORDER BY mrp DESC;


select category,
avg(discountPercent) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount desc
limit 5;


select distinct name,weightInGms,(discountedSellingPrice/weightInGms) AS price_per_gram
FROM zepto
WHERE weightInGms>100
order by price_per_gram asc;


select name,weightInGms,
CASE 
WHEN weightInGms <1000 THEN 'low weight'
when weightInGms <=5000 THEN 'medium weight'
else 'bulk'
END AS weight_category
FROM zepto;


select distinct category,
sum(weightInGms*availableQuantity)/1000
AS total_weight_kg
FROM zepto 
group by Category
order by total_weight_kg DESC;











