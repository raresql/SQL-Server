--Script Name: The undeclared parameter is used more than once in the batch being analyzed.
--Script Type: Error
--Article: https://raresql.com/2013/05/22/sql-server-2012-fix-error-11508-the-undeclared-parameter-is-used-more-than-once-in-the-batch-being-analyzed/
--Developed By: Muhammad Imran
--Date Created: 22 May 2013
--Date Modified: 30 Dec 2022

--Error
--The undeclared parameter ‘%.*ls’ is used more than once in the batch being analyzed.

--End of error

--Error generation

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Declare variables
DECLARE @Search_Name AS VARCHAR(MAX)
DECLARE @Country_Region_Name AS VARCHAR(MAX)

--Set values of variables
SET @Search_Name = 'William'
SET @Country_Region_Name='United States'

--Browse data
SELECT FirstName
	 , MiddleName
	 , LastName
	 , CountryRegionName
FROM HumanResources.vEmployee
WHERE
( FirstName  like '%' + @Search_Name + '%'
  OR
  MiddleName like '%' + @Search_Name + '%'
  OR
  LastName   like '%' + @Search_Name + '%'
)
AND CountryRegionName = @Country_Region_Name

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--USe sp_describe_undeclared_parameters
sp_describe_undeclared_parameters @tsql =
N'SELECT * FROM HumanResources.vEmployee
WHERE
( FirstName  like ''%'' + @Search_Name + ''%''
  OR
  MiddleName like ''%'' + @Search_Name + ''%''
  OR
  LastName   like ''%'' + @Search_Name + ''%''
) AND CountryRegionName = @Country_Region_Name'

--End of error generation

--Error resolution

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse data
sp_describe_undeclared_parameters @tsql =
N'SELECT * FROM HumanResources.vEmployee
WHERE
( FirstName  like ''%'' + @Search_Name + ''%''
  OR
  MiddleName like ''%'' + @Search_Name + ''%''
  OR
  LastName   like ''%'' + @Search_Name + ''%''
) AND CountryRegionName = @Country_Region_Name'
,@params =N'@Search_Name nvarchar(50)'

--End of error resolution
