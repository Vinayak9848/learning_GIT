USE AdventureWorks2022
GO 

SELECT CountryRegionCode FROM Person.StateProvince
UNION 
SELECT CountryRegionCode FROM Person.StateProvince

SELECT CountryRegionCode FROM Person.StateProvince
UNION ALL 
SELECT CountryRegionCode FROM Person.StateProvince

SELECT CountryRegionCode FROM Person.StateProvince
INTERSECT 
SELECT CountryRegionCode FROM Person.StateProvince

SELECT CountryRegionCode FROM Person.StateProvince
Except 
SELECT CountryRegionCode FROM Person.StateProvince



