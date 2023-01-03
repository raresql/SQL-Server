--Script Name: How to Return 0 instead of NULL in a query resultset
--Script Type: Solution
--Article: https://raresql.com/2014/01/17/sql-server-how-to-return-0-instead-of-null-in-a-query-resultset/
--Developed By: Muhammad Imran
--Date Created: 17th January 2014
--Date Modified: 27th December 2022

--Sample

--Create Sample table
DECLARE @tbl_sample TABLE
(
   [ID] INT
 , [Name] VARCHAR(50)
 , [Code] INT
);

--Insert records into table
INSERT INTO @tbl_sample VALUES(1,'Bob',1234)
INSERT INTO @tbl_sample VALUES(2,'Sandra',NULL)
INSERT INTO @tbl_sample VALUES(3,'Mike',NULL);

--Browse data 
SELECT * FROM @tbl_sample;
GO

--End of Sample

--Example-1
--Use ISNULL() function (a SQL Server built-in function). 

--Browse data
SELECT [ID]
     , [Name]
     , ISNULL([Code],0) AS [Code]
FROM @tbl_sample;
GO

--End of example-1

--Example-2
--Use COALESCE() function (a SQL Server built-in function).

--Browse data
SELECT [ID]
     , [Name]
     , COALESCE([Code],0) AS [Code]
FROM @tbl_sample;
GO
--End of example-2

--Example-3
--Use CASE STATEMENT (a SQL Server expression).

--Browse data
SELECT [ID]
     , [Name]
     , CASE WHEN [Code] is NULL THEN 0 ELSE [Code] END 
     As [Code]
FROM @tbl_sample;
GO

--End of Example-3
