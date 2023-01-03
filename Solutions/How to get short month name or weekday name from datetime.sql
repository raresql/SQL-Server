--Script Name: How to get short month name or weekday name from datetime
--Script Type: Solution
--Article: https://raresql.com/2013/05/23/sql-server-how-to-get-short-month-name-weekday-name-from-datetime/
--Developed By: Muhammad Imran
--Date Created: 23 May 2013
--Date Modified: 28 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_Sample
(
 [ID] INT,
 [Date] DATETIME
);
GO

--Insert records into table
INSERT INTO tbl_Sample VALUES (1,'2013-01-01')
INSERT INTO tbl_Sample VALUES (2,'2013-02-02')
INSERT INTO tbl_Sample VALUES (3,'2013-03-03')
INSERT INTO tbl_Sample VALUES (4,'2013-04-04')
INSERT INTO tbl_Sample VALUES (5,'2013-05-05')
INSERT INTO tbl_Sample VALUES (6,'2013-06-06')
INSERT INTO tbl_Sample VALUES (7,'2013-07-07');
GO

--End of sample

--Method-1

--Use database tempdb
USE tempdb
GO

--Browse table
SELECT [ID]
     , [Date]
     , LEFT(DATENAME(MONTH,[Date]),3) AS [Short Month Name]
     , LEFT(DATENAME(WEEKDAY,[Date]),3) AS [Short Weekday Name]
FROM tbl_Sample;
GO

--End of method-1

--Method-2

--Use database tempdb
USE tempdb
GO

--Browse table
SELECT [ID]
     , [Date]
     , FORMAT([Date],'MMM') AS [Short Month Name]
     , FORMAT([Date],'ddd') AS [Short Weekday Name]
FROM tbl_Sample;
GO

--End of method-2
