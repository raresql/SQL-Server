-- Script Name: Total row count from OFFSET - FETCH NEXT (Paging)
-- Script Type: Solutions
-- Developed By: Muhammad Imran
-- Date Created: 30th March 2015
-- Date Modified: 24th Dec 2022

-- Create Sample

-- Use AdventureWorks Database
USE AdventureWorks2014
GO

-- Create Sample Table Table
CREATE TABLE [dbo].[SalesOrderDetail](
      [SalesOrderID] [int] NOT NULL
    , [SalesOrderDetailID] [int] NOT NULL
    , [CarrierTrackingNumber] [nvarchar](25) NULL
    , [OrderQty] [smallint] NOT NULL
    , [ProductID] [int] NOT NULL
    , [SpecialOfferID] [int] NOT NULL
    , [UnitPrice] [money] NOT NULL
    , [UnitPriceDiscount] [money] NOT NULL
    , [LineTotal] [numeric](38, 6) NOT NULL
    , [rowguid] [uniqueidentifier] NOT NULL
    , [ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY];
GO
 
-- Insert bulk data into sample table
-- It may take few minutes depending upon the server performance
INSERT INTO [dbo].[SalesOrderDetail]
SELECT * FROM [SALES].[SalesOrderDetail];
GO 100
 
-- Verfiy the data
Select * from [dbo].[SalesOrderDetail];
GO

-- End of Sample

-- Example-1
-- Using COUNT(*) OVER() 

-- Use AdventureWorks Database
USE AdventureWorks2014
GO

-- Declare Variables
DECLARE @PageSize INT = 10
      , @PageNum  INT = 1;

-- Browse Data
SELECT [SalesOrderID]
     , [SalesOrderDetailID]
     , [CarrierTrackingNumber]
     , [OrderQty]
     , [ProductID]
     , [SpecialOfferID]
     , [TotalCount]= COUNT(*) OVER()
FROM [dbo].[SalesOrderDetail]
ORDER BY SalesOrderID
OFFSET (@PageNum-1)*@PageSize ROWS
FETCH NEXT @PageSize ROWS ONLY;
GO

-- End of example-1

-- Example-2
-- Using Common Table Expression

-- Use AdventureWorks Database
USE AdventureWorks2014
GO

-- Declare Variables
DECLARE @PageSize INT = 10
      , @PageNum  INT = 1;
 
WITH Main_CTE AS(
        SELECT [SalesOrderID]
             , [SalesOrderDetailID]
	     , [CarrierTrackingNumber]
	     , [OrderQty]
	     , [ProductID]
	     , [SpecialOfferID]
	FROM [dbo].[SalesOrderDetail]
);

Count_CTE AS (
	SELECT COUNT(*) AS [TotalCount]
	FROM Main_CTE
);

-- Browse Data
SELECT *
FROM Main_CTE, Count_CTE
ORDER BY Main_CTE.SalesOrderID
OFFSET (@PageNum-1)*@PageSize ROWS
FETCH NEXT @PageSize ROWS ONLY;
GO

-- End of example-2

-- Example 3
-- Using Cross Apply

-- Use AdventureWorks database
USE AdventureWorks2014
GO

-- Declare Variables
DECLARE @PageSize INT = 10
      , @PageNum  INT = 1;
 
SELECT [SalesOrderID]
     , [SalesOrderDetailID]
     , [CarrierTrackingNumber]
     , [OrderQty]
     , [ProductID]
     , [SpecialOfferID]
     , [TotalCount]
FROM [dbo].[SalesOrderDetail]
 
CROSS APPLY (SELECT COUNT(*) TotalCount
FROM [dbo].[SalesOrderDetail] ) [Count]
ORDER BY SalesOrderID
OFFSET (@PageNum-1)*@PageSize ROWS
FETCH NEXT @PageSize ROWS ONLY;
GO

-- End of Example-3

