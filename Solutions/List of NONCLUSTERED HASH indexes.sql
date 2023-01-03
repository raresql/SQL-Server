--Script Name: List of NONCLUSTERED HASH indexes
--Script Type: Solution
--Article: https://raresql.com/2013/09/17/sql-server-2014-list-of-nonclustered-hash-indexes/
--Developed By: Muhammad Imran
--Date Created: 17 Sep 2013
--Date Modified: 27 Dec 2022

--Use database hkNorthwind
USE hkNorthwind
GO

--Browse sys.hash_indexes
SELECT object_schema_name([object_id]) As [Schema Name]
	 , object_name([object_id]) As [Table Name]
	 , [name] As [Index Name]
	 , [type_desc] As [Index Description]
FROM sys.hash_indexes;
