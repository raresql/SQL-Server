--Script Name: Rebuild - Enable all indexes (Including Nonclustered Columnstore Indexes) – Part 3
--Script Type: Performance
--Article: https://raresql.com/2013/03/31/sql-server-rebuild-enable-all-indexes-including-nonclustered-columnstore-indexes-part-3/
--Developed By: Muhammad Imran
--Date Created: 31 Mar 2013
--Date Modified: 12 Jan 2023

--Script

--Create procedure
CREATE PROCEDURE dbo.[REBUILD_ALL_INDEXES_PROC]
@Type int
AS
BEGIN
DECLARE @Schema_TableName nvarchar(max)
DECLARE @Index_Type int
DECLARE @String varchar(max)
DECLARE @Fillfactor VARCHAR(3)
SET @Fillfactor=80
 
DECLARE IndexCursor CURSOR FOR
 
Select scma.[name] + '.'
+ Quotename(tbl.name) as [Schema_TableName]
,i.type
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
FETCH NEXT FROM IndexCursor INTO @Schema_TableName,@Index_Type
 
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @Index_Type=6
    BEGIN
                --To rebuild columnstore index only
        SET @String = 'ALTER INDEX ALL ON ' + @Schema_TableName +
                ' REBUILD;'
    END
    ELSE
    BEGIN
                --To rebuild other indexes
        SET @String = 'ALTER INDEX ALL ON ' + @Schema_TableName +
                ' REBUILD WITH (FILLFACTOR = ' + @Fillfactor + '
                , SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);'
    END
    Print @String
    EXEC (@String)
    FETCH NEXT FROM IndexCursor INTO @Schema_TableName,@Index_Type
END
CLOSE IndexCursor
DEALLOCATE IndexCursor
END
GO

--SYNTAX
--EXEC dbo.[REBUILD_ALL_INDEXES_PROC] Index type
 
--TO REBUILD NONCLUSTERED COLUMNSTORE INDEXES ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[REBUILD_ALL_INDEXES_PROC] 6
 
-- TO REBUILD HEAP ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[REBUILD_ALL_INDEXES_PROC] 0
GO

-- TO REBUILD CLUSTERED INDEX ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[REBUILD_ALL_INDEXES_PROC] 1
GO

-- TO REBUILD NONCLUSTERED INDEX ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[REBUILD_ALL_INDEXES_PROC] 2
GO

-- TO REBUILD XML INDEX ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[REBUILD_ALL_INDEXES_PROC] 3
GO

-- TO REBUILD SPATIAL INDEX ONLY

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[REBUILD_ALL_INDEXES_PROC] 4
GO

--TO REBUILD ALL INDEXES

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
EXEC dbo.[REBUILD_ALL_INDEXES_PROC] NULL
GO

--End of script
