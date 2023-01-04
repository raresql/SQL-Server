--Script Name: The metadata could not be determined because the statement ‘%.*ls’ in procedure ‘%.*ls’ is not compatible.
--Script Type: Error
--Article: https://raresql.com/2013/09/14/sql-server-2012-fix-error-11512-the-metadata-could-not-be-determined-because-the-statement-ls-in-procedure-ls-is-not-compatible/
--Developed By: Muhammad Imran
--Date Created: 14 Sep 2013
--Date Modified: 30 Dec 2022

--Error

--“The metadata could not be determined because the statement ‘%.*ls’ in procedure ‘%.*ls’ is not compatible with the statement ‘%.*ls’ in procedure ‘%.*ls’.“

--End of error

--Error generation:
--Sample

--Use database tempdb
USE tempdb
GO

--DROP TABLE tbl_customer
--GO

--Create table
CREATE TABLE tbl_customer
(
[Customer ID] varchar(6),
[Customer Name] nvarchar(100),
[Customer Address] varchar(250)
)
GO
--DROP TABLE tbl_vendor
--GO

--Create table
CREATE TABLE tbl_vendor
(
[Vendor ID] int,
[Vendor Name] nvarchar(100)
)
GO
 
--DROP PROCEDURE usp_sample_1
--GO

--Create procedure
CREATE PROCEDURE usp_sample_1
@Type varchar(10)
AS
IF @Type='customer'
BEGIN
     SELECT [Customer ID],[Customer Name],[Customer Address]
     FROM tbl_customer
END
ELSE
BEGIN
     SELECT [Vendor ID],[Vendor Name] FROM tbl_vendor
END
GO

--End of sample

--Example

--Use database tempdb
USE tempdb
GO

--Execute procedure
EXEC sp_describe_first_result_set @tsql= N'usp_sample_1'
GO

--End of example

--End of error generation

--Error resolution

--Create procedure
CREATE PROCEDURE usp_sample_1
@Type varchar(10)
AS
IF @Type='customer'
BEGIN
SELECT [Customer ID],[Customer Name]--,[Customer Address]
FROM tbl_customer
END
ELSE
BEGIN

--Use CONVERT() function
SELECT CONVERT(varchar(6),[Vendor ID]),[Vendor Name] FROM tbl_vendor
END
GO
 
--Execute procedure
EXEC sp_describe_first_result_set @tsql= N'usp_sample_1'
GO

--End of error resolution
