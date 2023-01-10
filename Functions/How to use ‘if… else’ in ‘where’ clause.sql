--Script Name: How to use ‘if… else’ in ‘where’ clause
--Script Type: Solution
--Article: https://raresql.com/2013/06/28/sql-server-how-to-use-if-else-in-where-clause/
--Developed By: Muhammad Imran
--Date Created: 28 Jun 2013
--Date Modified: 5 Jan 2023

--Error

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variable
DECLARE @City AS VARCHAR(50)

--Browse table
SELECT BusinessEntityID
	 , FirstName
	 , LastName
	 , City
FROM [HumanResources].[vEmployee]
WHERE
IF @City IS NULL
    City='Renton'
ELSE
    City=@City
	
--End of error

--Solution-1
--Use CASE STATEMENT

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variable
DECLARE @City AS VARCHAR(50)

--Browse table
SELECT BusinessEntityID
	 , FirstName
	 , LastName
	 , City
FROM [HumanResources].[vEmployee]
WHERE City =
(CASE WHEN @City IS NULL THEN 'Renton' ELSE @City END)
ORDER BY BusinessEntityID

--End of solution-1

--Solution-2
--Use IIF clause

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variable
DECLARE @City AS VARCHAR(50)

--Browse table
SELECT BusinessEntityID
	 , FirstName
	 , LastName
	 , City
FROM [HumanResources].[vEmployee]
WHERE City = IIF (@City IS NULL, 'Renton', @City)
ORDER BY BusinessEntityID

--End of solution-2
