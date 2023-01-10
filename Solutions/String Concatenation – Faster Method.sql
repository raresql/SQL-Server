--Script Name: String Concatenation – Faster Method
--Script Type: Solution
--Article: https://raresql.com/2013/03/12/sql-server-string-concatenation-faster-method/
--Developed By: Muhammad Imran
--Date Created: 12 Mar 2013
--Date Modified: 5 Jan 2023

--Method-1
--Using ISNULL With + (String Concatenation)

--Use database AdventureWorks2012
Use AdventureWorks2012
GO
Select
ISNULL([firstName],'')
+ ' '
+ ISNULL([MiddleName],'')
+ ' '
+ ISNULL([LastName],'') from [HumanResources].[vEmployee]

--End of method-1

--Method-2
--Using COALESCE With + (String Concatenation)

--Use database AdventureWorks2012
Use AdventureWorks2012
GO
Select
COALESCE([firstName],'')
+ ' '
+ COALESCE([MiddleName],'')
+ ' '
+ COALESCE([LastName],'')
from [HumanResources].[vEmployee]

--End of method-2

--Method-3
--Using Concat function of SQL Server 2012

--Use database AdventureWorks2012
Use AdventureWorks2012
GO
 
Select
CONCAT (
[firstName]
, ' '
, [MiddleName]
, ' '
, [LastName]) from [HumanResources].[vEmployee]

--End of method-3
