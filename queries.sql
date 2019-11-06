-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.ProductName Product, c.CategoryName as Category
from [product] as p
join [category] as c on p.categoryId = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.Id orderId, s.CompanyName as Company
from [Order] as o 
join Shipper as s on o.ShipVia = s.Id where OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select ProductName, QuantityPerUnit 
from Product 
join OrderDetail on OrderDetail.ProductId = Product.Id where OrderDetail.OrderId = 10251
order by ProductName asc;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.Id, c.CompanyName, e.LastName
from [Order] as o
join Customer as c, Employee as e on o.CustomerId = c.id AND o.EmployeeId = e.Id;