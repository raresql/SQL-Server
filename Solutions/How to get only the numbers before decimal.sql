--Script Name: How to get only the numbers before decimal
--Script Type: Solution
--Article: https://raresql.com/2013/10/03/sql-server-how-do-i-get-only-the-numbers-before-the-decimal/
--Developed By: Muhammad Imran
--Date Created: 3rd October 2013
--Date Modified: 27th December 2022


--Create Sample

--Use database tempdb
USE Tempdb
GO

--Create Sample table
CREATE TABLE tbl_sample
(
   [Col_ID] INT
 , [Col_Decimal] decimal(18,4)
);
GO

--Insert records into the table
INSERT INTO tbl_sample VALUES (1,12345.9876)
INSERT INTO tbl_sample VALUES (2,-12345.9876)
INSERT INTO tbl_sample VALUES (3,123.45)
INSERT INTO tbl_sample VALUES (4,12.00);
GO

--End of Sample

--Example-1
--Without any function

--Use database tempdb
USE Tempdb
GO

--Browse table
SELECT [Col_ID]
     , [Col_Decimal]
     , [Col_Decimal] - ([Col_Decimal]%1) As [Col_Number]
FROM tbl_sample;
GO

--End of example-1

--Example-2
--Use Round() function

--Use database tempdb
USE Tempdb
GO

--Browse table
SELECT [Col_ID]
     , [Col_Decimal]
     , ROUND([Col_Decimal],0,1) As [Col_Number]
FROM tbl_sample
GO

--End of Example-2

--Example-3
--Use Cast() function

--Use database tempdb
USE Tempdb
GO

--Bowse table
SELECT [Col_ID]
     , [Col_Decimal]
     , CAST([Col_Decimal] AS INT) As [Col_Number]
FROM tbl_sample
GO

--End of Example-3
