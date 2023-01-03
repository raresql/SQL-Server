--Script Name: How to count the total number of records in any table using OBJECTPROPERTYEX
--Script Type: Solution
--Article: https://raresql.com/2013/09/12/sql-server-2012-how-to-count-the-total-number-of-records-using-objectpropertyex/
--Developed By: Muhammad Imran
--Date Created: 12 Sep 2013
--Date Modified: 27 Dec 2022

--This script is compatible with SQL Server 2012 and above.
--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse tables
SELECT OBJECT_SCHEMA_NAME(OBJECT_ID) AS [Schema Name]
	 , name AS [Table Name]
	 , OBJECTPROPERTYEX(OBJECT_ID, N'Cardinality')
AS [Total No of Records]
FROM sys.tables;
GO

--End
