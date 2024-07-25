use northwind ; 

-- 20. total number of products in each category. 
-- Sort the results by the total number of products, in descending order
select c.categoryname, count(p.categoryid) as product_count
from categories c 
join products p on 
p.categoryid = c.categoryid 
group by categoryname     # In aggregated query without GROUP BY - error so here group by is must 
order by product_count desc ; 

-- 21. In the Customers table, show the total number of customers per Country and City.
select * from customers ; 
select country, city, count(customerid) as `total number of customers per Country & City` 
from customers group by country, city  ; 

-- 22. return UnitsInStock and ReorderLevel, where UnitsInStock is less than the ReorderLevel, 
-- Order the results by ProductID.
select productname, unitsinstock, reorderlevel from products 
where unitsinstock < reorderlevel 
order by productid ; 

-- 23. Return UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued— define “products that need reordering” 
-- with the following:
-- UnitsInStock plus UnitsOnOrder are less than or equal to ReorderLevel
-- The Discontinued flag is false (0) 
select productid , unitsinstock, unitsonorder, reorderlevel, discontinued from products 
where (unitsinstock + unitsonorder) <= reorderlevel 
and 
discontinued = 0 ; 

#### 24. list of all customers, sorted by region, alphabetically
select * from customers ; 
select  customerid, region  from customers order by region,  customerid ; 

-- 25. Return the three ship countries with the highest average freight overall, in descending order by average freight - in year 1996
select shipcountry, round(avg(freight)) as avg_freight from orders  where year(orderdate) = "1996" 
group by shipcountry order by avg_freight desc limit 3 ; 

-- 28. 
select shipcountry, round(avg(freight)) as avg_freight from orders 
where orderdate >= (SELECT MAX(orderdate) - INTERVAL 12 MONTH FROM orders) 
group by shipcountry order by avg_freight desc limit 3 ; 

-- 29. 
SELECT e.employeeid, e.lastname, o.orderid, p.productid, p.productname, od.quantity 
FROM employees e 
JOIN orders o ON e.employeeid = o.employeeid 
JOIN `order details` od ON o.orderid = od.orderid 
JOIN products p ON p.productid = od.productid;

-- 30. customers who have never actually placed an order.Show these customers
select customerid from customers where customerid not in (select customerid from orders) ; 

-- 31. 
select customerid from customers where customerid not in (
select distinct(customerid) from orders where employeeid = 4) ; 




