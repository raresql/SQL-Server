--Script Name: Database name cannot be specified for the sequence object in default constraints.
--Script Type: Error
--Article: https://raresql.com/2013/10/24/sql-server-2012-fix-error-11730-database-name-cannot-be-specified-for-the-sequence-object-in-default-constraints/
--Developed By: Muhammad Imran
--Date Created: 24 Oct 2013
--Date Modified: 30 Dec 2022

--Error
--Database name cannot be specified for the sequence object in default constraints.
 
 --End of error
 
--Error generation
--Sample
 
--This script is compatible with SQL Server 2012 and above
--Create a sequence object in AdventureWorks2012 database.

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Create sequence
CREATE SEQUENCE [dbo].[Seq_sample]
AS [int]
START WITH 1
INCREMENT BY 1
GO
 
--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE dbo.tbl_sample
(
[ID] int,
[Name] varchar(100)
)
GO
 
--Alter table
ALTER TABLE dbo.tbl_sample
ADD CONSTRAINT Const_tbl_sample DEFAULT
(NEXT VALUE FOR AdventureWorks2012.[dbo].[Seq_Sample])
FOR [ID];
GO

--End of sample
--End of error generation

--Error resolution

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE dbo.tbl_sample
(
[ID] int,
[Name] varchar(100)
)
GO

--Insert records into table
INSERT INTO tbl_sample 
VALUES (NEXT VALUE FOR AdventureWorks2012.[dbo].[Seq_Sample],'raresql')
GO

--End of error resolution
