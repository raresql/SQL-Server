--Script Name: Change data capture instance has not been enabled for the source table
--Script Type: Error
--Article: https://raresql.com/2014/05/12/sql-server-2012-fix-error-22960-change-data-capture-instance-has-not-been-enabled-for-the-source-table/
--Developed By: Muhammad Imran
--Date Created: 12 May 2014
--Date Modified: 5 Jan 2023

--Error Message

Change data capture instance ‘%s’ has not been enabled for the source table ‘%s.%s’. Use sys.sp_cdc_help_change_data_capture to verify the capture instance name and retry the operation.

--End of error message

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Execute sys.sp_cdc_disable_table
EXEC sys.sp_cdc_disable_table
@source_schema = N'HumanResources',
@source_name   = N'Department',
@capture_instance = NULL
GO

--End of error generation

--Error resolution

--Step-1

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Execute sys.sp_cdc_help_change_data_capture
sys.sp_cdc_help_change_data_capture
GO

--End of step-1

--Step-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Execute sys.sp_cdc_disable_table
EXEC sys.sp_cdc_disable_table
@source_schema = N'HumanResources',
@source_name   = N'Department',
@capture_instance = N'HumanResources_Department'
GO

--End of step-2

--End of error resolution
