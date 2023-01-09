--Script Name: The batch could not be analyzed because of compile errors
--Script Type: Error
--Article: https://raresql.com/2013/02/10/sql-server-the-batch-could-not-be-analyzed-because-of-compile-errors/
--Developed By: Muhammad Imran
--Date Created: 10 Feb 2013
--Date Modified: 7 Jan 2023

--Error Generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
sp_describe_undeclared_parameters @tSQL=
N'SELECT @BusinessID=[BusinessEntityID]
from [HumanResources].[vEmployee] Where [FirstName]=@FName'
,@params =N'@FName nvarchar(50),, @BusinessID INT OUTPUT'

--End of error generation

