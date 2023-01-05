--Script Name: ‘TRY_CONVERT’ is not a recognized built-in function name.
--Script Type: Error
--Article: https://raresql.com/2015/04/15/sql-server-fix-error-195-try_convert-is-not-a-recognized-built-in-function-name/
--Developed By: Muhammad Imran
--Date Created: 15th April 2015
--Date Modified: 29th Dec 2022

--Error

--Use SampleDB database
-USE SampleDB
GO

--Use Try_Convert() function
SELECT TRY_CONVERT(datetime2, '12/31/2010') AS Result;
GO
SELECT @@VERSION
GO

--OUTPUT returns ‘TRY_CONVERT’ is not a recognized built-in function name.

--End of Error

--Solution

--Step-1
--Check compatibility

--Use SampleDB database
USE SampleDB;
GO

--Check compatibility
SELECT compatibility_level
FROM sys.databases WHERE name = 'SampleDB';
GO

--End of step-1

--Step-2
--Change compatibility

--Use master database
USE master
GO

--Set new compatibility
ALTER DATABASE SampleDB
SET COMPATIBILITY_LEVEL = 120;
GO

--End of Step-2

--Step-3
--Use TRY_CONVERT

--Use SampleDB database
USE SampleDB
GO

--Use Try_Convert() function
SELECT TRY_CONVERT(datetime2, '12/31/2010') AS Result;
GO

--End of step-3
