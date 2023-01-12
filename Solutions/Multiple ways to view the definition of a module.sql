--Script Name: Multiple ways to view the definition of a module
--Script Type: Solution
--Article: https://raresql.com/2014/01/13/sql-server-multiple-ways-to-view-the-definition-of-a-module/
--Developed By: Muhammad Imran
--Date Created: 13 Jan 2014
--Date Modified: 10 Jan 2023

--Method-1

--Use database AdventureWorks2012
USE AdventureWorks2012 -- Donot forget to change database name here
GO
SELECT OBJECT_DEFINITION (OBJECT_ID('[HumanResources].[vEmployee]'))
-- Donot forget to change schema and table name
-- as highlighed above in blue color.
AS ObjectDefinition;
GO

--End of Method-1

--Method-2

--Use database AdventureWorks2012
USE AdventureWorks2012 -- Donot forget to change database name here
GO
SELECT definition
FROM sys.sql_modules
WHERE object_id = OBJECT_ID('HumanResources.dEmployee');
-- Donot forget to change schema and table name
-- as highlighed above in blue color.
GO

--End of Method-2
