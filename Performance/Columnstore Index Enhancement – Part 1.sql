--Script Name: Columnstore Index Enhancement – Part 1
--Script Type: Performance
--Article: https://raresql.com/2013/07/03/sql-server-2014-columnstore-index-enhancement-part-1/
--Developed By: Muhammad Imran
--Date Created: 3 Jul 2013
--Date Modified: 12 Jan 2023

--Script

--SQL SERVER 2012

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_Product_Master
(
 [Product ID] INT,
 [Product Name] NVARCHAR(100),
 [Model] INT
)
GO

--Create INDEX
CREATE CLUSTERED COLUMNSTORE INDEX
[IX_tbl_Product_Master_ColumnStore]
ON [tbl_Product_Master] ([Product ID])
GO

--End of SQL SERVER 2012

--SQL SERVER 2014

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE tbl_Product_Master
(
 [Product ID] INT,
 [Product Name] NVARCHAR(100),
 [Model] INT
)
GO

--Create INDEX
CREATE CLUSTERED COLUMNSTORE INDEX
[IX_tbl_Product_Master_ColumnStore]
ON [tbl_Product_Master] ([Product ID])
GO

--End of SQL SERVER 2014


--End of script
