--Script Name: String comparison as a Boolean in Select statement
--Script Type: Solution
--Article: https://raresql.com/2013/07/24/sql-server-string-comparison-as-a-boolean-in-select-statement/
--Developed By: Muhammad Imran
--Date Created: 24 Jul 2013
--Date Modified: 10 Jan 2023

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_sample
(
[ID] int,
[Name] varchar(50),
[Status] varchar(50)
)
GO

--Insert records into table
INSERT INTO tbl_sample VALUES (1,'SQL SERVER 2000','Inactive')
INSERT INTO tbl_sample VALUES (2,'SQL SERVER 2005','Active')
INSERT INTO tbl_sample VALUES (3,'SQL SERVER 2008','Active')
INSERT INTO tbl_sample VALUES (4,'SQL SERVER 2012','Active')
GO

--Browse table
SELECT * FROM tbl_sample
GO

--End of sample

--Solution-1
--This solution is compatibile with SQL Server 2005 and above.
-Browse table
SELECT
[ID]
,[NAME]
,[STATUS]
,(CASE WHEN [STATUS]='Active' THEN 1 ELSE 0 END) [Boolean Status]
FROM tbl_sample
GO

--End of solution-1

--Solution-2

--This solution is compatibile with SQL Server 2012 and above.
SELECT
[ID]
,[NAME]
,[STATUS]
,IIF([STATUS]='Active', 1,0) [Boolean Status]
FROM tbl_sample
GO

--End of solution-2
