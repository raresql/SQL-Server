--Script Name: Convert short month name to month name
--Script Type: Solution
--Article: https://raresql.com/2013/05/31/sql-server-convert-short-month-name-to-month-name/
--Developed By: Muhammad Imran
--Date Created: 31 May 2013
--Date Modified: 5 Jan 2023

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_MonthName
(
    [ID] INT,
    [SHORT_MONTH_NAME] VARCHAR(3)
)
GO
 
--Insert records into table
INSERT INTO tbl_MonthName
SELECT 1, N'Jan' UNION ALL
SELECT 2, N'Feb' UNION ALL
SELECT 3, N'Mar' UNION ALL
SELECT 4, N'Apr' UNION ALL
SELECT 5, N'May' UNION ALL
SELECT 6, N'Jun' UNION ALL
SELECT 7, N'Jul' UNION ALL
SELECT 8, N'Aug' UNION ALL
SELECT 9, N'Sep' UNION ALL
SELECT 10, N'Oct' UNION ALL
SELECT 11, N'Nov' UNION ALL
SELECT 12, N'Dec'
GO
 
--Browse table
SELECT * FROM tbl_MonthName
GO

--End of sample

--Method-1
--Use DATENAME() function

--Use database tempdb
USE tempdb
GO

--Browse table
SELECT
    [ID]
    ,[SHORT_MONTH_NAME] AS [SHORT MONTH NAME]
    ,DATENAME(MONTH,CONVERT(
    DATETIME,'1'+ [SHORT_MONTH_NAME] + '1')) AS [MONTH NAME]
FROM tbl_MonthName
GO

--End of method-1

--Method-2
--Use CONCAT(), FORMAT() function

--Use database tempdb
USE tempdb
GO

--Browse table
SELECT
    [ID]
    ,[SHORT_MONTH_NAME] AS [SHORT MONTH NAME]
    ,FORMAT(CONVERT(
    DATETIME,CONCAT(1,[SHORT_MONTH_NAME],1)),'MMMM') AS [MONTH NAME]
FROM tbl_MonthName
GO

--End of method-2
