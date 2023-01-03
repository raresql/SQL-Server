--Script Name: Multiple ways to achieve Dynamically Order By Clause
--Script Type: Solution
--Article: https://raresql.com/2013/05/18/sql-server-multiple-ways-to-achieve-dynamically-order-by-clause/
--Developed By: Muhammad Imran
--Date Created: 18 May 2013
--Date Modified: 28 Dec 2022

--Method-1

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variable
DECLARE @ORDERBY INT

--Set value of variable
SET @ORDERBY=3
 
--Browse table
SELECT BusinessEntityID
     , FirstName
     , LastName
     , JobTitle
FROM HumanResources.vEmployee
ORDER BY
CASE
WHEN @ORDERBY=1 THEN FirstName
WHEN @ORDERBY=2 THEN LastName
WHEN @ORDERBY=3 THEN JobTitle
END;
GO

--End of method-1

--Method-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variable
DECLARE @ORDERBY INT

--Set value of variable
SET @ORDERBY=3
 
--Browse table
SELECT BusinessEntityID
     , FirstName
     , LastName
     , JobTitle
FROM HumanResources.vEmployee
ORDER BY
IIF(@ORDERBY=1,FirstName,IIF(@ORDERBY=2,LastName,JobTitle))

--End of method-2

--Method-3

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Declare variable
DECLARE @ORDERBY INT

--Set value of variable
SET @ORDERBY=3
 
--Browse table
SELECT BusinessEntityID
     , FirstName
     , LastName
     , JobTitle
FROM HumanResources.vEmployee
ORDER BY
CHOOSE(@ORDERBY,FirstName,LastName,JobTitle)
GO

--End of method-3

