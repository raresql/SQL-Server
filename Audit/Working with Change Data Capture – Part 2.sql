--Script Name: Working with Change Data Capture – Part 2
--Script Type: Audit
--Article: https://raresql.com/2014/04/29/sql-server-working-with-change-data-capture-part-2/
--Developed By: Muhammad Imran
--Date Created: 29 Apr 2014
--Date Modified: 12 Jan 2023


--Script


--Impact of INSERT STATEMENT in CDC

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO
--Insert a record in [HumanResources].[Department]
INSERT INTO [HumanResources].[Department]
           ([Name]
           ,[GroupName]
           ,[ModifiedDate])
     VALUES
           ('IT'
           ,'R & D'
           ,GETDATE())
GO

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM HumanResources.Department
GO
SELECT * FROM cdc.HumanResources_Department_CT
GO

--Impact of UPDATE STATEMENT in CDC

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO
--Update a record in [HumanResources].[Department]
USE [AdventureWorks2012]
GO
UPDATE [HumanResources].[Department]
   SET [Name] = 'IT Support'
   WHERE [DepartmentID]=17
GO

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM HumanResources.Department
GO
SELECT * FROM cdc.HumanResources_Department_CT
GO

--Impact of DELETE STATEMENT in CDC

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Update a record in [HumanResources].[Department]

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Delete record from table
DELETE from [HumanResources].[Department] WHERE [DepartmentID]=17
GO

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM HumanResources.Department
GO
SELECT * FROM cdc.HumanResources_Department_CT
GO


--End of script
