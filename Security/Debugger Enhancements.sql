--Script Name: Debugger Enhancements
--Script Type: Security
--Article: https://raresql.com/2013/06/09/sql-server-2012-debugger-enhancements/
--Developed By: Muhammad Imran
--Date Created: 9 Jun 2013
--Date Modified: 7 Jan 2023

--Script

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
DECLARE @BusinessEntityID INT,
@FirstName VARCHAR(50),
@SalesQuota NUMERIC(18,2)
 
DECLARE Database_Cursor CURSOR FOR
 
Select top 4 BusinessEntityID,FirstName,SalesQuota
from [Sales].[vSalesPerson]
 
OPEN Database_Cursor
 
FETCH NEXT FROM Database_Cursor
INTO @BusinessEntityID, @FirstName, @SalesQuota
 
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT CONCAT(@BusinessEntityID,' '
, @FirstName,' ' ,@SalesQuota)
 
FETCH NEXT FROM Database_Cursor
INTO @BusinessEntityID, @FirstName, @SalesQuota
END
CLOSE Database_Cursor
DEALLOCATE Database_Cursor
GO

--End of script
