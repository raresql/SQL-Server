--Script Name: Faster way to calculate running total
--Script Type: Solution
--Article: https://raresql.com/2013/05/25/sql-server-faster-way-to-calculate-running-total/
--Developed By: Muhammad Imran
--Date Created: 25 May 2013
--Date Modified: 10 Jan 2023

--Method-1
--Use self join

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse tables
SELECT
  A.SalesOrderID AS [SalesOrderID]
, A.SalesOrderDetailID AS [SalesOrderDetailID]
, A.ProductID AS [ProductID]
, A.LineTotal AS [LineTotal]
, SUM(B.lineTotal) AS [Running Total]
 
FROM SALES.SalesOrderDetail A
INNER JOIN Sales.SalesOrderDetail B
ON A.SalesOrderID =B.SalesOrderID
AND B.SalesOrderDetailID<=A.SalesOrderDetailID
WHERE A.SalesOrderID =43659
GROUP BY
  A.SalesOrderID
, A.SalesOrderDetailID
, A.ProductID
, A.LineTotal
ORDER BY
  A.SalesOrderID
, A.SalesOrderDetailID
, A.ProductID
, A.LineTotal
GO

--End of method-1

--Method-2
--Use sub query

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse tables
SELECT
  A.SalesOrderID AS [SalesOrderID]
, A.SalesOrderDetailID AS [SalesOrderDetailID]
, A.ProductID AS [ProductID]
, A.LineTotal AS [LineTotal]
, (
   SELECT SUM(B.lineTotal)
   FROM SALES.SalesOrderDetail B
   WHERE A.SalesOrderID =B.SalesOrderID
   AND B.SalesOrderDetailID<=A.SalesOrderDetailID
   ) AS [Running Total]
FROM SALES.SalesOrderDetail A
WHERE A.SalesOrderID =43659
GO
--End of method-2

--Method-3
--Use SUM() function

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse tables
SELECT
  SalesOrderID
, SalesOrderDetailID
, ProductID
, LineTotal
, SUM(LineTotal)
  OVER(PARTITION BY SalesOrderID
       ORDER BY SalesOrderID,SalesOrderDetailID)
  AS [Running Total]
FROM SALES.SalesOrderDetail
WHERE SalesOrderID =43659
GO
--End of method-3
