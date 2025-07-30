USE AdventureWorks2022
GO
SELECT TOP 100 * FROM [Production].[Product]
SELECT TOP 100 * FROM [Sales].[Orders]

/*Here we are getting the ProdcuctId,name,prices from Product table and total orders from Orders table*/

SELECT ProductID AS ProductID,
       Name      AS ProductName,
	   listPrice AS Price,
	   (SELECT Count(*) FROM Sales.Orders) AS TotalOrders
	FROM Production.[Product]
 
SELECT TOP 100 * FROM Sales.Customers

SELECT Sc.*,SO.custid,OrderCount  FROM Sales.Customers SC
LEFT JOIN  (
            SELECT custid,Count(*) AS OrderCount FROM Sales.Orders O
			    GROUP BY custid
			)SO
			ON SO.custid=SC.custid


SELECT * FROM Sales.Customers C  WHERE custid =22
SELECT * FROM Sales.Orders O WHERE custid =22

