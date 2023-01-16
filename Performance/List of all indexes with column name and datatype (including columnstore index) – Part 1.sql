--Script Name: List of all indexes with column name and datatype (including columnstore index) – Part 1
--Script Type: Performance
--Article: https://raresql.com/2013/03/29/sql-server-list-of-all-indexes-with-column-name-and-datatype-including-columnstore-index/
--Developed By: Muhammad Imran
--Date Created: 29 Mar 2013
--Date Modified: 12 Jan 2023

--Script

--Create procedure
CREATE PROCEDURE dbo.[SEARCH_LIST_OF_ALL_INDEXES_PROC]
@Type int
AS
BEGIN
;WITH CTE AS (
SELECT TBL.object_id AS [Object ID]
, schema_name(schema_id) AS [Schema Name]
, tbl.name AS [Table Name]
, i.name AS [Index Name]
, i.type AS [Index type]
, i.type_desc AS [Index Desc]
, clmns.name AS [Column Name]
, styps.name AS [Type Name]
FROM
sys.tables AS tbl
INNER JOIN sys.indexes AS i
ON (i.index_id > 0 and i.is_hypothetical = 0)
AND (i.object_id=tbl.object_id)
INNER JOIN sys.index_columns AS ic
ON (ic.column_id > 0 and (ic.key_ordinal > 0
OR ic.partition_ordinal = 0
OR ic.is_included_column != 0))
AND (ic.index_id=CAST(i.index_id AS int)
AND ic.object_id=i.object_id)
INNER JOIN sys.columns AS clmns
ON clmns.object_id = ic.object_id
AND clmns.column_id = ic.column_id
INNER JOIN sys.systypes AS styps
ON clmns.system_type_id=styps.type
WHERE ((1=(CASE WHEN @Type is Null THEN 1 ELSE 0 END)
OR i.type = @Type)))
--To convert all datatypes into one row
SELECT [Object ID]
, [Schema Name]
, [Table Name]
, [Index Name]
, [Index Desc]
, STUFF((SELECT ', ' + [Column Name] + '(' + [Type Name] + ')'
FROM CTE AS CTE1
WHERE CTE1.[Object ID]= CTE2. [Object ID]
FOR XML PATH('')),1,1,'') as [Column Name with datatype]
FROM CTE AS CTE2
GROUP BY
 [Object ID]
,[Schema Name]
,[Table Name]
,[Index Name]
,[Index Desc]
ORDER BY [Object ID],[Schema Name],[Table Name]
END
GO

-- LIST OF NONCLUSTERED COLUMNSTORE INDEX

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[SEARCH_LIST_OF_ALL_INDEXES_PROC] 6
GO

-- LIST OF HEAP

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[SEARCH_LIST_OF_ALL_INDEXES_PROC] 0
GO

-- LIST OF CLUSTERED INDEX

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[SEARCH_LIST_OF_ALL_INDEXES_PROC] 1
GO

-- LIST OF NONCLUSTERED INDEX

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[SEARCH_LIST_OF_ALL_INDEXES_PROC] 2
GO

-- LIST OF XML INDEX

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[SEARCH_LIST_OF_ALL_INDEXES_PROC] 3
GO

-- LIST OF SPATIAL INDEX

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[SEARCH_LIST_OF_ALL_INDEXES_PROC] 4
GO
-- LIST OF ALL INDEX

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[SEARCH_LIST_OF_ALL_INDEXES_PROC] NULL
GO

--End of script
