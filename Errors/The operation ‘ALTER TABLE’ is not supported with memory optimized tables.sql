--Script Name: The operation ‘ALTER TABLE’ is not supported with memory optimized tables.
--Script Type: Error
--Article: https://raresql.com/2013/09/03/sql-server-hekaton-fix-error-10770-the-operation-alter-table-is-not-supported-with-memory-optimized-tables/
--Developed By: Muhammad Imran
--Date Created: 03 Sep 2013
--Date Modified: 30 Dec 2022

--Error
--The %S_MSG ‘%ls’ is not supported with memory optimized tables.

--End of error

--Error generation

--Sample

--Use database Sample_DB
USE Sample_DB
GO

--Created table
CREATE TABLE tbl_sample
(
 [ID] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH
 WITH (BUCKET_COUNT = 100000),
 [Name] VARCHAR(50) NOT NULL
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO

--End of sample

--Alter table
ALTER TABLE tbl_sample ADD [CreationDateTime] datetime NULL

--End of error generation

--Error resolution
--Use database Sample_DB
USE Sample_DB
GO

--Drop table
DROP TABLE tbl_sample
GO

--Create table
CREATE TABLE tbl_sample
(
 [ID] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH
 WITH (BUCKET_COUNT = 100000),
 [Name] VARCHAR(50) NOT NULL,
 [CreationDateTime] datetime
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO

--End of error resolution
