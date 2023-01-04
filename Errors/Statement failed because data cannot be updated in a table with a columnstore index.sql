--Script Name: Statement failed because data cannot be updated in a table with a columnstore index.
--Script Type: Error
--Article: https://raresql.com/2013/03/31/sql-server-2012-fix-error-35330-statement-failed-because-data-cannot-be-updated-in-a-table-with-a-columnstore-index-consider-disabling-the-columnstore-index-before-issuing-the-s_msg-statement/
--Developed By: Muhammad Imran
--Date Created: 31 March 2013
--Date Modified: 30 Dec 2022

--Error 
--%S_MSG statement failed because data cannot be updated in a table with a columnstore index. Consider disabling the columnstore index before issuing the %S_MSG statement, then rebuilding the columnstore index after %S_MSG is complete

--End of error

--Error generation

--Step-1

--Sample

--Use database AdventureWorks2012
USE AdventureWorks2012
Go

--Create table
CREATE Table tbl_Product_Master
(
 [Product ID] int,
 [Product Name] nvarchar(100),
 [Model] int
)
Go

--End of step-1

--Step-2

--Use database AdventureWorks2012
USE AdventureWorks2012
Go

--Insert records into table
INSERT into tbl_Product_Master values (1,'Car',2011)

--End of step-2

--Step-3

--Use database AdventureWorks2012
USE AdventureWorks2012
Go

--Browse table
SELECT * from tbl_Product_Master

--End of step-3
--End of sample

--Step-4

--Create NONCLUSTERED INDEX
CREATE NONCLUSTERED COLUMNSTORE INDEX
[IX_tbl_Product_Master_ColumnStore]
ON [tbl_Product_Master] ([Product Name], [Model],[Product ID])

--End of step-4

--Step-5

--Insert records into table
INSERT into tbl_Product_Master values (2,'Car',2012)

--Delete records
DELETE from tbl_Product_Master where [Product ID]=1

--Update table
UPDATE tbl_Product_Master set [Model]=2013 where [Product ID]=2

--End of step-5

--Error resolution

--Step-1

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--To disable columnstore index
--Alter table
ALTER INDEX [IX_tbl_Product_Master_ColumnStore]
ON [tbl_Product_Master] DISABLE ;
 
--Use database AdventureWorks2012
USE AdventureWorks2012;
GO
--To drop columnstore index
--Drop Index
DROP INDEX [IX_tbl_Product_Master_ColumnStore]
ON [tbl_Product_Master]

--End of step-1

--Step-2

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Insert records into table
INSERT into tbl_Product_Master values (2,'Car',2012)

--Delete records
DELETE from tbl_Product_Master where [Product ID]=1

--Update table
UPDATE tbl_Product_Master set [Model]=2013 where [Product ID]=2

--End of step-2

--Step-3

--To enable / rebuild columnstore index

--Alter INDEX
ALTER INDEX [IX_tbl_Product_Master_ColumnStore]
ON [tbl_Product_Master] REBUILD;
GO
 
--OR

--create columnstore index
CREATE NONCLUSTERED COLUMNSTORE INDEX
[IX_tbl_Product_Master_ColumnStore]
ON [tbl_Product_Master] ([Product Name]
, [Model],[Product ID])

--End of step-3

--End of error resolution
