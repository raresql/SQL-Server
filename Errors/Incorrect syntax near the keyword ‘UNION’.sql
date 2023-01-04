--Script Name: Incorrect syntax near the keyword ‘UNION’.
--Script Type: Error
--Article: https://raresql.com/2013/05/28/sql-server-fix-error-156-incorrect-syntax-near-the-keyword-union/
--Developed By: Muhammad Imran
--Date Created: 28 May 2013
--Date Modified: 30 Dec 2022

--Error
--Incorrect syntax near the keyword ‘UNION’.

--End of error

--Error generation
--Sample

--Use database tempdb
USE tempdb
GO
 
--Create tables
CREATE TABLE tbl_Sample1
(
 [ID] INT,
 [Grade] VARCHAR(50)
)
GO
CREATE TABLE tbl_Sample2
(
 [ID] INT,
 [Grade] VARCHAR(50)
)
 
--Insert records into tables
INSERT INTO tbl_Sample1 VALUES (1,'Grade A')
INSERT INTO tbl_Sample1 VALUES (2,'Grade B')
INSERT INTO tbl_Sample1 VALUES (3,'Grade C')
INSERT INTO tbl_Sample1 VALUES (4,'Grade D')
INSERT INTO tbl_Sample1 VALUES (5,'Grade E')
INSERT INTO tbl_Sample1 VALUES (6,'Grade F');
GO
INSERT INTO tbl_Sample2 VALUES (1,'1st')
INSERT INTO tbl_Sample2 VALUES (2,'2nd')
INSERT INTO tbl_Sample2 VALUES (3,'3rd')
INSERT INTO tbl_Sample2 VALUES (4,'4th')
INSERT INTO tbl_Sample2 VALUES (5,'5th');
GO

--Use database tempdb
USE tempdb
GO

--Browse tables
SELECT [ID]
	 , [Grade]
FROM tbl_Sample1
Order By [ID]
 
UNION ALL
 
SELECT [ID]
	 , [Grade]
FROM tbl_Sample2
Order By [ID]

--End of sample
--End of error generation

--Error resolution

--Use database tempdb
USE tempdb
GO
SELECT 'A' AS [Order ID]
     , [ID]
     , [Grade]
FROM tbl_Sample1
 
UNION ALL
 
SELECT
          'B' AS [Order ID]
        , [ID]
        , [Grade]
FROM tbl_Sample2
Order By [Order ID]

--End of error resolution
