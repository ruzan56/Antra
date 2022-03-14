--1
create view view_product_order_Yolchyan as
 select p.ProductName, Count(o.Quantity) QuantityCount from Products p inner join
[Order Details] o
 on o.ProductID = p.ProductID
 group by p.ProductName;
 
 --2
 alter proc spProductOrderQuant2
 @id int,
 @total int out
 AS
 BEGIN
 select @id = view_product_quantity_order_Yolchyan.ProductID,@total =
 view_product_quantity_order_Yolchyan.QuantityCount from
 view_product_quantity_order_Yolchyan
 where view_product_quantity_order_Yolchyan.ProductID = @id
 END

 declare @id int, @total int
 exec spProductOrderQuant2 2, @total out
 print @total


--3

create procsp_product_order_city_Yolchyan
(@product_namevarchar(50),
@order_cityvarchar(50)
output)as 
begin 
select @product_name=ss.productname from(select top 5 d.ProductID, d.ProductName
FROM (selectp.ProductID,p.ProductName, sum(od.quantity) t from Products p 
inner join [Order Details] od 
on p.ProductID=od.ProductID
group by p.ProductID,p.ProductName) as[d]Order by d.tdesc)
 
 --4

create table people_Yolchyan(id int,name char(20),citmed int)
create table city_Yolchyan(citmed int,city char(20))

insert into people_Yolchyan(id,name,citmed)values(1,'Aaron Rodgers',2)
insert into people_Yolchyan(id,name,citmed)values(2,'Russell Wilson',1)
insert into people_Yolchyan(id,name,citmed)values(3,'Jody Nelson',2)
insert into city_Yolchyan(citmed,city)values(1,'Settle')
insert into city_Yolchyan(citmed,city)values(2,'Green Bay')

create view Packers_me_Yolchyan as
 select p.id, p.name from people_Yolchyan p inner join city_Yolchyan c on p.citmed=c.citmed
 where c.city='Green bay'
 begin tran
 rollback
 drop table people_Yolchyan
 drop table city_Yolchyan
 drop view Packers_me_Yolchyan


--5

create proc sp_birthday_employees_Yolchyan as 
begin 
select employeeid,LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Photo into 
birthday_employees_Yolchyan
from Employees
where month(BirthDate)=2
end
drop table birthday_employees_Yolchyan

----6
--The optimal way to see if two tables have the same data is to store total data number for 
--both tables and perform union and check. If the number of data is not the same as union table data
--then they don have same data 
