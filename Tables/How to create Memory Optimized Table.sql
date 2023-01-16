--Script Name: How to create Memory Optimized Table
--Script Type: Table
--Article: https://raresql.com/2013/07/10/sql-server-hekaton-how-to-create-memory-optimized-table/
--Developed By: Muhammad Imran
--Date Created: 10 Jul 2013
--Date Modified: 12 Jan 2023

--Script

--Create database
CREATE DATABASE Sample_DB
ON
PRIMARY(NAME = [Sample_DB],
FILENAME = 'C:\DATA\Sample_data.mdf', size=500MB)
,FILEGROUP [hekaton_demo_fg] CONTAINS MEMORY_OPTIMIZED_DATA(
NAME = [hekaton_demo_dir],
FILENAME = 'C:\DATA\Sample_dir')
LOG ON (name = [hekaton_demo_log]
, Filename='C:\DATA\Sample_log.ldf', size=500MB)
;
GO

--Create memory optimized table

--Use database Sample_DB
USE Sample_DB
GO
CREATE TABLE tbl_sample
(
[ID] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH
WITH (BUCKET_COUNT = 100000),
[Name] VARCHAR(50) NOT NULL
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO

--End of script
