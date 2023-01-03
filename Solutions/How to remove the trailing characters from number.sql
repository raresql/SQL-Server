--Script Name: How to remove the trailing characters from number
--Script Type: Solution
--Article: https://raresql.com/2013/10/28/sql-server-how-to-remove-the-trailing-characters-from-number/
--Developed By: Muhammad Imran
--Date Created: 28 Oct 2013
--Date Modified: 27 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
DECLARE @tbl_sample TABLE
(
 ID INT,
 Varchar_col VARCHAR(10)
)
--Insert records in the table
INSERT INTO @tbl_sample VALUES (1,'12.9 mph')
INSERT INTO @tbl_sample VALUES (2,NULL)
INSERT INTO @tbl_sample VALUES (3,'45')
INSERT INTO @tbl_sample VALUES (4,'90 mph')
 
--Browse the table
SELECT * FROM @tbl_sample

--End of sample

--Solution

--Browse table

--Use LEFT(), DATALENGTH(), REVERSE() function
SELECT ID
	 , Varchar_col
	 , LEFT(Varchar_col
	 , DATALENGTH(Varchar_col)-(PATINDEX('%[0-9]%'
	 , REVERSE(Varchar_col))-1)) AS [Number]
FROM @tbl_sample;

--End of solution
