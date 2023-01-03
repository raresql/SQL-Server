--Script Name: How to check date is End of Month date or not
--Script Type: Solution
--Article: https://raresql.com/2013/09/30/sql-server-2012-how-to-check-date-is-end-of-month-date-or-not/
--Developed By: Muhammad Imran
--Date Created: 30th September 2013
--Date Modified: 27th December 2022


--Create Sample

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
INSERT INTO tbl_Sample VALUES (1,'2013-01-01')
INSERT INTO tbl_Sample VALUES (2,'2013-03-31')
INSERT INTO tbl_Sample VALUES (3,'2013-10-10')
INSERT INTO tbl_Sample VALUES (4,'2013-12-31');
GO

--End of Sample

--Example-1

--Use database tempdb
USE tempdb
GO

--Browse data
SELECT [ID]
     , [Date]
     , (CASE WHEN CONVERT(varchar(11)
       ,DATEADD(MONTH, DATEDIFF(MONTH, 0, [Date])+1, -1),120)=[Date]
       THEN 'Month End' ELSE 'Not a Month End' END) As [Result]
FROM tbl_Sample;
GO

--End of example-1

--Example-2

--This script is compatible with SQL Server 2012 and above.
--Use database tempdb
USE tempdb
GO

--Browse data
SELECT [ID]
     , [Date]
     , IIF(EOMONTH([Date])=[Date],'Month End','Not a Month End') As [Result]
FROM tbl_Sample;
GO

--End of Example-2
