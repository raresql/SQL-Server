--Script Name: The parameter type for ‘%.*ls’ cannot be deduced
--Script Type: Error
--Article: https://raresql.com/2013/08/03/sql-server-2012-fix-error-11507-the-parameter-type-for-ls-cannot-be-deduced-because-no-type-would-make-the-query-valid/
--Developed By: Muhammad Imran
--Date Created: 3 Aug 2013
--Date Modified: 30 Dec 2022

--Error
--The parameter type for ‘%.*ls’ cannot be deduced because no type would make the query valid.

--End of error

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
sp_describe_undeclared_parameters @tsql = N'

--Browse data
Select * from [Production].[ProductModel]
Where ProductModelID=@ProductModelID
And Instructions =@Instruction'
GO

--End of error generation

--Error resolution

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
sp_describe_undeclared_parameters @tsql = N'

--Browse data
Select * from [Production].[ProductModel]
Where ProductModelID=@ProductModelID '

