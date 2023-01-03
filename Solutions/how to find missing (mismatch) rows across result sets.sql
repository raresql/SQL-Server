--Script Name: Find missing (mismatch) rows across result sets
--Script Type: Solution
--Article: https://raresql.com/2014/03/12/sql-server-how-to-find-missing-mismatch-rows-across-result-sets/
--Developed By: Muhammad Imran
--Date Created: 12th March 2014
--Date Modified: 26th Dec 2022

--Sample Problem
--We usually use logical operators (NOT IN, Exists) to find the difference between two result sets. 
--However, if we need to match each row by each row & each column by each column 
--then it would be very difficult to achieve it via the same logical operators. A sample script is given below

--This script is compatible with SQL Server 2005
--Use AdevntureWorks database
USE [AdventureWorks2012]
GO

--Create a sample table
CREATE TABLE [HumanResources].[Department_Sample](
     [DepartmentID] [smallint] NOT NULL
  ,  [Name] [dbo].[Name] NOT NULL
  ,  [GroupName] [dbo].[Name] NOT NULL
  ,  [ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY];
GO
 
--Insert records into the sample table from actual table
INSERT INTO [HumanResources].[Department_Sample]
SELECT * FROM [HumanResources].[Department];
GO
 
--Update a single record in the sample table to differentiate it from actual
UPDATE [HumanResources].[Department_Sample]
SET [Name] = 'Business Development'
WHERE DepartmentID=2;
 
--Insert a record in the original table
INSERT INTO [HumanResources].[Department]
           ( [Name]
           , [GroupName]
           , [ModifiedDate])
     VALUES
           ( 'IT'
           , 'Executive General and Administration'
           , GETDATE());
GO

--Delete a record from the sample table
DELETE FROM [HumanResources].[Department_Sample]
WHERE [DepartmentID]=11;
GO

--Browse data
SELECT * FROM [HumanResources].[Department];
GO

--End of Sample Problem

--Solution
--Use Except Operator

--This script is compatible with SQL Server 2005
--Use AdventureWorks database
USE AdventureWorks2012
GO

--Browse data
SELECT * FROM [HumanResources].[Department]
EXCEPT
--Target table
SELECT * FROM [HumanResources].[Department_Sample];
GO

--End of solution
