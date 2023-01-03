--Script Name: Simple way to add variables in the dynamic SQL
--Script Type: Solution
--Article: https://raresql.com/2013/09/07/sql-server-2012-simple-way-to-add-variables-in-the-dynamic-sql/
--Developed By: Muhammad Imran
--Date Created: 7 Sep 2013
--Date Modified: 27 Dec 2022

--Old approach

--This script is compatible with all versions of SQL Server

--Declare variables
DECLARE @SQL as varchar(max);
DECLARE @Datetime as datetime;

--Set values of variables
SET @Datetime='2005-07-01 00:00:00.000';
SET @SQL='SELECT * FROM Sales.SalesOrderHeader;

WHERE [OrderDate]=''' + CONVERT(varchar(50),@Datetime) + ''''

--Print and execute variable
PRINT @SQL
EXEC (@SQL)

--End of old approach

--New approach

--This script is compatible with SQL Server 2012 and above.

--Declare variables
DECLARE @SQL as varchar(max);
DECLARE @Datetime as datetime;

--Set values of variables
SET @Datetime='2005-07-01 00:00:00.000'
SET @SQL=CONCAT('SELECT * FROM Sales.SalesOrderHeader
WHERE [OrderDate]=','''',@Datetime,'''')

--Print and execute variable
PRINT @SQL
EXEC (@SQL)

--End of new approach
