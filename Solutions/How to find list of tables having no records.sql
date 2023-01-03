--Script Name: How to find list of tables having no records
--Script Type: Solution
--Article: https://raresql.com/2013/09/01/sql-server-how-to-find-list-of-tables-having-no-records/
--Developed By: Muhammad Imran
--Date Created: 1 Sep 2013
--Date Modified: 27 Dec 2022

--Example
--This script is compatible with SQL Server 2005 and above.

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Use OBJECTPROPERTYEX(),OBJECT_SCHEMA_NAME(), OBJECT_SCHEMA_NAME(),SUM()
SELECT OBJECT_SCHEMA_NAME(OBJECT_ID) AS [Schema Name]
	 , OBJECT_NAME(OBJECT_ID) As [Table Name]
	 , SUM([rows]) as [Total Records] FROM sys.partitions
WHERE OBJECTPROPERTYEX (OBJECT_ID, N'IsUserTable')=1

--Remove the above where clause, if you need to view system objects as well.
AND [index_id] <=1
GROUP BY OBJECT_ID
HAVING SUM([rows])=0
ORDER BY OBJECT_NAME(OBJECT_ID)

--End of example
