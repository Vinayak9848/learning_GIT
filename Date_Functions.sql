USE SQLPractice
GO

--SELECT GETDATE() 
--SELECT SYSDATETIME()

DECLARE @YourDate DATE 
    SET @YourDate = GETDATE()
--SELECT @YourDate
--This is DATEPART()
SELECT DATEPART(day,@YourDate)
SELECT DATEPART(Month,@YourDate)
SELECT DATEPART(YEAR,@YourDate)
GO
------------------------------------------------------------
--This is to get day,month,year
DECLARE @YourDate DATE 
    SET @YourDate = GETDATE()
SELECT DAY(@YourDate)
SELECT Month(@yourDate)
SELECT YEAR(@yourDate)

------------------------------------------------------------
GO
--This is to add/substract year,month,day to your given date
--This is DATEADD()
DECLARE @YourDate DATE 
    SET @YourDate = GETDATE()

SELECT DATEADD(DAY,1,@yourdate)
SELECT DATEADD(DAY,-1,@yourdate)

SELECT DATEADD(Month,1,@YourDate)
SELECT DATEADD(MONTH,-1,@YourDate)

SELECT DATEADD(YEAR,1,@YourDate)
SELECT DATEADD(YEAR,-1,@YourDate)
GO
------------------------------------------------------------
--This is to find the difference betweem year,month,day to your given date
--This is DATEDIFF()
DECLARE @YourDate DATE 
    SET @YourDate = GETDATE()

SELECT DATEDIFF(MONTH,'2025-01-01',@YourDate)
SELECT DATEDIFF(DAY,  '2025-01-01',@YourDate)
SELECT DATEDIFF(YEAR, '2024-01-01',@YourDate)

GO
------------------------------------------------------------
--This is to get the required format for your given date
--This is FORMAT()
DECLARE @YourDate DATE 
    SET @YourDate = GETDATE()
SELECT FORMAT(@YourDate,'yyy/MM/dd')
SELECT FORMAT(@YourDate,'dd/MM/yyyy')
SELECT FORMAT(@YourDate,'MM/dd/yyyy')

------------------------------------------------------------
--This is to get the name and week day and the result will be stored as string and the result from datepart will be string.
SELECT DATENAME(WEEKDAY,GETDATE()) 
SELECT DATENAME(MONTH,GETDATE()) 
SELECT DATENAME(YEAR,GETDATE()) 
------------------------------------------------------------
--This will get the end of monthe date/last day of the month.
SELECT EOMONTH(GETDATE())
------------------------------------------------------------




