--Script Name:  The metadata could not be determined because the statement is not compatible with the statement.
--Script Type: Error
--Article: https://raresql.com/2013/02/27/sql-server-the-metadata-could-not-be-determined-because-the-statement-is-not-compatible-with-the-statement/
--Developed By: Muhammad Imran
--Date Created: 27 Feb 2013
--Date Modified: 11 Jan 2023

--Error generation

--Sample

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variable
Declare @Gender as varchar(10)='Female'
If (@Gender='Male')
Select BusinessEntityID,NationalIDNumber
from [HumanResources].[Employee] where [Gender] ='M'
Else
Select BusinessEntityID,NationalIDNumber,OrganizationLevel
from [HumanResources].[Employee] where [Gender] ='F'
GO
--End of sample

--Example-1

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
Sp_describe_first_result_set @tsql =N'
If (@Gender=''Male'')
Select BusinessEntityID , NationalIDNumber from [HumanResources].[Employee] where [Gender] =''M''
Else
Select BusinessEntityID , NationalIDNumber , OrganizationLevel from [HumanResources].[Employee] where [Gender] =''F'''
GO

--End of example-1

--Example-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
Sp_describe_first_result_set @tsql =N'
If (@Gender=''Male'')
Select BusinessEntityID , NationalIDNumber from [HumanResources].[Employee] where [Gender] =''M''
Else
Select BusinessEntityID , Convert(varchar(50),NationalIDNumber) from [HumanResources].[Employee] where [Gender] =''F'''
GO
--End of example-2
--End of error generation
