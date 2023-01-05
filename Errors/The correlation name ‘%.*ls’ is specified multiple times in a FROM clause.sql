--Script Name: The correlation name ‘%.*ls’ is specified multiple times in a FROM clause
--Script Type: Error
--Article: https://raresql.com/2013/12/06/sql-server-fix-error-1011-the-correlation-name-ls-is-specified-multiple-times-in-a-from-clause/
--Developed By: Muhammad Imran
--Date Created: 6 Dec 2013
--Date Modified: 5 Jan 2023
 
--Error message

The correlation name ‘%.*ls’ is specified multiple times in a FROM clause.

--End of error message

--Error generation

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Browse table
SELECT e.[BusinessEntityID]
	 , p.[Title]
	 , p.[FirstName]
	 , p.[MiddleName]
	 , p.[LastName]
	 , p.[Suffix]
	 , e.[JobTitle]
FROM [HumanResources].[Employee] p
INNER JOIN [Person].[Person] p
ON p.[BusinessEntityID] = e.[BusinessEntityID]
GO

--End of error generation

--Error resolution

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Browse table
SELECT e.[BusinessEntityID]
	 , p.[Title]
	 , p.[FirstName]
	 , p.[MiddleName]
	 , p.[LastName]
	 , p.[Suffix]
	 , e.[JobTitle]
FROM [HumanResources].[Employee] e
INNER JOIN [Person].[Person] p
ON p.[BusinessEntityID] = e.[BusinessEntityID]
GO

--End of error resolution
