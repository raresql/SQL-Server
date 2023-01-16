--Script Name: Columnstore Index
--Script Type: Performance
--Article: https://raresql.com/2013/03/17/sql-server-2012-columnstore-index/
--Developed By: Muhammad Imran
--Date Created: 17 Mar 2013
--Date Modified: 12 Jan 2023

--Script

--Step-1

--Sample

--Create table
CREATE TABLE dbo.[PurchaseOrderDetail_Sample](
 [PurchaseOrderID] [int] NOT NULL,
 [PurchaseOrderDetailID] [int] NOT NULL,
 [DueDate] [datetime] NOT NULL,
 [OrderQty] [smallint] NOT NULL, 
 [ProductID] [int] NOT NULL,
 [UnitPrice] [money] NOT NULL,
 [LineTotal] numeric(18,2),
 [ReceivedQty] [decimal](8, 2) NOT NULL,
 [RejectedQty] [decimal](8, 2) NOT NULL,
 [StockedQty] Numeric(18,2),
 [ModifiedDate] [datetime] NOT NULL)

--End of step-1

--Step-2

--Insert records into table

--This insertion is just to demonstrate,
--It is not recommended on production server.
Insert into dbo.[PurchaseOrderDetail_Sample]
Select * from [Purchasing].[PurchaseOrderDetail]
GO 100

--End of step-2

--Step-3

--Create INDEX
CREATE NONCLUSTERED COLUMNSTORE INDEX
[IX_PurchaseOrderDetail_Sample_ColumnStore]
ON [PurchaseOrderDetail_Sample]
(UnitPrice, OrderQty,ReceivedQty,ProductID)
GO

--End of step-3

--End of sample

--Step-4

SET STATISTICS TIME ON
SET STATISTICS IO ON

--This query will use columnstore index and will return the result set.

SELECT ProductID as [Product ID], AVG(UnitPrice) as [Average Unit Price]
,SUM(OrderQty) as [Purchase Order Qty], AVG(ReceivedQty) as [Received Qty]
FROM [dbo].[PurchaseOrderDetail_Sample]
GROUP BY ProductID
ORDER BY ProductID
 
GO

--This query will ignore columnstore index and will return the result set.

SELECT ProductID as [Product ID], AVG(UnitPrice) as [Average Unit Price]
,SUM(OrderQty) as [Purchase Order Qty], AVG(ReceivedQty) as [Received Qty]
FROM [dbo].[PurchaseOrderDetail_Sample]
GROUP BY ProductID
ORDER BY ProductID
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX)
 
SET STATISTICS TIME OFF
SET STATISTICS IO OFF

--End of step-4

--End of script
