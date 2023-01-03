--Script Name: How to Insert & view multiline text in any varchar field
--Script Type: Solution
--Article: https://raresql.com/2013/12/26/sql-server-how-to-insert-view-multiline-text-in-any-varchar-field/
--Developed By: Muhammad Imran
--Date Created: 26th December 2013
--Date Modified: 27th December 2022

--Sample

--Use database tempdb
USE Tempdb
GO

--Create sample table
CREATE TABLE tbl_sample
(
   [Col_ID] INT
 , [Col_varchar] varchar(50)
);
GO

--End of sample

--Example-1
--Use Varchar datatype

--Use database tempdb
USE Tempdb
GO

--Insert records into table
INSERT INTO tbl_sample VALUES (1,'This is a sample
comment on raresql.com to demonstrate
multiline text');
GO

--Browse table
SELECT * FROM tbl_sample;
GO

--End of example-1
