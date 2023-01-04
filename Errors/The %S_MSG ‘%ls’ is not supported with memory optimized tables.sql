--Script Name: The %S_MSG ‘%ls’ is not supported with memory optimized tables.
--Script Type: Error
--Article: https://raresql.com/2013/07/16/sql-server-hekaton-fix-error-10770-the-s_msg-ls-is-not-supported-with-memory-optimized-tables/
--Developed By: Muhammad Imran
--Date Created: 16 July 2013
--Date Modified: 30 Dec 2022

--Error
--The %S_MSG ‘%ls’ is not supported with memory optimized tables.

--End of error

--Error generation

--Sample

--Use database Sample_DB
USE Sample_DB
GO

--Create table
CREATE TABLE tbl_sample
(
 [ID] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH
 WITH (BUCKET_COUNT = 100000),
 [Name] VARCHAR(50) NOT NULL
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO
 
--Insert records into table
INSERT INTO tbl_sample ([ID],[Name]) VALUES (1,'raresql-1')
GO
INSERT INTO tbl_sample ([ID],[Name]) VALUES (2,'raresql-2')

--Truncate table
TRUNCATE TABLE tbl_sample

--End of sample
--End of error generation

--Error resolution

--Use database Sample_DB
USE Sample_DB
GO

--Delete records from table
DELETE FROM tbl_sample

--Browse table
SELECT * FROM tbl_sample

--End of error resolution
