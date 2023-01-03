--Script Name: How to insert a string value with an apostrophe (single quote) in a column
--Script Type: Solution
--Article: https://raresql.com/2013/06/13/sql-server-how-to-insert-a-string-value-with-an-apostrophe-single-quote-in-a-column/
--Developed By: Muhammad Imran
--Date Created: 13 June 2013
--Date Modified: 28 Dec 2022

--Step-1

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_sample
(
  [ID] INT,
  [Name] VARCHAR(50)
);
GO

--End of step-1

--Step-2

--Use database tempdb
USE tempdb
GO

--Insert records into table
INSERT INTO tbl_sample VALUES (1,'Irwin D Mello');
GO

--End of step-2

--Step-3
--Use database tempdb
USE tempdb
GO

--Insert records into table
INSERT INTO tbl_sample VALUES (1,'Irwin D''Mello');
GO

--End of step-3

--Step-4
--Use database tempdb
USE tempdb
GO

--Browse table
SELECT * FROM tbl_sample;
GO

--End of step-4
