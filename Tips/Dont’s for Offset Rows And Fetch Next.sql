--Script Name: Dont’s for Offset Rows And Fetch Next
--Script Type: Tips
--Article: https://raresql.com/2013/02/24/donts-for-offset-rows-and-fetch-next/
--Developed By: Muhammad Imran
--Date Created: 24 Feb 2013
--Date Modified: 7 Jan 2023

--Example-1
--Fetch clause must be greater than zero

--Use database AdventureWorks2012 
USE AdventureWorks2012
GO

--Browse table
SELECT * FROM [HumanResources].[vEmployee]
ORDER BY [JobTitle]
OFFSET 10 ROWS
FETCH NEXT 0 ROWS ONLY

--End of example-1

--Example-2
--Offset clause must have integer only

--Use database AdventureWorks2012 
USE AdventureWorks2012
GO
SELECT * FROM [HumanResources].[vEmployee]
ORDER BY [JobTitle]
OFFSET 1.1 ROWS
FETCH NEXT 10 ROWS ONLY

--End of example-2

--Example-3
--Offset clause may not be negative
--Use database AdventureWorks2012 
USE AdventureWorks2012
GO

SELECT * FROM [HumanResources].[vEmployee]
ORDER BY [JobTitle]
OFFSET -10 ROWS
FETCH NEXT 10 ROWS ONLY

--End of example-3

--Example-4
--A Top cannot be used in the same query or sub query as an offset
--Use database AdventureWorks2012 
USE AdventureWorks2012
GO

SELECT Top 5 * FROM [HumanResources].[vEmployee]
ORDER BY [JobTitle]
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY

--End of example-4
