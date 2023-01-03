--Script Name: How to create memory optimized temporary table
--Script Type: Solution
--Article: https://raresql.com/2013/09/16/sql-server-hekaton-how-to-create-memory-optimized-temporary-table/
--Developed By: Muhammad Imran
--Date Created: 16 Sep 2013
--Date Modified: 27 Dec 2022

--Error

--Use database hkNorthwind
USE hkNorthwind
GO

--Create table
CREATE TABLE #tbl_Product_Master
(
 [Product ID] INT not null primary key nonclustered hash
 with (bucket_count = 1024),
 [Product Name] NVARCHAR(100),
 [Creation Datetime] datetime
)
;WITH (MEMORY_OPTIMIZED = ON)
GO

--End of error

--Solution

--Use database hkNorthwind
USE hkNorthwind
GO
--DROP TABLE tbl_Product_Master
--GO

--Create table
CREATE TABLE tbl_Product_Master
(
 [Product ID] INT not null primary key nonclustered hash
 with (bucket_count = 1024),
 [Product Name] NVARCHAR(100),
 [Creation Datetime] datetime
) 
;WITH (MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_ONLY) 
GO

--End of solution
