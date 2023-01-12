--Script Name: Finding Size of a Columnstore Index on disk
--Script Type: Solution
--Article: https://raresql.com/2013/04/06/sql-server-finding-size-of-a-columnstore-index-on-disk/
--Developed By: Muhammad Imran
--Date Created: 6 Apr 2013
--Date Modified: 10 Jan 2023

--Script

--Use database AdventureWorks2012
Use AdventureWorks2012
Go

--Declare variable
Declare @TableName as nvarchar(Max)
--If you need columnstore index size for one table
--Change the @TableName parameter from NULL to table name
Set @TableName =NULL --'SalesOrderDetail_Sample'
 
;With CTE AS (
SELECT i.object_id
,i.name as [Index_Name]
,SUM(c.on_disk_size)/(1024.0*1024)
As [Columstore_Index_size_on_disk_size (In MBs)]
FROM sys.indexes AS i
JOIN sys.partitions AS p
ON i.object_id = p.object_id
JOIN sys.column_store_segments AS c
ON c.hobt_id = p.hobt_id
WHERE i.type_desc = 'NONCLUSTERED COLUMNSTORE'
AND ((1=(CASE WHEN @TableName is Null THEN 1 ELSE 0 END)
OR i.object_id = object_id(@TableName)))
GROUP BY i.object_id,i.name
 
UNION ALL
 
SELECT i.object_id
,i.name as [Index_Name]
,SUM(c.on_disk_size)/(1024.0*1024)
As [Columstore_Index_size_on_disk_size (In MBs)]
FROM sys.indexes AS i
JOIN sys.partitions AS p
ON i.object_id = p.object_id
JOIN sys.column_store_dictionaries AS c
ON c.hobt_id = p.hobt_id
WHERE i.type_desc = 'NONCLUSTERED COLUMNSTORE'
AND ((1=(CASE WHEN @TableName is Null THEN 1 ELSE 0 END)
OR i.object_id = object_id(@TableName)))
GROUP BY i.object_id,i.name )
 
Select object_id,object_name(object_id) as [Table_Name]
,[Index_Name]
,SUM([Columstore_Index_size_on_disk_size (In MBs)])
AS [Columstore_Index_size_on_disk_size (In MBs)] from CTE
Group By object_id,[Index_Name]

--End of script
