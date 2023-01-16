--Script Name: Working with Change Data Capture – Part 1
--Script Type: Audit
--Article: https://raresql.com/2014/04/14/sql-server-working-with-change-data-capture-part-1/
--Developed By: Muhammad Imran
--Date Created: 14 Apr 2014
--Date Modified: 12 Jan 2023

--Step-1

--Use database master
USE master
GO

--Browse table
SELECT database_id
	 , name
	 , is_cdc_enabled
FROM sys.databases
GO

--End of step-1

--Step-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

EXEC sys.sp_cdc_enable_db
GO

--End of step-2

--Step-3

--Use database master
USE master
GO

--Browse table
SELECT database_id
	 , name 
	 , is_cdc_enabled
FROM sys.databases
GO
--End of step-3

--Step-4

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT object_id
	 , SCHEMA_NAME(Schema_id) As [Schema Name]
	 , name As [Table Name]
	 , is_tracked_by_cdc
FROM sys.tables
GO

--End of step-4

--Step-5

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
 
EXEC sys.sp_cdc_enable_table
@source_schema = N'HumanResources',
@source_name = N'Department',
@role_name = NULL
GO

--End of step-5

--Step-6

--Use database AdventureWorks2012
--This script is compatible with SQL Server 2008 and above.
USE AdventureWorks2012
GO

--Browse table
SELECT object_id
	 , SCHEMA_NAME(Schema_id) As [Schema Name]
	 , name As [Table Name]
	 , is_tracked_by_cdc
FROM sys.tables
GO

--End of step-6

--Step-7

--Use database AdventureWorks2012

USE AdventureWorks2012
GO

--Browse table
SELECT * FROM cdc.hu

--End of step-7
