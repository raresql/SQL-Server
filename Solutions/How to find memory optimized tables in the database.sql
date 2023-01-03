--Script Name: How to find memory optimized tables in the database
--Script Type: Solution
--Article: https://raresql.com/2013/07/13/sql-server-hekaton-how-to-find-memory-optimized-tables-in-the-database/
--Developed By: Muhammad Imran
--Date Created: 13 July 2013
--Date Modified: 28 Dec 2022

--Example

--Use database Northwind
USE Northwind
GO

--Browse table
SELECT object_id
	 , name  As [Table Name]
	 ,(CASE WHEN is_filetable=0 AND is_memory_optimized=0
	   THEN 'DISK BASED TABLE'
	   WHEN is_filetable=1
	   THEN 'FILE TABLE'
	   WHEN is_memory_optimized=1
	   THEN 'MEMORY OPTIMIZED TABLE' END)
 AS [Table Type]
FROM sys.tables;
GO

--End of example
