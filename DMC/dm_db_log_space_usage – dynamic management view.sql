--Script Name: dm_db_log_space_usage – dynamic management view
--Script Type: DMV
--Article: https://raresql.com/2014/01/01/sql-server-dm_db_log_space_usage-dynamic-management-view/
--Developed By: Muhammad Imran
--Date Created: 1 Jan 2014
--Date Modified: 12 Jan 2023

--Script

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT
 DB_NAME(database_id) AS [Database Name],
 ROUND(CONVERT(FLOAT,total_log_size_in_bytes/1024)/1024,2) AS [Log Size (MB)],
 ROUND(CONVERT(FLOAT,used_log_space_in_bytes/1024)/1024,2) AS [Log Used size (MB)],
 ROUND(used_log_space_in_percent,2) AS [Log Used % (MB)]
FROM
sys.dm_db_log_space_usage
 

--End of script
