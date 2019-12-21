-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select Category.CategoryName, * from [Product] join [Category] on [Product].CategoryId = Category.id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select [Order].Id, Shipper.CompanyName from [Order] join [Shipper] on [Order].ShipVia = Shipper.Id where [Order].OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select Product.ProductName, OrderDetail.Quantity, * from OrderDetail join Product on OrderDetail.ProductId = Product.Id where OrderDetail.OrderId = '10251'

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select [Order].Id, Customer.CompanyName, Employee.LastName from [Order] join Customer, Employee where [Order].CustomerId = Customer.Id and [Order].EmployeeId = Employee.Id