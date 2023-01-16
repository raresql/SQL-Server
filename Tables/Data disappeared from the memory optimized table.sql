--Script Name:  Data disappeared from the memory optimized table
--Script Type: Table
--Article: https://raresql.com/2013/08/20/sql-server-hekaton-myth-data-disappeared-from-the-memory-optimized-table/
--Developed By: Muhammad Imran
--Date Created: 20 Aug 2013
--Date Modified: 12 Jan 2023

--Step-1

--Use database hkNorthwind
USE hkNorthwind
GO

--Create table
CREATE TABLE tbl_Product_Master
(
[Product ID] INT not null primary key nonclustered hash
with (bucket_count = 1024),
[Product Name] NVARCHAR(100),
[Creation Datetime] datetime
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY)
GO

--End of step-1

--Step-2

--Use database hkNorthwind
USE hkNorthwind
GO

--Insert records into table
INSERT INTO tbl_Product_Master VALUES (1, 'SQL Server 2012',GETDATE())
INSERT INTO tbl_Product_Master VALUES (2, 'SQL Server 2014',GETDATE())
GO

--End of step-2

--Step-3

--Use database hkNorthwind
USE hkNorthwind
GO

--Browse table
SELECT * FROM tbl_Product_Master
GO

--End of step-3

--Step-4

--Use database hkNorthwind
USE hkNorthwind
GO

--Browse table
SELECT * FROM tbl_Product_Master
GO

--End of step-4

--Step-5

--Use database hkNorthwind
USE hkNorthwind
GO

--Create table
CREATE TABLE tbl_Product_Master
(
[Product ID] INT not null primary key nonclustered hash
with (bucket_count = 1024),
[Product Name] NVARCHAR(100),
[Creation Datetime] datetime
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO

--End of step-5

