--Script Name: ALTER INDEX REBUILD statement failed
--Script Type: Error
--Article: https://raresql.com/2013/04/30/sql-server-2012-fix-error-35327-alter-index-rebuild-statement-failed-because-specifying-fillfactor-is-not-allowed-when-rebuilding-a-columnstore-index-rebuild-the-columnstore-index-without-speci/
--Developed By: Muhammad Imran
--Date Created: 30 April 2013
--Date Modified: 30 Dec 2022

--Script

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Execute sp_MSforeachtable
EXEC sp_MSforeachtable @command1="print '?'"
, @command2="SET QUOTED_IDENTIFIER ON;ALTER INDEX ALL ON ?
REBUILD WITH (FILLFACTOR=80)"

--End of script

--Error
ALTER INDEX REBUILD statement failed because specifying FILLFACTOR is not allowed when rebuilding a columnstore index. Rebuild the columnstore index without specifying FILLFACTOR.

--End of error

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Create index
CREATE NONCLUSTERED COLUMNSTORE INDEX
[IX_SalesOrderDetail_ColumnStore]
ON [Sales].[SalesOrderDetail]
([ProductID],
 [OrderQty],
 [UnitPrice]
)WITH (DROP_EXISTING = OFF) ON [PRIMARY]
GO

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Execute sp_MSforeachtable
EXEC sp_MSforeachtable @command1="print '?'"
, @command2="SET QUOTED_IDENTIFIER ON;ALTER INDEX ALL ON ?
REBUILD WITH (FILLFACTOR=80)"

--End of error generation

--Error resolution

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Execute sp_msForEachTable
EXECUTE sp_msForEachTable ' Print ''?'';SET QUOTED_IDENTIFIER ON
;IF EXISTS (Select * from sys.indexes
Where object_id = object_id(''?'') And type=6)

--Alter index
ALTER INDEX ALL ON ? REBUILD ELSE
ALTER INDEX ALL ON ? REBUILD WITH (FILLFACTOR=80)'

--End of error resolution
