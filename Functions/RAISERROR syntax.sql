--Script Name: RAISERROR syntax
--Script Type: Error
--Article: https://raresql.com/2013/06/01/sql-server-2012-discontinued-functionality-raiserror-syntax/
--Developed By: Muhammad Imran
--Date Created: 1 June 2013
--Date Modified: 7 Jan 2023

--Code in earlier version of SQL

--This script is compatible with SQL Server 2005/ 2008.

--Use database tempdb
USE tempdb
GO
RAISERROR 14243 'This is a test message'
GO

--End of code in earlier version of SQL

--Execute in SQL 2012

---Use database tempdb
--This script is NOT compatible with SQL Server 2012.

USE tempdb
GO
RAISERROR 14243 'This is a test message'
GO

--Step-1

--Execute sys.sp_addmessage
EXEC sys.sp_addmessage
@msgnum   = 80000
,@severity = 10
,@msgtext  = N'This is a test message.'
,@lang = 'us_english';

--End of step-1

--Step-2

--Use database tempdb
USE tempdb
GO
RAISERROR (80000, -- Message id,
10, -- Severity,
1) -- State
GO

--End of step-2

--Cleaning

sp_dropmessage @msgnum = 80000;
GO

--End of cleaning
