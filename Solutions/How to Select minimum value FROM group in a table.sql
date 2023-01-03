--Script Name: How to Select minimum value FROM group in a table
--Script Type: Solution
--Article: https://raresql.com/2013/12/10/sql-server-how-to-SELECT-minimum-value-FROM-group-in-a-table/
--Developed By: Muhammad Imran
--Date Created: 10th December 2013
--Date Modified: 27th December 2022


--Sample

--This script is compatible with SQL Server 2005 and above.
--Create table
CREATE Table [Employee]
(
   [Employee ID] int
 , [Employee Name] varchar(50)
 , [Department] varchar(50)
 , [Salary] int
);
GO

--Insert records into table
INSERT INTO [Employee] VALUES (1,'Ali','IT',10000)
INSERT INTO [Employee] VALUES (2,'Derek','IT',6000)
INSERT INTO [Employee] VALUES (3,'Jack','IT',9000)
INSERT INTO [Employee] VALUES (4,'Simon','Marketing',5000)
INSERT INTO [Employee] VALUES (5,'Monica','Marketing',7500)
INSERT INTO [Employee] VALUES (6,'Sandra','Marketing',8000);
GO

--End of Sample

--Example-1
--Use Row_Number() function

--Create CTE
;With CTE AS
(
SELECT Row_Number() Over (Partition By Department Order By Salary) AS [S.No]
     , [Employee ID]
     , [Employee Name]
     , [Department]
     , [Salary]
FROM dbo.[Employee]
)
SELECT [Employee ID]
     , [Employee Name]
     , [Department]
     , [Salary]
FROM CTE
WHERE [S.No]=1;
GO

--End of example-1

--Example-2
--Use First_Value function

--This script is compatible with SQL Server 2012 and above.
;WITH CTE AS
(
SELECT [Employee ID]
     , [Employee Name]
     , [Department]
     , [Salary]
     , FIRST_Value([Salary]) Over (Partition By [Department] Order By [Salary]) AS [minimum Value]
FROM dbo.[Employee]
)
SELECT [Employee ID]
     , [Employee Name]
     , [Department]
     , [Salary]
FROM CTE
Where [Salary]=[minimum Value];
GO

--End of Example-2
