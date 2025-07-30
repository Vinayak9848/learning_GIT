SELECT * FROM  dbo.Employee
GO
/*Insert data into new table*/
--Method1
INSERT INTO dbo.Employee(EmpId,EmpName,EmpSalary,EmpAge,EmpBikeLicense) VALUES (1, 'John',5000,20,'A1123')

--Method2
INSERT INTO dbo.Employee(EmpId,EmpName,EmpSalary,EmpAge,EmpBikeLicense) VALUES (3, 'Jade',7000,22,'C1123'),
																			   (2, 'Jake',6000,21,'B1123')

GO
/*Delete from table*/
--Remove all records
DELETE FROM dbo.Employee 

--Remove where EmpID =1 
DELETE FROM dbo.Employee WHERE EmpID= 1--Remove where EmpID =1 

/*Update the table*/

--Method1
UPDATE dbo.employee
   set EmpBikeLicense='A1122'
WHERE EmpID =1

--Method2
UPDATE A
   SET EmpBikeLicense='A1122'
  FROM dbo.Employee A
 WHERE EmpId=1






