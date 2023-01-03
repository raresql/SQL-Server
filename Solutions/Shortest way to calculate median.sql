--Script Name: Shortest way to calculate median
--Script Type: Solution
--Article: https://raresql.com/2013/09/21/sql-server-2012-shortest-way-to-calculate-median/
--Developed By: Muhammad Imran
--Date Created: 21st September 2013
--Date Modified: 27th December 2022


--Sample

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT ProductID
     , StandardCost
FROM [Production].[ProductCostHistory]
WHERE ProductID IN (707,708,711,712,713)
ORDER BY ProductID;
GO

--End of Sample

--Script
--Calculate the median in a shortest way

--Use database AdventureWorks	
USE AdventureWorks2016
GO

--Browse median data
SELECT DISTINCT [ProductID]
     , PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY [StandardCost]) 
OVER (PARTITION BY [ProductID]) AS Median
FROM [Production].[ProductCostHistory]
WHERE ProductID IN (707,708,711,712,713)
ORDER BY [ProductID];

--End of script
