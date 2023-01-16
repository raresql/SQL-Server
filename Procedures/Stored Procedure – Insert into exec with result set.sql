--Script Name: Stored Procedure – Insert into exec with result set.
--Script Type: Procedure
--Article: https://raresql.com/2013/01/31/sql-server-stored-procedure-insert-into-exec-with-result-set/
--Developed By: Muhammad Imran
--Date Created: 31 Jan 2013
--Date Modified: 7 Jan 2023

--Example-1

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Create table
Create Table #temp
(
[DepartmentID] int,
[Name] varchar(50)
)
GO

--Create procedure
Create PROCEDURE SP_ResultSet_Example1
as
Select [DepartmentID]
,[Name]
from [HumanResources].[Department]
GO

--Insert records
Insert into #temp EXEC SP_ResultSet_Example1
GO
Select * from #temp order by [DepartmentID]

--End of example-1

--Example-2

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Create table
Create Table #temp
(
[DepartmentID] int,
[Name] varchar(50)
)
GO

--Create procedure
Create PROCEDURE SP_ResultSet_Example1
as
Select [DepartmentID]
,[Name]
from [HumanResources].[Department]
GO
 
--Insert records
Insert into #temp EXEC SP_ResultSet_Example1 WITH RESULT SETS
(
([Department ID] int NOT NULL,
[Department name] Name NOT NULL));
GO

--Browse table
Select * from #temp order by [DepartmentID]

--End of example-2
