--Script Name: How to check last modified date of Sequence Object
--Script Type: Solution
--Article: https://raresql.com/2013/12/01/sql-server-2012-how-to-check-last-modified-date-in-sequence/
--Developed By: Muhammad Imran
--Date Created: 1st December 2013
--Date Modified: 27th December 2022


--Method-1
--Use sys.sequence

--Use AdventureWorks database
USE AdventureWorks2012
GO

--Browse data 
SELECT name As [Sequence Name]
     , modify_date
FROM sys.sequences;
GO

--End of method-1

--Method-2
--Use sys.objects

--Use AdventureWorks database
USE AdventureWorks2012
GO

--Browse data
SELECT name As [Sequence Name]
     , modify_date
FROM sys.objects
WHERE [type] ='SO'
GO

--End of method-2
