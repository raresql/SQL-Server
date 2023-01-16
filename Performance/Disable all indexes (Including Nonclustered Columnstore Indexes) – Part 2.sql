--Script Name: Disable all indexes (Including Nonclustered Columnstore Indexes) – Part 2
--Script Type: Performance
--Article: https://raresql.com/2013/03/30/sql-server-disable-all-indexes-including-nonclustered-columnstore-indexes-part-2/
--Developed By: Muhammad Imran
--Date Created: 30 Mar 2013
--Date Modified: 12 Jan 2023

--Script

--Create procedure
CREATE PROCEDURE dbo.[Disable_ALL_INDEXES_PROC]
@Type int
AS
BEGIN
DECLARE @Schema_TableName nvarchar(max)
DECLARE @String varchar(max)
DECLARE IndexCursor CURSOR FOR
 
Select scma.[name] + '.'
+ Quotename(tbl.name) as [Schema_TableName]
from sys.tables AS tbl
INNER JOIN sys.indexes AS i
ON (i.index_id > 0 AND i.is_hypothetical = 0)
AND (i.object_id=tbl.object_id)
INNER JOIN sys.schemas AS scma
ON tbl.schema_id=scma.schema_id
Where tbl.type='U' AND ((1=(CASE
WHEN @Type is Null THEN 1 ELSE 0 END)
OR i.type = @Type))
Order By scma.[name] + '.' + tbl.name
 
OPEN IndexCursor
FETCH NEXT FROM IndexCursor INTO @Schema_TableName
 
WHILE @@FETCH_STATUS = 0
BEGIN
SET @String = 'ALTER INDEX ALL ON ' + @Schema_TableName + ' DISABLE;'
Print @String
EXEC (@String)
FETCH NEXT FROM IndexCursor INTO @Schema_TableName
END
CLOSE IndexCursor
DEALLOCATE IndexCursor
END
GO

--SYNTAX
--EXEC dbo.[Disable_ALL_INDEXES_PROC] Index type
 
--TO DISABLE NONCLUSTERED COLUMNSTORE INDEXES ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[Disable_ALL_INDEXES_PROC] 6
 
-- TO DISABLE HEAP ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[Disable_ALL_INDEXES_PROC] 0
GO

-- TO DISABLE CLUSTERED INDEX ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[Disable_ALL_INDEXES_PROC] 1
GO

-- TO DISABLE NONCLUSTERED INDEX ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[Disable_ALL_INDEXES_PROC] 2
GO

-- TO DISABLE XML INDEX ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[Disable_ALL_INDEXES_PROC] 3
GO

-- TO DISABLE SPATIAL INDEX ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[Disable_ALL_INDEXES_PROC] 4
GO

--TO DISABLE ALL INDEXES

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[Disable_ALL_INDEXES_PROC] NULL
GO

--End of script
