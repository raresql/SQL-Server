--Script Name: Disk based table vs Memory optimized table performance
--Script Type: Table
--Article: https://raresql.com/2013/09/24/sql-server-hekaton-disk-based-table-vs-memory-optimized-table-performance/
--Developed By: Muhammad Imran
--Date Created: 24 Sep 2013
--Date Modified: 12 Jan 2023

--Script

--Sample

--Sample for Memory Optimized table

--Given below scripts are compatible with SQL Server 2014 and above.

--Use database hkNorthwind
USE hkNorthwind
GO

--Create a memory optimized table
CREATE TABLE [dbo].[tbl_product_Master_MO]
(
    [Product ID] INT NOT NULL PRIMARY KEY NONCLUSTERED HASH
        WITH (BUCKET_COUNT = 100000),
    [Product Name] [nvarchar](100) NULL,
    [Creation Datetime] [datetime] NULL
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO
--Insert 65536 records into the memory optimized table
--This script may take few minutes to insert records.
 
USE hkNorthwind
GO
;WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
N2 (n) AS (SELECT 1 FROM N1 AS X, N1 AS Y),
N3 (n) AS (SELECT 1 FROM N2 AS X, N2 AS Y),
N4 (n) AS (SELECT 1 FROM N3 AS X, N3 AS Y),
N5 (n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
FROM N4 AS X, N4 AS Y)
INSERT INTO tbl_product_Master_MO
SELECT n,'Number' + Convert(varchar(10),n),GETDATE()
from N5
 
---Create native compiled procedure to give boost to memory optimized table.

CREATE PROCEDURE dbo.usp_product_master
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN
ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = N'us_english')
SELECT [Product ID],[Product Name],[Creation Datetime]
FROM dbo.[tbl_product_Master_MO]
 
END
GO

--Sample For Disk Based table 

--Use database hkNorthwind
USE [hkNorthwind]
GO

--Create a disk based table (Normal table)
CREATE TABLE [dbo].[tbl_product_Master_DB](
    [Product ID] [int] NOT NULL,
    [Product Name] [nvarchar](100) NULL,
    [Creation Datetime] [datetime] NULL
) ON [PRIMARY]
GO
 
--Insert 65536 records into the disk based table.
--This script may take few minutes to insert records.
USE hkNorthwind
GO
;WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
N2 (n) AS (SELECT 1 FROM N1 AS X, N1 AS Y),
N3 (n) AS (SELECT 1 FROM N2 AS X, N2 AS Y),
N4 (n) AS (SELECT 1 FROM N3 AS X, N3 AS Y),
N5 (n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
FROM N4 AS X, N4 AS Y)
INSERT INTO tbl_product_Master_DB
SELECT n,'Number' + Convert(varchar(10),n),GETDATE()
from N5
GO

--End of sample

--Query Cost related to the Batch 

--Use database hkNorthwind
USE hkNorthwind
GO

--Browse Memory optimzed table
Select * from [tbl_product_Master_MO]
 
--Browse Disk based table
Select * from [tbl_product_Master_DB]
GO

--Time Statistics

SET STATISTICS TIME ON

--Use database hkNorthwind
USE hkNorthwind
GO

---Given below is the Memory optimized native compiled stored procedure.
--This stored procedure we used to browse memory optimized table.
--It will give boost to memory optimized table performance.

EXEC usp_product_master
GO
 
--Browse Disk based table
Select * from [tbl_product_Master_DB]
GO

SET STATISTICS TIME OFF

--IO Statistics 

SET STATISTICS IO ON

--Use database hkNorthwind
USE hkNorthwind
GO

-- Browse Memory optimzed table
Select * from [tbl_product_Master_MO]
GO

--Browse Disk based table
Select * from [tbl_product_Master_DB]
GO

SET STATISTICS IO OFF

--End of script
