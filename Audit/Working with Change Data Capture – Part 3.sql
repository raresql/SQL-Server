--Script Name: Working with Change Data Capture – Part 3
--Script Type: Audit
--Article: https://raresql.com/2014/05/04/sql-server-working-with-change-data-capture-part-3/
--Developed By: Muhammad Imran
--Date Created: 4 May 2014
--Date Modified: 12 Jan 2023

--Step-1

--NO Script

--End of step-1
--Step-2

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
sys.sp_cdc_help_change_data_capture
GO

--End of step-2

--Step-3

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Execute sys.sp_cdc_disable_table
EXEC sys.sp_cdc_disable_table
@source_schema = N'HumanResources',
@source_name   = N'Department',
@capture_instance = N'HumanResources_Department'
GO

--End of step-3

--Step-4

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Execute sys.sp_cdc_disable_db
EXEC sys.sp_cdc_disable_db
GO

--End of step-4
