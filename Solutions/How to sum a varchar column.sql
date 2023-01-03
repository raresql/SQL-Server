--Script Name: How to sum a varchar column
--Script Type: Solution
--Article: https://raresql.com/2013/06/06/sql-server-how-to-sum-a-varchar-column/
--Developed By: Muhammad Imran
--Date Created: 6 June 2013
--Date Modified: 28 Dec 2022

--Sample
--Step-1

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_sample
(
 [ID] INT,
 [Column_varchar] VARCHAR(10)
);
GO

--End of step-1

--Step-2
--Insert records into table
INSERT INTO tbl_sample VALUES (1,12345)
INSERT INTO tbl_sample VALUES (2,1.234)
INSERT INTO tbl_sample VALUES (3,'a64')
INSERT INTO tbl_sample VALUES (4,'1,200');
GO

--End of step-2

--Step-3

--Browse table
SELECT * FROM tbl_sample;
GO

--End of step-3

--End of sample

--Step-4

--Use database tempdb
USE tempdb
GO
SELECT (CASE WHEN ISNUMERIC([Column_varchar])=1 THEN CONVERT(MONEY
	 , [Column_varchar]) ELSE 0 END)
AS [Converted to Numeric]
FROM tbl_sample;
GO

--End of step-4

--Step-5

--Browse table
--Use SUM(), CONVERT() function

SELECT SUM((CASE WHEN ISNUMERIC([Column_varchar])=1
THEN CONVERT(MONEY,[Column_varchar]) ELSE 0 END))
AS [Converted to Numeric]
FROM tbl_sample;
GO

--End of step-5
