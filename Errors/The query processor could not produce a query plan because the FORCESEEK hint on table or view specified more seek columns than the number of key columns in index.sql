--Script Name: The query processor could not produce a query plan because the FORCESEEK hint on table or view specified more seek columns than the number of key columns in index.
--Script Type: Error
--Article: https://raresql.com/2013/05/10/sql-server-2012-fix-error-365-the-query-processor-could-not-produce-a-query-plan-because-the-forceseek-hint-on-table-or-view-specified-more-seek-columns-than-the-number-of-key-columns-in-index/
--Developed By: Muhammad Imran
--Date Created: 10 May 2013
--Date Modified: 30 Dec 2022

--Error
--The query processor could not produce a query plan because the FORCESEEK hint on table or view ‘%.*ls’ specified more seek columns than the number of key columns in index ‘%.*ls’.

--End of error

--Error generation

--Use databse AdventureWorks2012
USE [AdventureWorks2012]
GO

--Create index
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderDetail_Sample]
ON Purchasing.[PurchaseOrderDetail]
( [PurchaseOrderID]
 ,[ProductID] ASC
)
WITH (DROP_EXISTING = OFF) ON [PRIMARY]

--Use databse AdventureWorks2012
USE [AdventureWorks2012]
GO

--Browse data
SELECT * FROM Purchasing.PurchaseOrderHeader AS H
INNER JOIN Purchasing.PurchaseOrderDetail AS D
WITH (FORCESEEK
( IX_PurchaseOrderDetail_Sample
( PurchaseOrderID
 ,ProductID
 ,OrderQty
)))
ON H.PurchaseOrderID =D.PurchaseOrderID
WHERE
D.ProductID>100
AND D.PurchaseOrderID>10
AND D.OrderQty>0

--End of error generation

--Error resolution

--Use databse AdventureWorks2012
USE [AdventureWorks2012]
GO

--Browse data
SELECT * FROM Purchasing.PurchaseOrderHeader AS H
INNER JOIN Purchasing.PurchaseOrderDetail AS D
WITH (FORCESEEK
( IX_PurchaseOrderDetail_Sample
( PurchaseOrderID
 ,ProductID
)))
ON H.PurchaseOrderID =D.PurchaseOrderID
WHERE
D.ProductID>100
AND D.PurchaseOrderID>10
AND D.OrderQty>0

--End of error resolution
