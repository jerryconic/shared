USE master;

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'db01')
BEGIN
	ALTER DATABASE db01 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE db01;
END
GO
CREATE DATABASE db01;
GO
USE db01;


SELECT *
INTO dbo.Products
FROM Northwind.dbo.Products;

SELECT *
INTO dbo.Customers
FROM Northwind.dbo.Customers;

SELECT *
INTO dbo.Orders
FROM Northwind.dbo.Orders;

SELECT *
INTO dbo.OrderDetails
FROM Northwind.dbo.[Order Details];

SELECT *
INTO dbo.Employees
FROM Northwind.dbo.Employees;

GO
