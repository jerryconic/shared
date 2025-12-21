USE db01;

SELECT * FROM dbo.Orders;

SELECT * FROM Northwind.dbo.Orders;



SELECT * FROM Northwind.dbo.Orders
WHERE OrderID = 10400;

SELECT * FROM dbo.Orders
WHERE OrderID = 10400;

CREATE UNIQUE CLUSTERED INDEX CX_OrderID 
ON dbo.Orders(OrderID)




SELECT * FROM Northwind.dbo.Orders
WHERE OrderDate = '1997-1-1';

SELECT * FROM dbo.Orders
WHERE OrderDate = '1997-1-1';

CREATE NONCLUSTERED INDEX IX_OrderDate 
ON dbo.Orders(OrderDate)

GO

