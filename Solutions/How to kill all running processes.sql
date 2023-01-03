-- Script Name: How to kill all running processes
-- Script Type: Solution
-- Developed By: Muhammad Imran
-- Date Created: 01st April 2014
-- Date Modified: 24th Dec 2022


-- Script
-- To kill all running processes

-- Use master databases
USE master
GO

-- Declare Variables
DECLARE @SQL_String VARCHAR(MAX)
DECLARE @Database_id INT
 
-- DO NOT forget to change database name in give below statement
-- Set variable values
SET @Database_id=DB_ID('AdventureWorks2012')
SET @SQL_String=''

-- Browse processes that needs to be killed 
SELECT @SQL_String=@SQL_String + 'KILL '
       + COALESCE(CONVERT(VARCHAR(5),[session_id])+ '; ','')
FROM sys.dm_exec_sessions
WHERE database_id =@Database_id;
 
--PRINT @SQL_String
EXEC (@SQL_String);
GO

-- End of Script
