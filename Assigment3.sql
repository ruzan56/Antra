--1.List all cities that have both Employees and Customers
--SELECT Customers.City FROM Customers
--UNION
--SELECT   Employees.City   FROM Employees
SELECT distinct city
from Customers
WHERE City in (Select City from Employees)
--2.

SELECT distinct City
from Customers
WHERE city not in (select City from Employees)

--3.
Select Products.ProductName, 
       OrderCount=
        (Select COUNT(ProductID)
         From [Order Details]
         WHERE  Products.ProductID=[Order Details].ProductID)    
FROM Products

--4.
SELECT Customers.City,
        TotalOrdered= 
        (SElECT COUNT(Orders.ShipCity)
        From [Orders]
        WHERE Customers.City=Orders.ShipCity)
FROM Customers
--5.
--a
SELECT u.city from Customers u 
GROUP by u.City HAVING COUNT(u.City)>2
UNION
SELECT c.city from Customers c 
GROUP by c.City HAVING COUNT(c.City)=2
--B
SELECT distinct c.city
FROM Customers c 
where c.City in (select u.city from Customers u 
GROUP by u.City
HAVING COUNT(u.City)>=2)


--6
SELECT distinct c.City
from Orders o INNER JOIN Customers c
ON o.CustomerID=c.CustomerID
INNER JOIN [Order Details] r 
ON r.OrderID=o.OrderID
GROUP by c.City,r.ProductID
HAVING COUNT(r.ProductID)>2

--7. 
SELECT c.CustomerID From Customers c, Orders o 
WHERE c.City!=o.ShipCity
GROUP by c.CustomerID

--8.
Select TOP 5 [Order Details].ProductID, avg(UnitPrice) as avgprice, 
             CustomerCity= MAX(ProductID)
From [Order Details]
GROUP by [Order Details].ProductID

--9.
--A
SELECT e.city from Employees e 
where e.City not in (
    select c.city from Orders o 
    inner join Customers c 
    on c.CustomerID=o.CustomerID
)
--B
SELECT distinct e.city from Employees e 
LEFT JOIN Customers c 
on e.City =c.City
where c.City is NULL
--10
select * from
    -- Transaction 1 
(select Top 1 e.City, count(o.OrderID) countOrder from Employees e inner join Orders o
 on e.EmployeeID = o.EmployeeID
 group by e.City) T1
 inner join (
select Top 1 c.City, count(r.Quantity) countQuantity from [Order Details] r inner join
 Orders d on r.OrderID = d.OrderID
 inner join Customers c on c.CustomerID = d.CustomerID group by c.City) T2
 on T1.City = T2.City




--11 . By using CTE 
--Syntax

WITH CustomersCTE AS  
(  
   SELECT*, ROW_NUMBER() over (PARTITION BY ID ORDER BY ID) as RowNumber  
   FROM Customers  
)  
DELETE FROM CustomersCTE WHERE ROW_NUMBER() >1 