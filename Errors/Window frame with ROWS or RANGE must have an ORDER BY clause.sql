--Script Name: Window frame with ROWS or RANGE must have an ORDER BY clause
--Script Type: Error
--Article: https://raresql.com/2013/01/27/sql-server-window-frame-with-rows-or-range-must-have-an-order-by-clause/
--Developed By: Muhammad Imran
--Date Created: 27 Jan 2013
--Date Modified: 10 Jan 2023

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse table
SELECT SalesOrderID, ProductID, OrderQty
,SUM(OrderQty) OVER (PARTITION BY SalesOrderID
--ORDER BY SalesOrderID, ProductID
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS 'total'
FROM Sales.SalesOrderDetail
Where SalesOrderID IN(43659,43664)
Order By SalesOrderID
 
--End of error generation

--Error resolution

--In the above example, you can see, I used Window frame with ROWS in the OVER clause but forgot to provide order by clause. Remember, whenever you use Window frame with rows or range, make sure you use it along with order by clause to avoid this error.

--End of error resolution

