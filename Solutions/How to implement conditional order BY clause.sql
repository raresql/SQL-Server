--Script Name: How to implement conditional order BY clause
--Script Type: Solution
--Article: https://raresql.com/2015/08/21/sql-server-how-to-implement-conditional-order-by-clause/
--Developed By: Muhammad Imran
--Date Created: 21 Aug 2015
--Date Modified: 3 Jan 2023

--Use database AdventureWorks2014
Use AdventureWorks2014
GO
 
--Declare variables
DECLARE @SortCoulmnName VARCHAR(50) = 'OrderDate';
DECLARE @SortColumnNumber AS INT

--Set values of variables
--Use CASE
SET @SortColumnNumber = CASE
When @SortCoulmnName='SalesOrderID' THEN 0
WHEN @SortCoulmnName='OrderDate' THEN 1
WHEN @SortCoulmnName='DueDate' THEN 2
WHEN @SortCoulmnName='ShipDate' THEN 3
ELSE 0
END
-- By Default, it will sort on first column

--Browse the data 
--Use CHOOSE()
SELECT SalesOrderID
,OrderDate
,DueDate
,ShipDate
,Status
FROM
Sales.SalesOrderHeader
ORDER BY
CHOOSE(@SortColumnNumber,SalesOrderID,OrderDate,DueDate,ShipDate) DESC
GO
--END
