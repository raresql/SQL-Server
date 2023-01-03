--Script Name:  How to sort month names in month order instead of alphabetical order – Part II
--Script Type: Solution
--Article: https://raresql.com/2013/06/27/sql-server-how-to-sort-month-names-in-month-order-instead-of-alphabetical-order-part-ii/
--Developed By: Muhammad Imran
--Date Created: 27 June 2013
--Date Modified: 28 Dec 2022

--Sample
--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_MonthName
(
    [ID] INT,
    [MONTH_NAME] VARCHAR(50),
    [YEAR] VARCHAR(4)
);
GO
 
--Insert records into table
INSERT INTO tbl_MonthName
SELECT 1, N'January',2014 UNION ALL
SELECT 2, N'July',2013 UNION ALL
SELECT 3, N'February',2014 UNION ALL
SELECT 4, N'September',2013 UNION ALL
SELECT 5, N'March',2014 UNION ALL
SELECT 6, N'April',2014 UNION ALL
SELECT 7, N'November',2013 UNION ALL
SELECT 8, N'May',2014 UNION ALL
SELECT 9, N'June',2014 UNION ALL
SELECT 10, N'August',2013 UNION ALL
SELECT 11, N'October',2013 UNION ALL
SELECT 12, N'December',2013;
GO
 
--Browse table
SELECT * FROM tbl_MonthName;
GO

--End of sample

--Example

--Use database tempdb
USE tempdb
GO

--Browse table
SELECT * FROM tbl_MonthName
ORDER BY [YEAR],MONTH('1' + [MONTH_NAME] +'00');

--End of example
