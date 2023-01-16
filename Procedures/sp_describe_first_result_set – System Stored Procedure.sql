--Script Name: sp_describe_first_result_set – System Stored Procedure
--Script Type: Procedure
--Article: https://raresql.com/2012/07/04/sql-server-2012-sp_describe_first_result_set-system-stored-procedure/
--Developed By: Muhammad Imran
--Date Created: 4 Jul 2012
--Date Modified: 7 Jan 2023

-Script

--Syntax

sp_describe_first_result_set [ @tsql = ] N'Transact-SQL_batch'
[ , [ @params = ] N'parameters' ]
[ , [ @browse_information_mode = ]  ] ]

--End of syntax

--Example

EXEC sp_describe_first_result_set @tsql =N'SELECT * FROM HumanResources.Department'
GO

--End of example

--Browsr table

SELECT * FROM [HumanResources].[Department];
SELECT * FROM [HumanResources].[Employee];

EXEC sp_describe_first_result_set @tsql =N'SELECT * FROM [HumanResources].[Department];
SELECT * FROM [HumanResources].[Employee];'

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Create view
Create View [HumanResources].[vDepartment]
AS
SELECT [DepartmentID] as [ID]
,[Name] as [Department Name]
FROM [HumanResources].[Department]


--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Set browse_information_mode=0
EXEC sp_describe_first_result_set
@tsql =N'SELECT * FROM [HumanResources].[vDepartment];'
,@params=NULL,@browse_information_mode=0
GO

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Set browse_information_mode=1
EXEC sp_describe_first_result_set
@tsql =N'SELECT * FROM [HumanResources].[vDepartment];'
,@params=NULL,@browse_information_mode=1
GO

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Set browse_information_mode=2
EXEC sp_describe_first_result_set
@tsql =N'SELECT * FROM [HumanResources].[vDepartment];'
,@params=NULL,@browse_information_mode=2
GO

--End of script
