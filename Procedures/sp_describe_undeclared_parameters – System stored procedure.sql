--Script Name: sp_describe_undeclared_parameters – System stored procedure
--Script Type: Stored Procedure
--Article: https://raresql.com/2013/02/02/sql-server-2012-sp_describe_undeclared_parameters-system-stored-procedure/
--Developed By: Muhammad Imran
--Date Created: 2 Feb 2013
--Date Modified: 7 Jan 2023

--Step-1

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Declare variables
DECLARE @SQL NVARCHAR(500);
DECLARE @ParameterDefinition NVARCHAR(500);
DECLARE @BusinessEntityID INT;

--Set value of variable
SET @SQL =N'SELECT @BusinessID=[BusinessEntityID] from [HumanResources].[vEmployee]
Where [FirstName]=@FName';
 
EXECUTE sp_executesql @SQL

--End of step-1

--Step-2

sp_describe_undeclared_parameters @tSQL=N'SELECT @BusinessID=[BusinessEntityID]
from [HumanResources].[vEmployee] Where [FirstName]=@FName';

--End of step-2

--Step-3

--Example-1

--Use database AdventureWorks2012
use AdventureWorks2012
GO

--Declare variables
DECLARE @SQL NVARCHAR(500);
DECLARE @ParameterDefinition NVARCHAR(500);
DECLARE @BusinessEntityID INT;
DECLARE @FirstName as NVARCHAR(50)

--Set values of variables
SET @FirstName='Ken'
SET @SQL =N'SELECT @BusinessID=[BusinessEntityID] from [HumanResources].[vEmployee]
Where [FirstName]=@FName';
 
SET @ParameterDefinition = N'@FName nvarchar(50), @BusinessID INT OUTPUT';
 
EXECUTE sp_executesql @SQL
,@ParameterDefinition,
@FName=@FirstName,
@BusinessID =@BusinessEntityID OUTPUT;

--Browse variable 
SELECT @BusinessEntityID as [BusinessEntityID]
GO

--End of example-1

--Example-2

sp_describe_undeclared_parameters @tSQL=N'SELECT @BusinessID=[BusinessEntityID]
from [HumanResources].[vEmployee] Where [FirstName]=@FName'
,@params =N'@FName nvarchar(50)'

--End of example-2

--Example-3

sp_describe_undeclared_parameters @tSQL=
N'SELECT @BusinessID=[BusinessEntityID]
from [HumanResources].[vEmployee] Where [FirstName]=@FName'
,@params =N'@FName nvarchar(50), @BusinessID INT OUTPUT'

---End of example-3

--End of step-3
