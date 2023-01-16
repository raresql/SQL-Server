--Script Name: ORDER BY OFFSET and FETCH NEXT
--Script Type: Solution
--Article: https://raresql.com/2012/07/01/sql-paging-in-sql-server-2012-using-order-by-offset-and-fetch-next/
--Developed By: Muhammad Imran
--Date Created: 1 Jul 2012
--Date Modified: 11 Jan 2023

--Script

--Use database AdventureWorks
USE AdventureWorks
GO

--Browse table
SELECT *
FROM   (SELECT ROW_NUMBER() OVER(ORDER BY EmployeeID) AS
       rownumber, [FirstName], [LastName],[JobTitle] FROM HumanResources.vEmployee) AS Salaries1
WHERE  rownumber >= 10 AND rownumber = 10 AND rownumber

--Use ORDER BY OFFSET

--Use database AdventureWorks
USE AdventureWorks2012
GO

--Browse table
Select BusinessEntityID,[FirstName], [LastName],[JobTitle]
from HumanResources.vEmployee
Order By BusinessEntityID
OFFSET 10 ROWS

--Order By Offset With FETCH NEXT

--Use database AdventureWorks
USE AdventureWorks
GO

--Browse table
Select BusinessEntityID,[FirstName], [LastName],[JobTitle]
from HumanResources.vEmployee
Order By BusinessEntityID

Order By Fetch Next Rows Only:

--Use database AdventureWorks
USE AdventureWorks
GO

--Browse table
Select BusinessEntityID,[FirstName], [LastName],[JobTitle]
from HumanResources.vEmployee
Order By BusinessEntityID
--OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY

--Create procedure

--Use database AdventureWorks2012
USE AdventureWorks2012
go
Create Procedure dbo.Sp_Data_Paging
@PageNo int,
@RecordsPerPage int
AS
 
Select BusinessEntityID,[FirstName], [LastName],[JobTitle]
from HumanResources.vEmployee
Order By BusinessEntityID
OFFSET (@PageNo-1)*@RecordsPerPage ROWS
FETCH NEXT @RecordsPerPage ROWS ONLY
GO
Sp_Data_Paging 1,10 --First Page
GO

Sp_Data_Paging 2,10 --2nd Page
GO

Sp_Data_Paging 3,10 --3rd Page
GO

--End of script
