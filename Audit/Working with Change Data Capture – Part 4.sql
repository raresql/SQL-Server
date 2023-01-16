--Script Name: Working with Change Data Capture – Part 4
--Script Type: Audit
--Article: https://raresql.com/2014/05/05/sql-server-working-with-change-data-capture-part-4-2/
--Developed By: Muhammad Imran
--Date Created: 7 May 2014
--Date Modified: 12 Jan 2023

--Step-1

--This script is compatible with SQL Server 2008 and above.

--Use database msdb
USE msdb
GO

--Browse table
SELECT [retention] As [Retention period in minutes]
,[retention]/60/24 As [Retention period in days]
FROM
dbo.cdc_jobs
WHERE job_type ='cleanup'
GO

--End of step-1

--Step-2

--This script is compatible with SQL Server 2008 and above.

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variables
DECLARE @New_retention_period_in_minutes AS SMALLINT
DECLARE @New_retention_period_in_days AS TINYINT
 
--Set the retention period for 10 days
SET @New_retention_period_in_days = 10
 
--Convert 10 days into minutes
SET @New_retention_period_in_minutes= @New_retention_period_in_days*60*24
 
--Select the total number of minutes in 10 days to check.
SELECT @New_retention_period_in_minutes
As [Retention period in minutes]
 
--Update minutes in the CDC job
EXECUTE sys.sp_cdc_change_job
    @job_type = N'cleanup',
    @retention = @New_retention_period_in_minutes;
GO

--End of step-2

--Step-3

--This script is compatible with SQL Server 2008 and above.

--Use database msdb
USE msdb
GO

--Browse table
SELECT [retention] As [Retention period in minutes]
,[retention]/60/24 As [Retention period in days]
FROM
dbo.cdc_jobs
WHERE job_type ='cleanup'
GO

--End of step-3

