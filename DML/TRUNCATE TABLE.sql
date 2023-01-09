--Script Name: TSQL Enhancements – Truncate Table
--Script Type: Enhancement
--Article: https://raresql.com/2015/06/23/sql-server-2016-tsql-enhancements-truncate-table/
--Developed By: Muhammad Imran
--Date Created: 23 June 2015
--Date Modified: 3 Jan 2023

--Sample

--Use database master
USE master
GO

--Alter database
ALTER DATABASE [Sample_DB] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
--Drop Sample database
DROP DATABASE [Sample_DB]
GO
--Create Sample database
CREATE DATABASE Sample_DB
GO
 
-- Create Filegroups
ALTER DATABASE Sample_DB ADD FILEGROUP [2014]
GO
ALTER DATABASE Sample_DB ADD FILEGROUP [2015]
GO
 
--Create one file for each filegroup and
--so that you can store partition data
 
ALTER DATABASE Sample_DB
ADD FILE
(NAME = N'FG_2014',
FILENAME = N'C:\Data\FG_2014.ndf'
)
TO FILEGROUP [2014]
GO
 
ALTER DATABASE Sample_DB
ADD FILE
(NAME = N'FG_2015',
FILENAME = N'C:\Data\FG_2015.ndf'
)
TO FILEGROUP [2015]
GO

--Use database Sample_DB
USE Sample_DB
GO
 
--Drop the partition function if it exists
IF( EXISTS( SELECT * FROM sys.partition_functions
WHERE name = 'OrderDateRangePFN' ) )
BEGIN
DROP PARTITION FUNCTION OrderDateRangePFN
END
GO
 
--Create partition function
CREATE PARTITION FUNCTION OrderDateRangePFN(DATETIME)  AS
RANGE LEFT FOR VALUES
('2014-12-31',
'2015-12-31'
)
GO
 
-- Drop the partition Scheme if it exists
IF( EXISTS( SELECT * FROM sys.partition_schemes
WHERE name = 'OrderDateRangePScheme' ) )
BEGIN
DROP PARTITION SCHEME OrderDateRangePScheme
END
GO
 
--Create partition scheme
CREATE PARTITION SCHEME OrderDateRangePScheme AS
PARTITION OrderDateRangePFN  TO
([2014],
[2015],
[PRIMARY]  )
GO
 
--Drop sample table if exists
IF( OBJECT_ID( 'tbl_Sample', 'U' ) IS NOT NULL )
BEGIN
DROP TABLE tbl_Sample
END
GO
 
--Create sample table
CREATE TABLE tbl_Sample
(OrderID INT NOT NULL,
[OrderDate] DATETIME)
ON OrderDateRangePScheme ([OrderDate]);
GO
 
--Insert records into table
insert into tbl_Sample Values (1,'2014-01-01')
insert into tbl_Sample Values (2,'2014-02-01')
insert into tbl_Sample Values (3,'2014-03-01')
insert into tbl_Sample Values (4,'2015-01-01')
insert into tbl_Sample Values (5,'2015-02-01')
insert into tbl_Sample Values (6,'2015-03-01')
insert into tbl_Sample Values (7,'2015-04-01')
insert into tbl_Sample Values (8,'2016-01-01')
insert into tbl_Sample Values (9,'2016-02-01')
GO
 
--Browse table
SELECT * FROM tbl_Sample
GO

--End of sample

--Step-1

--Use database Sample_DB
USE Sample_DB
GO
-- Check if data exists in the partition properly
SELECT OBJECT_NAME(OBJECT_ID) AS [Table Name]
	 , partition_number AS [Partition Number]
	 , rows AS [Number of rows]
FROM sys.partitions
WHERE OBJECT_NAME(OBJECT_ID)='tbl_Sample';
GO

--End of step-1

--Step-2

--Use database Sample_DB
USE Sample_DB
GO
TRUNCATE TABLE tbl_Sample
WITH (PARTITIONS (2));
GO

--End of step-2

--Step-3

--Use database Sample_DB
USE Sample_DB
GO
-- Check if data exists in the partition properly
SELECT OBJECT_NAME(OBJECT_ID) AS [Table Name]
, partition_number AS [Partition Number]
, rows AS [Number of rows]
FROM sys.partitions
WHERE OBJECT_NAME(OBJECT_ID)='tbl_Sample';
GO

--End of step-3
