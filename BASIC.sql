use northwind ; 

# 1. Which shippers do we have? 
select * from shippers ; 

# 2. In the Categories table, selecting all the fields of two columns - CategoryName and Description.
select categoryName, description from categories ; 

# 3. Return FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative 
select firstname, lastname, hiredate from employees where title = "sales representative" ;  

# 4. Return FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative 
-- and also are in the United States.
select firstname, lastname, hiredate from employees where title = "sales representative" 
and country = "USA" ; 

# 5. Show all the orders placed by a specific employee. 
-- The EmployeeID for this Employee (Steven Buchanan) is 5
select orderid, orderdate from orders where employeeid = 5 ; 

# 6. Return SupplierID, ContactName, and ContactTitle for those Suppliers whose 
 -- ContactTitle is not Marketing Manager
 select SupplierID, ContactName,ContactTitle from suppliers where contacttitle <> "Marketing manager" ; 
 
 # 7. Return ProductID and ProductName
-- for those products where the ProductName includes the string “queso”.
select productid, productname from products where productname like "%queso%" ; 

# 8. Return OrderID, CustomerID, and ShipCountry for the orders
-- where the ShipCountry is either France or Belgium
select orderid, customerid, shipcountry from orders where shipcountry = "Belgium" or 
shipcountry =  "France" ; 

# 9. show all the orders from any Latin American country - Brazil, Mexico, Venezuela, Argentina
select * from orders where shipcountry in ("Brazil", "Mexico", "Venezuela", "Argentina") ; 

# 10. FirstName,LastName, Title, and BirthDate. Order the results by BirthDate, 
-- so we have the oldest employees first - from employees table
select firstname, lastname, title, birthdate from employees order by birthdate asc ; 

# 11. FirstName,LastName, Title, and BirthDate. Order the results by BirthDate, 
-- so we have the oldest employees first - from employees table - show only date and not time 
select firstname, lastname, title, date(birthdate) from employees order by birthdate asc ; 

# 12. Show the FirstName and LastName columns from the Employees table, 
-- and then create a new column called FullName, showing FirstName and LastName joined together 
-- in one column, with a space in-between.
select firstname, lastname , concat(firstname, " " , lastname) as fullname from employees  ; 

# 13. In the OrderDetails table Create a new field, TotalPrice, that multiplies UnitPrice and Quantity.
-- return OrderID, ProductID, UnitPrice, and Quantity. also Order by OrderID and ProductID.
select orderid, productid, unitprice, quantity, round(unitprice * quantity) 
as `total price` from `order details`  order by orderid, productid ; 

# 14. How many customers do we have in the Customers table? Show one value only
select distinct(count(customerid))  from customers ; 

# 15. Show the date of the first order ever made in the Orders table
select date(orderdate) from orders order by orderdate asc limit 1 ; 
select min(date(orderdate)) from orders ; 

# 16. Show a list of countries where the Northwind company has customers.
select distinct country from customers order by country ; 
select country from customers group by country order by country ; 

# 17. Show a list of all the different values in the Customers table for ContactTitles. 
-- Also include a count for each ContactTitle.
select contacttitle, count(contacttitle) as COUNTS from customers group by ContactTitle ; 

# 18. show, for each product, the associated Supplier. Show the ProductID, ProductName, and the CompanyName 
-- of the Supplier. Sort by ProductID.
select p.productid, p.productname, s.companyname 
from products p 
join suppliers s on 
p.SupplierID = s.SupplierID 
order by ProductID ; 

# 19. Show the OrderID, OrderDate (date only), and CompanyName of the Shipper, and sort by OrderID
select o.orderid, date(o.orderdate) as DATES, s.companyname 
from orders o
join shippers s on 
o.shipvia = s.shipperid 
where orderid < 10300
order by orderid ; 




