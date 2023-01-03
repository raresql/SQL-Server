--Script Name: Multiple ways to find all the tables that do not have a primary key?
--Script Type: Solution
--Article: https://raresql.com/2014/02/16/sql-server-multiple-ways-to-find-all-the-tables-that-do-not-have-a-primary-key/
--Developed By: Muhammad Imran
--Date Created: 16 Feb 2014
--Date Modified: 26 Dec 2022

--Method-1

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Use OBJECTPROPERTY()
SELECT SCHEMA_NAME(schema_id) AS [Schema name]
	 , name AS [Table name] FROM sys.tables
	   WHERE OBJECTPROPERTY(object_id,'TableHasPrimaryKey') = 0;
GO

--End of method-1

--Method-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Use sys.objects()
SELECT SCHEMA_NAME(schema_id) AS [Schema name]
	 , name AS [Table name] FROM sys.objects
	   WHERE [type]='U' AND object_id
	   NOT IN (SELECT parent_object_id FROM sys.objects
	   WHERE [type]='PK');
GO

--End of method-2

--Method-3

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Use sys.tables
--Use sys.key_constraints
SELECT SCHEMA_NAME(schema_id) AS [Schema name]
	 , name AS [Table name] FROM sys.tables
	   WHERE object_id 
	   NOT IN(SELECT parent_object_id FROM sys.key_constraints
	   WHERE type = 'PK');
GO
