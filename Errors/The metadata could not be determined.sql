--Script Name: The metadata could not be determined
--Script Type: Error
--Article: https://raresql.com/2013/09/29/sql-server-2012-fix-error-11521-the-metadata-could-not-be-determined-because-statement-ls-uses-an-undeclared-parameter-in-a-context-that-affects-its-metadata/
--Developed By: Muhammad Imran
--Date Created: 29 Sep 2013
--Date Modified: 30 Dec 2022

--Error

--The metadata could not be determined because statement ‘%.*ls’ uses an undeclared parameter in a context that affects its metadata.

--End of error

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variable
DECLARE @Country as varchar(100)

--Set values of variable
SET @Country='United Arab Emirates'

--Browse variable
SELECT @Country as [Country], CountryRegionCode,CurrencyCode
FROM [Sales].[CountryRegionCurrency]
WHERE CountryRegionCode='AE'
GO

--View metadata

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--View data
sp_describe_first_result_set @tsql =N'
SELECT @Country as [Country], CountryRegionCode,CurrencyCode FROM [Sales].[CountryRegionCurrency]
WHERE CountryRegionCode=''AE'''
GO

--End of error generation

--Error resolution

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

sp_describe_first_result_set @tsql =N'

--Declare variable
DECLARE @Country as varchar(100)

--Browse variable
SELECT @Country as [Country], CountryRegionCode,CurrencyCode FROM [Sales].[CountryRegionCurrency]
WHERE CountryRegionCode=''AE'''
GO

--End of resolution
