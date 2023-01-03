--Script Name: How to add st, nd, rd & th to dates
--Script Type: Solution
--Article: https://raresql.com/2013/08/17/sql-server-how-to-add-st-nd-rd-th-to-dates/
--Developed By: Muhammad Imran
--Date Created: 17 Aug 2013
--Date Modified: 27 Dec 2022

--Sample

--Use database tempdb
USE [tempdb]
GO

--Create table
CREATE TABLE [dbo].[tbl_sample](
[ID] [int] NULL,
[Date] [date] NULL
)
GO

--Insert records into table
INSERT INTO dbo.[tbl_sample]
SELECT 1 AS [ID] ,N'2013-08-01' AS [Date] UNION ALL
SELECT 2 AS [ID] ,N'2013-08-02' AS [Date] UNION ALL
SELECT 3 AS [ID] ,N'2013-08-03' AS [Date] UNION ALL
SELECT 4 AS [ID] ,N'2013-08-04' AS [Date] UNION ALL
SELECT 5 AS [ID] ,N'2013-08-05' AS [Date] UNION ALL
SELECT 6 AS [ID] ,N'2013-08-06' AS [Date] UNION ALL
SELECT 7 AS [ID] ,N'2013-08-07' AS [Date] UNION ALL
SELECT 8 AS [ID] ,N'2013-08-08' AS [Date] UNION ALL
SELECT 9 AS [ID] ,N'2013-08-09' AS [Date] UNION ALL
SELECT 10 AS [ID] ,N'2013-08-10' AS [Date] UNION ALL
SELECT 11 AS [ID] ,N'2013-08-11' AS [Date] UNION ALL
SELECT 12 AS [ID] ,N'2013-08-12' AS [Date] UNION ALL
SELECT 13 AS [ID] ,N'2013-08-13' AS [Date] UNION ALL
SELECT 14 AS [ID] ,N'2013-08-14' AS [Date] UNION ALL
SELECT 15 AS [ID] ,N'2013-08-15' AS [Date] UNION ALL
SELECT 16 AS [ID] ,N'2013-08-16' AS [Date] UNION ALL
SELECT 17 AS [ID] ,N'2013-08-17' AS [Date] UNION ALL
SELECT 18 AS [ID] ,N'2013-08-18' AS [Date] UNION ALL
SELECT 19 AS [ID] ,N'2013-08-19' AS [Date] UNION ALL
SELECT 20 AS [ID] ,N'2013-08-20' AS [Date] UNION ALL
SELECT 21 AS [ID] ,N'2013-08-21' AS [Date] UNION ALL
SELECT 22 AS [ID] ,N'2013-08-22' AS [Date] UNION ALL
SELECT 23 AS [ID] ,N'2013-08-23' AS [Date] UNION ALL
SELECT 24 AS [ID] ,N'2013-08-24' AS [Date] UNION ALL
SELECT 25 AS [ID] ,N'2013-08-25' AS [Date] UNION ALL
SELECT 26 AS [ID] ,N'2013-08-26' AS [Date] UNION ALL
SELECT 27 AS [ID] ,N'2013-08-27' AS [Date] UNION ALL
SELECT 28 AS [ID] ,N'2013-08-28' AS [Date] UNION ALL
SELECT 29 AS [ID] ,N'2013-08-29' AS [Date] UNION ALL
SELECT 30 AS [ID] ,N'2013-08-30' AS [Date] UNION ALL
SELECT 31 AS [ID] ,N'2013-08-31' AS [Date]

--End of sample

--Solution
--This script is compatible with SQL Server 2012 and above.

--Use database tempdb
USE [tempdb]
GO

--Browse table
--Use IIF() function
SELECT [ID],[Date],FORMAT([Date],'d'
+IIF(DAY([Date]) IN (1,21,31),'''st'''
,IIF(DAY([Date]) IN (2,22),'''nd'''
,IIF(DAY([Date]) IN (3,23),'''rd''','''th''')))
+' MMMM yyyy') As [Formatted Date]
FROM tbl_sample

--End of solution
