--Script Name: How to find uncontained objects in databases
--Script Type: Solution
--Article: https://raresql.com/2013/04/14/sql-server-how-to-find-uncontained-objects-in-the-database/
--Developed By: Muhammad Imran
--Date Created: 14 Apr 2013
--Date Modified: 28 Dec 2022


--Create uncontained object

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Create procedure
CREATE PROC test_Procedure
AS
SELECT * FROM sys.all_objects;
GO

--End of uncontained object

--Execute uncontained object

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Browse data
SELECT O.name
     , O.type_desc
     , UCE.class_desc
     , UCE.statement_type
     , UCE.feature_name
     , UCE.feature_type_name
FROM sys.dm_db_uncontained_entities AS UCE
LEFT JOIN sys.objects AS O ON UCE.major_id = O.object_id

--End of uncontained object
