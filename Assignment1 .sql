--1.Write a query that retrieves the columns ProductID, Name, 
--Color and ListPrice from the Production.Product table, with no filter. 
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
--2.Write a query that retrieves the columns ProductID, Name, Color and 
--ListPrice from the Production.Product table, 
--excludes the rows that ListPrice is 0.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE ListPrice!=0
--3.Write a query that retrieves the columns 
--ProductID, Name, Color and ListPrice from the Production.Product table, 
--the rows that are NULL for the Color column.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NULL
--4.Write a query that retrieves the columns ProductID, Name, Color and ListPrice 
--from the Production.Product table, 
--the rows that are not NULL for the Color column.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT Null
--Write a query that retrieves the columns ProductID, 
--Name, Color and ListPrice from the Production.Product table, 
--the rows that are not NULL for the column Color, 
--and the column ListPrice has a value greater than zero.

SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT Null AND ListPrice>0

--6.Write a query that concatenates the columns Name and Color from the Production.
--Product table by excluding the rows that are null for color.

SELECT name + color 
FROM Production.Product
WHERE  Color IS NOT Null

--7. Write a query that generates the following result set  from Production.Product:

SELECT name , color 
FROM Production.Product
WHERE (name ='Crankarm' or name ='Chainring')
and Color= 'black' or color='silver'

--8.Write a query to retrieve the to the columns ProductID and 
--Name from the Production.
--Product table filtered by ProductID from 400 to 500
SELECT ProductID, Name
FROM Production.Product
WHERE ProductID BETWEEN 400 and 500

--9.Write a query to retrieve the to the columns  
--ProductID, Name and color from the Production.
--Product table restricted to the colors black and blue

SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color ='black' or Color='blue'
--10.Write a query to get a result set on products 
--that begins with the letter S. 
SELECT ProductID, Name
FROM Production.Product
WHERE name like 's%'

11. 
SELECT Name,ListPrice
FROM Production.Product
WHERE name like 's%' 
ORDER by Name

--12.Write a query that retrieves the columns Name and ListPrice 
--from the Production.Product table. Your result set should 
--look something like the following. 
--Order the result set by the Name column. 
SELECT Name,ListPrice
FROM Production.Product
WHERE name like 'a%' or name like 's%'
ORDER by Name

--13.
SELECT Name,ListPrice
FROM Production.Product
WHERE name like 'spo%' and name NOT LIKE '___k%'
ORDER by Name
--14.
SELECT DISTINCT Color
FROM Production.Product
ORDER by color DESC
--15. 
SELECT DISTINCT ProductSubcategoryID, Color
FROM Production.Product
WHERE ProductSubcategoryID is not null and Color is NOT NULL

