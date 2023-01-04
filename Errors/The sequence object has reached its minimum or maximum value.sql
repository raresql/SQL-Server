--Script Name: The sequence object has reached its minimum or maximum value.
--Script Type: Error
--Article: https://raresql.com/2013/04/11/sql-server-2012-fix-error-35343-create-index-statement-failed-column-has-a-data-type-that-cannot-participate-in-a-columnstore-index-omit-column/
--Developed By: Muhammad Imran
--Date Created: 11 April 2013
--Date Modified: 30 Dec 2022

--Error
--CREATE INDEX statement failed. Column ‘%.*ls’has a data type that cannot participate in a columnstore index. Omit column ‘%.*ls’.

--End of error

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Create Index
CREATE NONCLUSTERED COLUMNSTORE INDEX [IX_SalesOrderDetail_ColumnStore]
ON [Sales].[SalesOrderDetail]
(
[ProductID],
[OrderQty],
[UnitPrice],
[Rowguid]
)WITH (DROP_EXISTING = OFF) ON [PRIMARY]
GO
--End of error generation

--Error resolution

--Create Index
CREATE NONCLUSTERED COLUMNSTORE INDEX [IX_SalesOrderDetail_ColumnStore]
ON [Sales].[SalesOrderDetail]
(
[ProductID],
[OrderQty],
[UnitPrice]
)WITH (DROP_EXISTING = OFF) ON [PRIMARY]
GO

--End of error resolution
