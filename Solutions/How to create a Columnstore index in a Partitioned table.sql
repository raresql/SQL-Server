-- Script Name: How to create a Columnstore index in a Partitioned table
-- Script Type: Solution
-- Developed By: Muhammad Imran
-- Date Created: 30th March 2014
-- Date Modified: 24th Dec 2022


-- Step-1
-- Create a partition function as shown below

-- Use AdventureWorks database
USE AdventureWorks2012
GO

-- Create Partition function
CREATE PARTITION FUNCTION [PFByDueDate](datetime) AS RANGE RIGHT
FOR VALUES
(
     N'2005-05-31T00:00:00', N'2006-05-31T00:00:00' 
  ,  N'2007-05-31T00:00:00', N'2008-05-31T00:00:00' 
  ,  N'2009-05-31T00:00:00'
);
GO

-- End of Step-1

-- Step-2
-- Create a partition scheme on the above partition function (If you already have partition scheme please SKIP this step)

-- Use AdventureWorks dabatase
USE AdventureWorks2012
GO

-- Create Partition scheme
CREATE PARTITION SCHEME [PSDueDateByMonthRange]
AS PARTITION [PFByDueDate]
ALL TO ([PRIMARY]);
GO

-- End of Step-2

-- Step-3
-- create a table using above created partition scheme to partition the data accordingly (If you already created a table using partition scheme please SKIP this step.)

-- Use AdventureWorks database
USE AdventureWorks2012
GO

-- Create table PurchaseOrderDetail_Sample
CREATE TABLE dbo.[PurchaseOrderDetail_Sample]
(
   [PurchaseOrderID] [int] NOT NULL
 , [PurchaseOrderDetailID] [int] NOT NULL
 , [DueDate] [datetime] NOT NULL
 , [OrderQty] [smallint] NOT NULL
 , [ProductID] [int] NOT NULL
 , [UnitPrice] [money] NOT NULL
 , [LineTotal] numeric(18,2)
 , [ReceivedQty] [decimal](8, 2) NOT NULL
 , [RejectedQty] [decimal](8, 2) NOT NULL
 , [StockedQty] Numeric(18,2)
 , [ModifiedDate] [datetime] NOT NULL
) ON [PSDueDateByMonthRange]([DueDate]);
GO

-- End of Step-3

-- Step-4
-- Insert some data to test the performance

--This query may take 2 to 10 minutes depending upon the server.
-- Use AdventureWorks database
USE AdventureWorks2012
GO

-- Insert data 
INSERT INTO dbo.[PurchaseOrderDetail_Sample] WITH(TABLOCK);

-- Browse data
SELECT * FROM [Purchasing].[PurchaseOrderDetail];
GO 100

-- End of Step-4

-- Step-5
-- Build the columnstore index. (Remember, once you build the columnstore index you cannot modify the data in the table.)

-- Use AdventureWorks database
USE AdventureWorks2012
GO

-- Create COLUMNSTORE INDEX
CREATE NONCLUSTERED COLUMNSTORE INDEX
[IX_PurchaseOrderDetail_Sample_ColumnStore]
ON [PurchaseOrderDetail_Sample]
(
   UnitPrice
 , OrderQty
 , ReceivedQty
 , ProductID);
GO

-- End of Step-5

-- Step-6
-- Execute the query and view the result set WITHOUT columnstore index.

-- This query will ignore columnstore index
-- By using table's option namely IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX and will return the result set.

-- Use AdventureWorks database
USE AdventureWorks2012
GO

-- Set Statistics value to ON
SET STATISTICS TIME ON
SET STATISTICS IO ON
GO

-- Browse data
SELECT
    ProductID as [Product ID]
  , AVG(UnitPrice) as [Average Unit Price]
  , SUM(OrderQty) as [Purchase Order Qty]
  , AVG(ReceivedQty) as [Received Qty]
FROM [dbo].[PurchaseOrderDetail_Sample]
WHERE [DueDate] Between '2007-01-01' And '2008-12-31'
GROUP BY ProductID
ORDER BY ProductID
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX);
GO

-- End of Step-6

-- Step-7
-- Lets execute the query and view the result set WITH the columnstore index.

-- Use AdventureWorks database
USE AdventureWorks2012
GO

-- Set Statistics value to on
SET STATISTICS TIME ON
SET STATISTICS IO ON
GO

-- Browse data with columnstore index
SELECT
  ProductID as [Product ID]
, AVG(UnitPrice) as [Average Unit Price]
, SUM(OrderQty) as [Purchase Order Qty]
, AVG(ReceivedQty) as [Received Qty]
FROM [dbo].[PurchaseOrderDetail_Sample]
WHERE [DueDate] Between '2007-01-01' And '2008-12-31'
GROUP BY ProductID
ORDER BY ProductID;
GO

-- End of Step-7
