--Script Name: How To Convert From Boolean(bit) to String
--Script Type: Solution
--Article: https://raresql.com/2013/05/14/sql-server-how-to-convert-from-booleanbit-to-string/
--Developed By: Muhammad Imran
--Date Created: 14 May 2013
--Date Modified: 28 Dec 2022

--Method-1

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT [BusinessEntityID]
     , [Name]
     , [ActiveFlag]
     , IIF([ActiveFlag]=1,'TRUE','FALSE') AS [ActiveFlag As String]
FROM [Purchasing].[Vendor];
GO

--End of method-1

--Method-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT [BusinessEntityID]
     , [Name]
     , [ActiveFlag]
     , CASE 
          WHEN [ActiveFlag]=1 THEN 'TRUE'
          WHEN [ActiveFlag]=0 THEN 'FALSE' 
       END AS  [ActiveFlag As String]
FROM [Purchasing].[Vendor];
GO

--End of method-2
