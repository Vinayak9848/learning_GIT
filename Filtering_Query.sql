USE AdventureWorks2022
GO

/*Comparison Operators(=,>,<,>=,<=,!=)*/

SELECT * FROM [Production].[Product] WHERE ProductID =1
GO
SELECT * FROM [Production].[Product] WHERE SellStartDate >'2008-04-30 00:00:00.000'
GO
SELECT * FROM [Production].[Product] WHERE SellStartDate <'2008-04-30 00:00:00.000'
GO
SELECT * FROM [Production].[Product] WHERE MakeFlag>=0
GO
SELECT * FROM [Production].[Product] WHERE MakeFlag<=1
GO
SELECT * FROM [Production].[Product] WHERE MakeFlag!=1

/*AND Operator*/

SELECT * FROM [Person].[StateProvince] WHERE CountryRegionCode ='CA' AND Name= 'Alberta'

/*OR Operator*/                                      
SELECT * FROM [Person].[StateProvince] WHERE CountryRegionCode ='CA' OR Name= 'Alberta'

/*BETWEEN*/

SELECT * FROM [Production].[Product] WHERE SellStartDate BETWEEN  '2008-04-30' AND '2011-05-31' 

SELECT * FROM [Production].[Product] WHERE SellStartDate BETWEEN  '2011-05-31'  AND '2008-04-30' 

/*LIKE*/
                
SELECT * FROM [Person].[StateProvince] WHERE CountryRegionCode LIKE'US'

SELECT * FROM [Person].[StateProvince] WHERE CountryRegionCode NOT LIKE'US'

SELECT * FROM [Person].[StateProvince] WHERE Name LIKE'A%'

SELECT * FROM [Person].[StateProvince] WHERE Name NOT LIKE'A%'

SELECT * FROM Person.StateProvince WHERE Name LIKE '%d%'

SELECT * FROM Person.StateProvince WHERE StateProvinceID IN (1,2,3,4,5)

SELECT * FROM Person.StateProvince WHERE StateProvinceID NOT IN (1,2,3,4,5)

