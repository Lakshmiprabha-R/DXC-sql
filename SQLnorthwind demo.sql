select * from Customers where not country = 'Mexico'
Select * from Customers where CustomerID = 'Bergs'
Select * from Customers where Region is not null

 Select avg (UnitPrice) from products 
 Select  Count (*) from products
 Select min (UnitPrice) from Products
 Select max (UnitPrice) from Products
 Select char (77)
 Select Left ('Prabha',3)
 Select len ('Morning')
 Select left (ContactName,8) from Customers
 Select reverse (ContactTitle) from Customers
 Select reverse  ('Lakshmiprabha')
 Select getdate()
 Select dateadd(mm,3,'2023-05-09')
 Select DATEADD (YYYY,3,'2020-05-09')
select year ('2020-09-12')
Select OrderDate,dateadd(dd,4,OrderDate)as DeliveryDate from Orders
Select DATEDIFF(dd,'2025-05-09','2021-01-09')
select round (4.563,1)
select ceiling (1.05)
select floor (3.99)
select power (105,2)

Select SupplierID, SUM(UnitsInStock) as TotalStock from Products group by SupplierID having SupplierID=9

