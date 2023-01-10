--Script Name: Multiple ways to convert month number to month name
--Script Type: Solution
--Article: https://raresql.com/2013/05/02/sql-server-multiple-ways-to-convert-month-number-to-month-name/
--Developed By: Muhammad Imran
--Date Created: 2 May 2013
--Date Modified: 5 Jan 2023

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_MonthNumber
(
 [ID] INT IDENTITY(1,1),
 [MONTH_NUMBER] INT
)
GO
 
--Insert records into table
INSERT INTO tbl_MonthNumber
SELECT 1 UNION ALL
SELECT 2 UNION ALL
SELECT 3 UNION ALL
SELECT 4 UNION ALL
SELECT 5 UNION ALL
SELECT 6 UNION ALL
SELECT 7 UNION ALL
SELECT 8 UNION ALL
SELECT 9 UNION ALL
SELECT 10 UNION ALL
SELECT 11 UNION ALL
SELECT 12
 
GO

--Browse table
SELECT * FROM tbl_MonthNumber
GO

--End of sample

--Method-1

--Use database tempdb
USE tempdb 
GO 
SELECT [MONTH_NUMBER] 
,DATENAME(MONTH,DATEADD(MONTH, [MONTH_NUMBER] , 0 )-1) 
AS [MONTH_NAME] 
FROM tbl_MonthNumber
GO

--End of method-1

--Method-2

--Use database tempdb
USE tempdb
GO
SELECT [MONTH_NUMBER]
,DATENAME(MONTH,DATEFROMPARTS(1900, [MONTH_NUMBER] , 1 ))
AS [MONTH_NAME]
FROM tbl_MonthNumber

--End of method-2
