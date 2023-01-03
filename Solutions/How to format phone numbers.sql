--Script Name: How to format phone numbers
--Script Type: Solution
--Article: https://raresql.com/2013/08/30/sql-server-2012-how-to-format-phone-numbers/
--Developed By: Muhammad Imran
--Date Created: 30 Aug 2013
--Date Modified: 27 Dec 2022

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_sample
(
 [ID] INT,
 [Phone Numbers] INT
);
GO

--Insert records into table
INSERT INTO tbl_sample VALUES (1,3333333333);
GO
--Browse from table
SELECT * FROM tbl_sample;
GO

--End of sample

--Solution
--This script is compatible with SQL Server 2012 and above.

--Use database tempdb
USE tempdb
GO

--Browse table
--Use FORMAT()
SELECT [Phone Numbers]
	 , FORMAT([Phone Numbers],'###-###-####') AS [Formatted Phone]
FROM tbl_sample
UNION ALL
SELECT [Phone Numbers]
	 , FORMAT([Phone Numbers],'(###) ###-####') AS [Formatted Phone]
FROM tbl_sample
GO

--End of solution
