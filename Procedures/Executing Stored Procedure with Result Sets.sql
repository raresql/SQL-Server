--Script Name: Executing Stored Procedure with Result Sets
--Script Type: Procedure
--Article: https://raresql.com/2012/07/02/sql-server-2012-executing-stored-procedure-with-result-sets/
--Developed By: Muhammad Imran
--Date Created: 2 Jul 2012
--Date Modified: 7 Jan 2023

--Example-1

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Create procedure
Create PROCEDURE SP_ResultSet_Example1
as
Select [DepartmentID]
,[Name]
,[ModifiedDate]
from  [HumanResources].[Department]
GO
EXEC SP_ResultSet_Example1
GO

--Use database AdventureWorks2012
Use AdventureWorks2012
GO
EXEC SP_ResultSet_Example1
WITH RESULT SETS
(
( [Department ID] int NOT NULL,
[Department name] Name NOT NULL,
[Modified Date] varchar(11) NOT NULL
));
GO

--End of example-1

--Example-2

--Without resultset

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Create procedure
Create PROCEDURE SP_ResultSet_Example2
as
Select [DepartmentID]
,[Name]
,ModifiedDate
from  [HumanResources].[Department]
Select 'Total' as [Total] ,Count(*) as [Count] from [HumanResources].[Department]
GO
EXEC SP_ResultSet_Example2
GO

--With resultset

--Use database AdventureWorks2012
Use AdventureWorks2012
GO
EXEC SP_ResultSet_Example2
WITH RESULT SETS
(
( [Department ID] int NOT NULL,
[Department name] Name NOT NULL,
[Modified Date] varchar(11) NOT NULL
),
(
[Total] varchar(5) NOT NULL,
[Department Count] Int NOT NULL
));

--End of example-2

