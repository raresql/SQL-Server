--Script Name: How can I select few columns from the result set of a stored procedure
--Script Type: Solution
--Article: https://raresql.com/2013/06/25/sql-server-how-can-i-select-few-column-from-the-result-set-of-a-stored-procedure/
--Developed By: Muhammad Imran
--Date Created: 25 June 2013
--Date Modified: 28 Dec 2022

--Method-1
--Step-1

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Create table
CREATE TABLE #TEMP
(
	[RecursionLevel] INT
  , [OrganizationNode] VARCHAR(50)
  , [ManagerFirstName] NVARCHAR(50)
  , [ManagerLastName]  NVARCHAR(50)
  , [BusinessEntityID] INT
  , [FirstName] NVARCHAR(50)
  , [LastName] NVARCHAR(50)
)
GO

--End of step-1

--Step-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Insert records into table
INSERT INTO #TEMP EXEC [dbo].[uspGetManagerEmployees] 16
GO

--End of step-2

--Step-3

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT [BusinessEntityID]
	 , [FirstName]
	 , [LastName]
FROM #TEMP;
GO

--End of step-3
--End of method-1

--Method-2

--Browse table
SELECT [BusinessEntityID]
	 , [FirstName]
	 , [LastName]
FROM OPENROWSET('SQLNCLI', 'Server=(local);uid=test;pwd=test',
     'EXEC AdventureWorks2012.[dbo].[uspGetManagerEmployees] 16');
GO

--End of method-2
