USE SQLPractice
GO

CREATE TABLE dbo.Employee (
                           EmpID INT NOT NULL,
						   EmpName VARCHAR(20),
						   EmpSalary INT,
						   EmpAge INT,
						   EmpCountry VARCHAR(10),
						   EmpBikeLicense VARCHAR(20)
						   )

/*
Step1:Here we created a table called dbo.Employee table with the columns (EmpId,EmpName,EmpSalary,EmpAge)
Step2:Now lets add constraint to the table using the ALTER keyword.Lets make the EmpId Primary Key,EmpSlalary!=0 and EmpAge>18
*/

ALTER TABLE dbo.Employee ADD CONSTRAINT Pk_EmpID PRIMARY KEY (EmpID) 
ALTER TABLE dbo.Employee ADD CONSTRAINT CK_EmpSal CHECK (EmpSalary>=0)
ALTER TABLE dbo.Employee ADD CONSTRAINT CK_Age    CHECK (EmpAge>18)
ALTER TABLE dbo.Employee ADD CONSTRAINT DF_EmpCountry DEFAULT 'India' FOR EmpCountry
ALTER TABLE dbo.Employee ADD CONSTRAINT UQ_EmpBikeLicense UNIQUE (EmpBikeLicense) 

/*Lets drop the table and the constrainsts created*/

DROP TABLE dbo.Employee

ALTER TABLE dbo.Employee DROP CONSTRAINT Pk_EmpID














