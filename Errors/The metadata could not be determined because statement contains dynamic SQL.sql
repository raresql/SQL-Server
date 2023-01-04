--Script Name: The metadata could not be determined because statement contains dynamic SQL.
--Script Type: Error
--Article: https://raresql.com/2013/05/04/sql-server-2012-fix-error-11513-the-metadata-could-not-be-determined-because-statement-contains-dynamic-sql-consider-using-the-with-result-sets-clause-to-explicitly-describe-the-result-set/
--Developed By: Muhammad Imran
--Date Created: 4 May 2013
--Date Modified: 30 Dec 2022

--Error
--The metadata could not be determined because statement ‘%.*ls’ contains dynamic SQL. Consider using the WITH RESULT SETS clause to explicitly describe the result set.

--End of error

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variables
DECLARE @SQL AS NVARCHAR(MAX)
DECLARE @SelectClause AS NVARCHAR(MAX)

--Set values of variables
SET @SelectClause='TOP 10 [FirstName],[EmailAddress]'
SET @SQL='SELECT '+ @SelectClause +
' FROM [HumanResources].[vEmployee]'
EXEC (@SQL)
GO

sp_describe_first_result_set @tsql =N'

--Declare variables
DECLARE @SQL AS NVARCHAR(MAX)
DECLARE @SelectClause AS NVARCHAR(MAX)

--Set values of variables
SET @SelectClause=N''TOP 10 [FirstName],[EmailAddress]''
SET @SQL=N''SELECT '''''' + @SelectClause
+ '''''' FROM [HumanResources].[vEmployee] ''
EXEC(@SQL)'
GO
--End of error generation

--Error resolution

sp_describe_first_result_set @tsql =N'

--Declare variables
DECLARE @SQL AS NVARCHAR(MAX)
DECLARE @SelectClause AS NVARCHAR(MAX)

--Set values of variables
SET @SelectClause=N''TOP 10 [FirstName],[EmailAddress]''
SET @SQL=N''SELECT '''''' + @SelectClause
+ '''''' FROM [HumanResources].[vEmployee] ''
 
--Execute variable
EXEC(@SQL) WITH RESULT SETS
(([FirstName] varchar(50)
,[EmailAddress] nvarchar(50)));'
GO

--End of error resolution
