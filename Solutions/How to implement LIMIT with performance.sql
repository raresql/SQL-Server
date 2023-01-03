--Script Name: How to implement LIMIT with performance
--Script Type: Solution
--Article: https://raresql.com/2013/04/30/sql-server-how-to-implement-limit-with-performance/
--Developed By: Muhammad Imran
--Date Created: 30 Apr 2013
--Date Modified: 28 Dec 2022

--Sample

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Browse table
Select FirstName
	 , Jobtitle
From [HumanResources].[vEmployee] Order By FirstName,Jobtitle

--End of sample

--Old approach
--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Use CTE
;With CTE_Employee_List As
(
    Select ROW_NUMBER() Over
   (Order By[FirstName],[JobTitle]) As [Row Number],
    FirstName
    ,Jobtitle
    From [HumanResources].[vEmployee]
)
Select FirstName,Jobtitle
From CTE_Employee_List
Where [Row Number] Between 11 And 20;
GO

--End of old approach

--New approach

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Browse table
Select FirstName
	 , Jobtitle
From [HumanResources].[vEmployee] Order By FirstName,Jobtitle Offset 10 Rows
Fetch Next 50 Rows Only;

--End of new approach
