create database E_Commerce;
use E_Commerce;

create table Customer(CustomerID int primary key ,
Name varchar(100) not null,Address Text,ContactDetails varchar(100),
Email varchar(100) unique,PasswordHash varchar(255) not null)

insert into Customer values(1,'Alice Johnson','123 Elm St,Springfield','555-1234','Alice@example.com','hashed_password2'),
(2,'Bob smith','465 Oak St,Rivertown','555-5678','bob@example.com','hashed_password'),
(3,'Carol lee','789 Maple AVe,Greendale','555-9012','carol@example.com','hashed_password'),
(4,'David chen','321 Pine St,Hiltown','555-3456','david@example.com','hashed_password'),(
5,'Eva Brown','546 Birch Blvd, Laeview','555-7890','eva@example.com','hashed_password');

create table Products (ProductID int primary key ,Name varchar(100)not null,Description Text,Price
Decimal(10,2) not null,stockQuantity int Not null ,CategoryID int foreign key references Categories(CategoryID))

insert into Products values(1,'Laptop','15-inch display 8GB Ram,512 ssd',899.99,50,1),
(2,'Smartphones','6.1-inch screen 128GB storage',599.99,100,1),
(3,'Headphones','Noise-cancelling,wireless',199.99,75,1),
(4,'Keybord','Mechanical,RGB backlight',149.99,40,1),
(5,'StoryBook','Story of Mathology',140.67,50,2),
(6,'T-shirt','R mani clother',230.11,25,3),(7,'O-shirt','R-Mani',335.22,50,3),
(8,'Car','Remote control Car',34.2,20,4),(9,'Marbal','Furniture Jaipuri',456.33,60,5)
drop table Products 
exec sp_rename 'Product' ,'Products'
insert into Products values(5,'Monitor','24=inch Full HD',89.99,40)

create table Categories(CategoryID int primary key,CategoryName varchar(30) not null )
insert into Categories values (1,'Electronics'),(2,'Books'),(3,'Clothing'),(4,'Toys'),(5,'Furniture')

select *from Products

create table Orders(OrderID int primary key  ,OrderDate Date Not null,TotalAmount Decimal(10,2)not null,Status varchar(50) not null)

insert into Orders values(1,'2025-06-01',299.00,'Shipped'),
(2,'2025-06-03',75.99,'Delivered'),(3,'2025-06-05',89.00,'Pending'),
(4,'2025-06-07',67.33,'Cancelled'),(5,'2025-06-09',90.33,'Proccessing')

create table OrderItems(ItemId int primary key,OrderID int ,ProductID int,Quantity int ,Subtotal Decimal(10,2),
foreign key (OrderID) references Orders(OrderID),foreign key (ProductID) references Products(ProductID))

insert into OrderItems values (1,1,1,34,299.99),(2,4,3,45,75.99),(3,3,2,50,150.50),(4,5,1,78,499.00),(5,2,1,54,89.00)
select *from OrderItems

--Number of order per month
select Year(OrderDate) as orderYear,
Month(OrderDate) as ordermonth,
count(*)as NumberofOrders
from Orders group by  year(OrderDate),month(OrderDate)

--Calculate total revenue for  a specific period 
select sum(OrderItems.Quantity *OrderItems.Subtotal) as totalrevue
from Orders
join OrderItems on Orders.OrderID=OrderItems.OrderID
where Orders.OrderDate >='2023-01-01' and Orders.OrderDate <'2023-02-01';

--retrieve products in a specific category
 select Name from Products where CategoryID =1
--retrieve product details by name
	select ProductID ,Name,Price,Description from Products
	where Name='Laptop'

--retrieve all orders for a customer
  select *from Orders
  where CustomerID=1

  select getdate() as Ctime 

select *from  Customer
select *from Orders
select *from Products
