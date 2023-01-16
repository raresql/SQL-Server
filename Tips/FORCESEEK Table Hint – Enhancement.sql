--Script Name: FORCESEEK Table Hint – Enhancement
--Script Type: Tips
--Article: https://raresql.com/2013/04/16/sql-server-2012-forceseek-table-hint-enhancement/
--Developed By: Muhammad Imran
--Date Created: 16 Apr 2013
--Date Modified: 7 Jan 2023

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO

--Create index
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderDetail_PurchaseOrderID]
ON Purchasing.[PurchaseOrderDetail]
(
[PurchaseOrderID] ASC
) WITH (DROP_EXISTING = OFF) ON [PRIMARY]

--FORCESEEK in earier version of SQL 

---This query will work on SQL Server 2008 and above.

--Use database AdventureWorks2012
USE [AdventureWorks2012]
GO
Select * from Purchasing.PurchaseOrderHeader as h
Inner join Purchasing.PurchaseOrderDetail as d with (forceseek)
On h.PurchaseOrderID =d.PurchaseOrderID
Where h.TotalDue >50

--FORCESEEK in SQL Server 2012

--Example-1

--Use database AdventureWorks2012
---This query will work on SQL Server 2012 and above.
USE [AdventureWorks2012]
GO
Select * from Purchasing.PurchaseOrderHeader as h
Inner join Purchasing.PurchaseOrderDetail as d with
(forceseek,INDEX(IX_PurchaseOrderDetail_PurchaseOrderID))
On h.PurchaseOrderID =d.PurchaseOrderID
Where h.TotalDue >50

--End of example-1

--Example-2

--Use database AdventureWorks2012
---This query will work on SQL Server 2012 and above.
USE [AdventureWorks2012]
GO
Select * from Purchasing.PurchaseOrderHeader as h
Inner join Purchasing.PurchaseOrderDetail as d
with (forceseek(IX_PurchaseOrderDetail_PurchaseOrderID(PurchaseOrderID)))
On h.PurchaseOrderID =d.PurchaseOrderID
Where h.TotalDue >50

--End of example-2
