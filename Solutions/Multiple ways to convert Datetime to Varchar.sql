--Script Name: Multiple ways to convert Datetime to Varchar
--Script Type: Solution
--Article: https://raresql.com/2014/02/04/sql-server-multiple-ways-to-convert-datetime-to-varchar/
--Developed By: Muhammad Imran
--Date Created: 4 Feb 2014
--Date Modified: 26 Dec 2022

--Solution-1

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Use Convert() function
SELECT PurchaseOrderID
	 , OrderDate
	 , CONVERT(VARCHAR(11),OrderDate,113) 
	   AS [OrderDate Using Convert]
FROM Purchasing.PurchaseOrderHeader;
GO

--End of solution-1

--Solution-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
 
--Use Try_Convert() function
SELECT PurchaseOrderID
	 , OrderDate
	 , TRY_CONVERT(VARCHAR(11),OrderDate,113) 
AS [OrderDate Using Try_Convert]
FROM Purchasing.PurchaseOrderHeader;
GO

--End of solution-2

--Solution-3

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Use Format() function
SELECT PurchaseOrderID
	 , OrderDate
	 , FORMAT(OrderDate,'dd MMM yyyy') 
AS [OrderDate Using Format]
FROM Purchasing.PurchaseOrderHeader;
GO

--End of solution-3
