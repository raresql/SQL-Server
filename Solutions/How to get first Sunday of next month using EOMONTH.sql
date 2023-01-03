--Script Name: How to get first Sunday of next month using EOMONTH
--Script Type: Solution
--Article: https://raresql.com/2014/01/07/sql-server-how-to-get-first-sunday-of-next-month-using-eomonth/
--Developed By: Muhammad Imran
--Date Created: 7th January 2014
--Date Modified: 27th December 2022

--Sample

--Use temporary database
USE tempdb
GO

--Create Sample table
CREATE TABLE tbl_Sample
(
   [ID] INT
 , [Date] DATETIME
);
GO

--Insert records into the table
INSERT INTO tbl_Sample VALUES (1,'2013-01-05')
INSERT INTO tbl_Sample VALUES (2,'2013-02-01')
INSERT INTO tbl_Sample VALUES (3,'2013-05-05')
INSERT INTO tbl_Sample VALUES (4,'2013-07-20')
INSERT INTO tbl_Sample VALUES (5,'2013-08-28');
GO

--End of Sample

--Example-1
--Use EOMONTH

--Use temporary database
USE tempdb
GO

--Use EOMONTH() function
SELECT DATEADD(DAY,8-DATEPART(WEEKDAY,DATEADD(DAY,1,EOMONTH([Date]))), 
               EOMONTH([Date])) AS [First Sunday of the next month]
FROM tbl_Sample;
GO

--End of example-1

--Example-2
--Use Traditional Method

--Use temporary database
USE tempdb
GO

--Use Convert() & Date() function
SELECT CONVERT(DATE,DATEADD(DAY,8-DATEPART(WEEKDAY,DATEADD(MONTH,DATEDIFF(MONTH, 0, [Date])+1,0))
,DATEADD(MONTH,DATEDIFF(MONTH, 0, [Date])+1, -1))) AS [First Sunday of the next month]
FROM tbl_Sample;
GO
--End of example-2

