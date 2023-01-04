--Script Name: The query processor could not produce a query plan because the FORCESEEK hint on table or view cannot be used with the column store index.
--Script Type: Error
--Article: https://raresql.com/2013/04/23/sql-server-2012-fix-error-366-the-query-processor-could-not-produce-a-query-plan-because-the-forceseek-hint-on-table-or-view-cannot-be-used-with-the-column-store-index/
--Developed By: Muhammad Imran
--Date Created: 23 April 2013
--Date Modified: 30 Dec 2022

--Error
--The query processor could not produce a query plan because the FORCESEEK hint on table or view ‘%.*ls’ cannot be used with the column store index ‘%.*ls’.

--End of error

--Error generation

--First Create a columnstore index on [Purchasing].[PurchaseOrderDetail]

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Create index
CREATE NONCLUSTERED COLUMNSTORE INDEX [IX_PurchaseOrderDetail_ColumnStore]
ON [Purchasing].[PurchaseOrderDetail]
(
 [ReceivedQty],
 [ProductID]
)
WITH (DROP_EXISTING = OFF) ON [PRIMARY]
GO
 
--Try to use it with FORCESEEK table hint

--Browse data 
SELECT * FROM [Purchasing].[PurchaseOrderDetail]
WITH (FORCESEEK,INDEX (IX_PurchaseOrderDetail_ColumnStore))

--End of error generation

--Error resolution

--Create a new noncluster index BUT NOT COLUMNSTORE INDEX

--Create index
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderDetail_Sample] ON [Purchasing].[PurchaseOrderDetail]
(
 [ReceivedQty],
 [ProductID]
)
WITH (DROP_EXISTING = OFF) ON [PRIMARY]
GO
 
--Execute the query against the index
SELECT * FROM [Purchasing].[PurchaseOrderDetail]
WITH (FORCESEEK,INDEX (IX_PurchaseOrderDetail_Sample))
Where ProductID>2 And ReceivedQty>5


--End of error resolution

--Clean database

--Drop index
DROP INDEX [IX_PurchaseOrderDetail_ColumnStore] 
ON [Purchasing].[PurchaseOrderDetail]
DROP INDEX [IX_PurchaseOrderDetail_Sample] 
ON [Purchasing].[PurchaseOrderDetail]

--End of clean database
