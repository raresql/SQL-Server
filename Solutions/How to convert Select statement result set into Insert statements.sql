-- Script Name: How to convert Select statement result set into Insert statements
-- Script Type: Solution
-- Developed By: Muhammad Imran
-- Date Created: 11th July 2014
-- Date Modified: 24th Dec 2022

-- Create Sample

-- Use AdventureWorks Database
USE [AdventureWorks2012]
GO

-- Browse Data
SELECT [DepartmentID]
     , [Name] + ' Department' As [Name]
     , [GroupName]
     , Getdate() As [ModifiedDate]
FROM [HumanResources].[Department];
GO

-- End of Sample

-- Old Approach
-- Example-1
-- Using String concatenation 

-- Use AdventureWorks database
USE [AdventureWorks2012]
GO

-- Browse Data, concatenate & insert the result set
SELECT
     'INSERT INTO tbl_sample ([DepartmentID],[Name],[GroupName],[ModifiedDate])
      VALUES(' + CONVERT(VARCHAR(50),[DepartmentID])
     + ',''' + [Name] + ' Department'' ,'
     + ''''+ [GroupName] + ''','
     + ''''+ CONVERT(VARCHAR(50),GETDATE(),120) + ''')'
FROM [HumanResources].[Department];
GO

-- End of example-1
-- End of Old Approach

-- New Approach
-- Example-2
-- Using Generate Script 

-- Use AdventureWorks database
USE [AdventureWorks2012]
GO

-- Browse & insert data
SELECT [DepartmentID]
     , [Name] + ' Department' As [Name]
     , [GroupName]
     , Getdate() As [ModifiedDate]
INTO [tbl_Department_Sample]  -- Result set inserted in a table
FROM [HumanResources].[Department];
GO
-- End of example-2
-- End of New Approach
