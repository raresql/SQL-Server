--Script Name: TSQL Enhancements – DROP IF EXISTS
--Script Type: DML
--Article: https://raresql.com/2016/06/23/sql-server-2016-tsql-enhancements-drop-if-exists/
--Developed By: Muhammad Imran
--Date Created: 23 June 2016
--Date Modified: 3 Jan 2023

--Sample

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE dbo.tbl_Sample
(
[ID] INT,
[Name] NVARCHAR(50)
)
GO

--End of sample

--Old approach

--Method-1

--Use database tempdb
USE tempdb
GO
IF OBJECT_ID('dbo.tbl_Sample', 'U') IS NOT NULL
DROP TABLE dbo.tbl_Sample
GO

--end of method-1
 
--Method-2

--Use database tempdb
USE tempdb
GO
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_Sample')
DROP TABLE dbo.tbl_Sample
GO

--End of method-2

--End of old approach

--New approach

--Use database tempdb
USE tempdb
GO
DROP TABLE IF EXISTS tbl_Sample;
GO

--End of new approach
