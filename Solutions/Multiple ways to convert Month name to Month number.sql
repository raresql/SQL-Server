--Script Name: Multiple ways to convert Month name to Month number
--Script Type: Solution
--Article: https://raresql.com/2013/05/19/sql-server-multiple-ways-to-convert-month-name-to-month-number/
--Developed By: Muhammad Imran
--Date Created: 19 May 2013
--Date Modified: 28 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_MonthName
(
    [ID] INT,
    [MONTH_NAME] VARCHAR(50)
);
GO
 
--Insert records into table
INSERT INTO tbl_MonthName
SELECT 1, N'January' UNION ALL
SELECT 2, N'February' UNION ALL
SELECT 3, N'March' UNION ALL
SELECT 4, N'April' UNION ALL
SELECT 5, N'May' UNION ALL
SELECT 6, N'June' UNION ALL
SELECT 7, N'July' UNION ALL
SELECT 8, N'August' UNION ALL
SELECT 9, N'September' UNION ALL
SELECT 10, N'October' UNION ALL
SELECT 11, N'November' UNION ALL
SELECT 12, N'December';
GO
 
--Browse table
SELECT * FROM tbl_MonthName;
GO

--End of sample

--Method-1

--Use database tempdb
USE tempdb
GO

--Browse table
SELECT [ID]
     , [MONTH_NAME]       
     , MONTH('1' + [MONTH_NAME] +'00') AS [MONTH_NUMBER]
FROM tbl_MonthName
GO

--End of method-1

--Method-2

--Use database tempdb
USE tempdb
GO

--Browse table
SELECT [ID]
     , [MONTH_NAME]
     , MONTH(CONCAT(1,[MONTH_NAME],0)) AS [MONTH_NUMBER]
FROM tbl_MonthName;
GO

--End of method-2
