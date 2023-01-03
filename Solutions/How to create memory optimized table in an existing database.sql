--Script Name: How to create memory optimized table in an existing database
--Script Type: Solution
--Article: https://raresql.com/2013/07/21/sql-server-hekaton-how-to-create-memory-optimized-table-in-an-existing-database/
--Developed By: Muhammad Imran
--Date Created: 21 July 2013
--Date Modified: 28 Dec 2022

--Step-1

--Use database master
USE master
GO

--Create database test
CREATE DATABASE [test]
ON
( NAME = Sales_dat,
    FILENAME = 'C:\DATA\test.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
( NAME = Sales_log,
    FILENAME = 'C:\DATA\test_log.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB );
GO

--End of step-1

--Step-2

--Use database Test
USE test
GO

--Create table
CREATE TABLE tbl_sample_Memory_table
(
 [ID] integer not null primary key nonclustered hash
 with (bucket_count = 1024),
 [Name] varchar(200) not null,
 ) WITH (MEMORY_OPTIMIZED = ON);
GO

--End of step-2

--Step-3

--Use database Master
USE [master]
GO

--Alter database
ALTER DATABASE [test] ADD  FILEGROUP [test_fg]
CONTAINS MEMORY_OPTIMIZED_DATA;
GO

ALTER DATABASE [test] ADD FILE
( NAME = N'test_fg', FILENAME = N'C:\DATA\test_fg.ndf')
TO FILEGROUP [test_fg];
GO

--Use database test
USE [test]
GO

IF NOT EXISTS (SELECT name FROM sys.filegroups
WHERE is_default=1 AND name = N'test_fg')
ALTER DATABASE [test] MODIFY FILEGROUP [test_fg] DEFAULT
GO

--End of step-3

--Step-4

--Use database test
USE [test]
GO

--Create table
CREATE TABLE tbl_sample_Memory_table
(
 [ID] integer not null primary key nonclustered hash
 with (bucket_count = 1024),
 [Name] varchar(200) not null,
 ) WITH (MEMORY_OPTIMIZED = ON)
GO

--End of step-4

--Step-5

--Use database test
USE [test]
GO

--Browse table
SELECT * FROM tbl_sample_Memory_table

--End of step-5
