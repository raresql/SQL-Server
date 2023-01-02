--Script Name: How to recover the recent executed query
--Script Type: Solution
--Article: https://raresql.com/2013/01/30/sql-server-how-to-recover-the-recent-executed-query/
--Developed By: Muhammad Imran
--Date Created: 30 Jan 2013
--Date Modified: 28 Dec 2022

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse data
Select * from Sales.vStoreWithContacts
Select * from Production.ScrapReason
Select * from Sales.vStoreWithAddresses
Select * from Purchasing.vVendorWithContacts
Select * from HumanResources.Shift
Select * from Purchasing.vVendorWithAddresses
Select * from Production.ProductCategory
Select * from Purchasing.ShipMethod
Select * from Production.ProductCostHistory
Select * from Production.ProductDescription
Select * from Sales.ShoppingCartItem;
GO

--Query history 
SELECT Distinct qt.TEXT AS [Queries]
FROM sys.dm_exec_query_stats AS qs 
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt;
GO

--End of Query history 
