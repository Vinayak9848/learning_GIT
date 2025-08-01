--Lets Create Partition

CREATE PARTITION FUNCTION Yearly_PT (DATE)
AS RANGE LEFT FOR VALUES ('2021-12-31','2022-12-31','2023-12-31','2024-12-31')

--Lets drop created Partition

DROP PARTITION FUNCTION Yearly_PT

--Now Lets add the file groups to the Partition

ALTER DATABASE AdventureWorks2022 ADD FILEGROUP YR_2021
ALTER DATABASE AdventureWorks2022 ADD FILEGROUP YR_2022
ALTER DATABASE AdventureWorks2022 ADD FILEGROUP YR_2023
ALTER DATABASE AdventureWorks2022 ADD FILEGROUP YR_2024

--Lets remove the created FileGroups
ALTER DATABASE AdventureWorks2022 REMOVE FILEGROUP YR_2021
ALTER DATABASE AdventureWorks2022 REMOVE FILEGROUP YR_2022
ALTER DATABASE AdventureWorks2022 REMOVE FILEGROUP YR_2023
ALTER DATABASE AdventureWorks2022 REMOVE FILEGROUP YR_2024

--Now Lets add the data files to the created file group 

ALTER DATABASE AdventureWorks2022 ADD FILE (NAME=YRF_2021,FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\YRF_2021.ndf') TO FILEGROUP YR_2021
ALTER DATABASE AdventureWorks2022 ADD FILE (NAME=YRF_2022,FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\YRF_2022.ndf') TO FILEGROUP YR_2022
ALTER DATABASE AdventureWorks2022 ADD FILE (NAME=YRF_2023,FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\YRF_2023.ndf') TO FILEGROUP YR_2023
ALTER DATABASE AdventureWorks2022 ADD FILE (NAME=YRF_2024,FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\YRF_2024.ndf') TO FILEGROUP YR_2024

--Lets remove the files added to the FG

ALTER DATABASE AdventureWorks2022 REMOVE FILE YRF_2021
ALTER DATABASE AdventureWorks2022 REMOVE FILE YRF_2022
ALTER DATABASE AdventureWorks2022 REMOVE FILE YRF_2023
ALTER DATABASE AdventureWorks2022 REMOVE FILE YRF_2024

--Lets creat the Partion Scheme

	
CREATE PARTITION  SCHEME PTS_Year_Scheme
AS PARTITION  Yearly_PT TO  (YR_2021,YR_2022,YR_2023,YR_2024,[Primary]) 

--Lets create a table

CREATE TABLE dbo.Orders_Partition(Id int,Name VARCHAR(10),OrderDate DATE) ON PTS_Year_Scheme (OrderDate)

