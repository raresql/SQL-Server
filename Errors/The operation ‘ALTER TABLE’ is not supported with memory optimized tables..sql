--Script Name: Fix – Error – 10770 – The operation ‘ALTER TABLE’ is not supported with memory optimized tables.
--Script Type: Error
--Article: https://raresql.com/2013/09/03/sql-server-hekaton-fix-error-10770-the-operation-alter-table-is-not-supported-with-memory-optimized-tables/
--Developed By: Muhammad Imran
--Date Created: 3rd September 2013
--Date Modified: 30th Dec 2022

--Create sample

--Use Sample_DB database
USE Sample_DB
GO

--Create sample table
CREATE TABLE tbl_sample
(  [ID] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 100000)
 , [Name] VARCHAR(50) NOT NULL
)  WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA);
GO

--End of sample

--Error

ALTER TABLE tbl_sample ADD [CreationDateTime] datetime NULL;

--Output returns error: The operation ‘ALTER TABLE’ is not supported with memory optimized tables.

--End of Error

--Solution
--Memory optimized tables do not support alter table statement. So, instead of alter, you need to drop and create the memory optimized tables.

--Use Sample_DB database
USE Sample_DB
GO

--Drop previous table
DROP TABLE tbl_sample
GO

--Create new memory optimised sample table
CREATE TABLE tbl_sample
(  [ID] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT = 100000)
 , [Name] VARCHAR(50) NOT NULL
 , [CreationDateTime] datetime
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO

--End of Solution
