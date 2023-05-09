Create Database Customerinfo

Use Customerinfo

Create Table Customers 
(
CustomerId int,
CustomerName varchar(25),
Email varchar(20),
City Varchar(27),
Age int
)

Create Table Orders
(
OrderId int primary key,
OrderDate datetime,
Amount int,
CustomerId int
)

create Table Products
(
ProductId int primary key,
ProductName varchar(22),
Quantity int,
Amount int
)
 
Alter Table Products add ProductDescription varchar(40)
Alter Table Orders drop column amount 
Alter Table Products add Constraint check_qty check(Quantity>0)
Alter Table Orders alter column OrderId int not null


Alter Table Products add constraint fk1 foreign key (ProductId) references Orders (OrderId)
