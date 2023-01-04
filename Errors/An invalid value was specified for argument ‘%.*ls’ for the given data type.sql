--Script Name:  An invalid value was specified for argument ‘%.*ls’ for the given data type.
--Script Type: Error
--Article: https://raresql.com/2013/07/01/sql-server-2012-fix-error-11708-an-invalid-value-was-specified-for-argument-ls-for-the-given-data-type/
--Developed By: Muhammad Imran
--Date Created: 1 July 2013
--Date Modified: 30 Dec 2022

--Error
--An invalid value was specified for argument ‘%.*ls’ for the given data type.

--End of error

--Error generation

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Create sequence
CREATE SEQUENCE [dbo].[Seq_sample]
AS [tinyint]
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 256
NO CACHE
GO

--End of error generation

--Error resolution

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Create sequence
CREATE SEQUENCE [dbo].[Seq_sample]
AS [tinyint]
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 255
NO CACHE
GO

--End of error resolution
