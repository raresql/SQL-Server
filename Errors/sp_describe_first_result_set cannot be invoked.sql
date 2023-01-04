--Script Name: sp_describe_first_result_set cannot be invoked
--Script Type: Error
--Article: https://raresql.com/2013/03/15/sql-server-2012-fix-error-sp_describe_first_result_set-cannot-be-invoked-when-set-statistics-xml-or-set-statistics-profile-is-on/
--Developed By: Muhammad Imran
--Date Created: 15 March 2013
--Date Modified: 30 Dec 2022

--Error
--sp_describe_first_result_set cannot be invoked when SET STATISTICS XML or SET STATISTICS PROFILE is on

--End of error

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Set statistics
SET Statistics XML ON
SET Statistics Profile ON
 
--Execute sp_describe_first_result_set
EXEC sp_describe_first_result_set
@tsql =N'SELECT * FROM [HumanResources].[vEmployeeDepartment];'
,@params=NULL,@browse_information_mode=0
GO

--End of error generation

--Error resolution

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Set statistics
SET Statistics XML OFF
SET Statistics Profile OFF

--Execute sp_describe_first_result_set
EXEC sp_describe_first_result_set
@tsql =N'SELECT * FROM [HumanResources].[vEmployeeDepartment];'
,@params=NULL,@browse_information_mode=0
GO

--End of error resolution
