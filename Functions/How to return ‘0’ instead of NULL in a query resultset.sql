--Script Name: How to return ‘0’ instead of NULL in a query resultset
--Script Type: Solution
--Article: https://raresql.com/2014/01/17/sql-server-how-to-return-0-instead-of-null-in-a-query-resultset/
--Developed By: Muhammad Imran
--Date Created: 17 Jan 2014
--Date Modified: 5 Jan 2023

--Sample

--Declare table variable
DECLARE @tbl_sample TABLE
(
 [ID] INT,
 [Name] VARCHAR(50),
 [Code] INT
)
 
--Insert record into table
INSERT INTO @tbl_sample VALUES(1,'Bob',1234)
INSERT INTO @tbl_sample VALUES(2,'Sandra',NULL)
INSERT INTO @tbl_sample VALUES(3,'Mike',NULL)

--Browse table 
SELECT * FROM @tbl_sample

--End of sample

--Method-1

SELECT [ID]
	 , [Name]
	 , ISNULL([Code],0) AS [Code]
FROM @tbl_sample

--End of method-1

--Method-2

--Use COALESCE() function
SELECT [ID]
	 , [Name]
	 , COALESCE([Code],0) AS [Code]
FROM @tbl_sample

--End of method-2

--Method-3

--Use CASE Statement
SELECT [ID]
	 , [Name]
	 , CASE WHEN [Code] is NULL THEN 0 ELSE [Code] END
As [Code]
FROM @tbl_sample

--End of method-3
