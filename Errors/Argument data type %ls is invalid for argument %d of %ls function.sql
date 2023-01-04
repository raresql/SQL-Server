--Script Name: Argument data type %ls is invalid for argument %d of %ls function
--Article: https://raresql.com/2013/08/27/sql-server-2012-fix-error-8116-argument-data-type-ls-is-invalid-for-argument-d-of-ls-function/
--Developed By: Muhammad Imran
--Date Created: 27 Aug 2013
--Date Modified: 30 Dec 2022

--Error
--Argument data type %ls is invalid for argument %d of %ls function.

--End of error

--Error generation

--Use database tempdb
USE tempdb
GO

--Declare variable
DECLARE @Varchar_Date AS varchar(11)

--Set value of variable
SET @Varchar_Date='2013-12-12'

--Browse data
SELECT FORMAT (@Varchar_Date,'D','ar-SA') AS [Arabic Culture]
GO

--End of error generation

--Error resolution

--Use database tempdb
USE tempdb
GO

--Declare variables
DECLARE @Varchar_Date AS varchar(11)
DECLARE @Date AS datetime

--Set values of variables
SET @Varchar_Date='2013-12-12'
Set @Date=CONVERT(datetime,@Varchar_Date)

--Browse data
SELECT FORMAT (@Date,'D','ar-SA') AS [Arabic Culture]
GO

--End of error resolution
