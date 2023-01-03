--Script Name: How to extract numeric and special characters separately
--Script Type: Solution
--Article: https://raresql.com/2013/06/11/sql-server-how-to-extract-numeric-and-special-characters-separately/
--Developed By: Muhammad Imran
--Date Created: 11 June 2013
--Date Modified: 28 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_sample
(
  [ID] INT,
  [Curreny] VARCHAR(10));
GO

--Insert records into table
INSERT INTO tbl_sample VALUES (1,'£ 12.95')
INSERT INTO tbl_sample VALUES (2,'$ 20.38')
INSERT INTO tbl_sample VALUES (3,'Rs176.34')
INSERT INTO tbl_sample VALUES (4,'€58')
INSERT INTO tbl_sample VALUES (5,'¥ 33.3')
INSERT INTO tbl_sample VALUES (6,'97800');
GO

--Browse table
SELECT * FROM tbl_sample;
GO

--End of sample

--Example

--Browse table
SELECT [ID]
     , [Curreny]
     , LEFT([Curreny],PATINDEX('%[0-9]%',[Curreny])-1) AS [Currency Symbol]
     , SUBSTRING([Curreny],PATINDEX('%[0-9]%',[Curreny]),LEN([Curreny])) AS [Numbers]
FROM tbl_sample;

--End of example
