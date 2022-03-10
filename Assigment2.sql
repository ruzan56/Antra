--1.How many products can you find in the Production.Product table?
SELECT count(productID)
FROM Production.Product
--2. 
SELECT COUNT(ProductSubcategoryID)
FROM Production.Product
--3. 
SELECT  ProductSubcategoryID, COUNT(*) as CountedProducts
FROM Production.Product
WHERE ProductSubcategoryID is not NULL
GROUP BY ProductSubcategoryID

--4.
SELECT COUNT(*) 
FROM Production.Product
where ProductSubcategoryID is NULL

--5
SELECT sum(quantity)
FROM Production.ProductInventory
--6. 
SELECT ProductID, sum(quantity)  as TheSum
FROM Production.ProductInventory
WHERE LocationID=40 
GROUP by ProductID
having sum(Quantity)<100
--7.
SELECT shelf,ProductID,  sum(quantity)  as TheSum
FROM Production.ProductInventory
WHERE LocationID=40 
GROUP by shelf,ProductID
having sum(Quantity)<100
--8.
SELECT AVG(quantity)
FROM  Production.ProductInventory
WHERE LocationID=10
--9. 
SELECT ProductID, shelf, avg(quantity) as Avg
FROM Production.ProductInventory
GROUP by Shelf, ProductID
--10.
SELECT ProductID, shelf, avg(quantity) as Avg
FROM Production.ProductInventory
WHERE Shelf!='N/A' 
GROUP by Shelf, ProductID
--11. 
SELECT Color, Class, COUNT(ProductID) as TheCount, AVG(ListPrice) as AvgPrice
from Production.Product
WHERE Color is not null and Class is not NULL
GROUP by Color, Class
--12. Joins
SELECT c.Name as Country, s.Name as Province
FROM  person.CountryRegion c  INNER JOIN  person.StateProvince s
ON c.CountryRegionCode= s.CountryRegionCode

--13
SELECT c.Name as Country, s.Name as Province
FROM  person.CountryRegion c  INNER JOIN  person.StateProvince s
ON c.CountryRegionCode= s.CountryRegionCode
WHERE c.Name in ('Germany','Canada')
--14 Using Northwnd Database: (Use aliases for all the Joins)

--15 

SELECT ProductName

FROM Products p LEFT JOIN Orders o ON p.ProductID=o.OrderID
WHERE o.OrderID is  not NULL


--16
SELECT distinct TOP 5 ShipPostalCode
from  Orders  
WHERE ShipPostalCode is not null
--17
SELECT  city, count(CustomerID)
FROM Customers
GROUP by City
--18
SELECT  city, count(CustomerID)
FROM Customers



--19. 
SELECT ContactName
FROM Customers c inner JOIN  Orders o on c.CustomerID=o.CustomerID
WHERE o.OrderDate>'1998/1/1'
--20
SELECT ContactName, o.OrderDate
FROM Customers c inner JOIN  Orders o on c.CustomerID=o.CustomerID
ORDER by o.OrderDate DESC
--21
SELECT ContactName, count(o.OrderID) as count
from Customers c INNER join Orders o on c.CustomerID=o.CustomerID
GROUP by ContactName
ORDER by [count] desc
--22
SELECT c.CustomerID, count(distinct o.OrderID) as count
from Customers c INNER join Orders o on c.CustomerID=o.CustomerID 
GROUP by c.CustomerID
HAVING COUNT(distinct o.OrderID)>10

-23
--SELECT s.CompanyName, sh.CompanyName

--From Suppliers sh INNER JOIN Orders o on sh.

--24.Suppliers
--select p.
--From Products p inner join Orders o on p.ProductID=o.

--25. 
select distinct e.FirstName as name,e.Title
From Employees e INNER join Employees m on e.Title=m.Title

--26. 
SELECT m.LastName,
    count(*)
From Employees e , Employees m
WHERE e.ReportsTo=m.EmployeeID
GROUP by m.LastName
HAVING COUNT(*)=
    (select max(mycount)
    from 
    (select COUNT(*) mycount
    FROM Employees
    group by LastName)
    a)
--27

from Suppliers s JOIN customers c on 