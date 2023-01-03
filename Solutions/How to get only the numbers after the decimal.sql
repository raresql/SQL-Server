--Script Name: How to get only the numbers after the decimal?
--Script Type: Solution
--Article: https://raresql.com/2013/12/16/sql-server-how-to-get-only-the-numbers-after-the-decimal/
--Developed By: Muhammad Imran
--Date Created: 16th December 2013
--Date Modified: 27th December 2022

--Sample

--Use temporary database
USE Tempdb
GO

--Create Sample table
CREATE TABLE tbl_sample
(
 [Col_ID] INT,
 [Col_Decimal] decimal(18,4)
);
GO

--Insert records into table
INSERT INTO tbl_sample VALUES (1,12345.9876)
INSERT INTO tbl_sample VALUES (2,-12345.9876)
INSERT INTO tbl_sample VALUES (3,123.45)
INSERT INTO tbl_sample VALUES (4,12.90)
GO

--End of Sample

--Example-1
--Without any function

--Use temporary database
USE Tempdb
GO

--Browse data
SELECT [Col_ID]
     , [Col_Decimal]
     , ([Col_Decimal]%1) As [Col_After_decimal]
FROM tbl_sample;
GO

--End of example-1

--Example-2
--Using CAST & ABS function

--Use temporary database
USE Tempdb
GO

--Browse data
SELECT [Col_ID]
     , [Col_Decimal]
     , ABS([Col_Decimal]) - CAST(ABS([Col_Decimal]) AS INT) As [Col_After_decimal]
FROM tbl_sample;
GO

--End of example-2
