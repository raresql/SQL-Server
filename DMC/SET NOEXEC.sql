--Script Name: SET NOEXEC
--Script Type: DML P/C
--Article: https://raresql.com/2015/03/31/sql-server-set-noexec/
--Developed By: Muhammad Imran
--Date Created: 31 Mar 2015
--Date Modified: 12 Jan 2023

--Sample

--Use databaase AdventureWorks2014
USE AdventureWorks2014
GO

--Create a sample table
CREATE TABLE tbl_sample
(
 [ID] INT, 
 [Letter] VARCHAR(1)
)
GO

--Insert a record in the table
INSERT INTO tbl_sample VALUES (1,'A')
GO

--Browse the data
SELECT * FROM tbl_sample
GO

--End of sample


--Set NOEXEC ON

--Use databaase AdventureWorks2014
USE AdventureWorks2014
GO

--SET NOEXEC to ON
SET NOEXEC ON;
 
--Update the table
UPDATE tbl_sample SET [Letter]='B' WHERE [ID]=1
GO
--Delete the table
DELETE FROM tbl_sample  WHERE [ID]=1
GO
-- SET NOEXEC to OFF
SET NOEXEC OFF;
GO

--Use databaase AdventureWorks2014
USE AdventureWorks2014
GO

--Browse the data to check the impact.
SELECT * FROM tbl_sample
GO

