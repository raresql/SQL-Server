--Script Name: How to convert user defined objects to system objects
--Script Type: Solution
--Article: https://raresql.com/2013/03/04/sql-server-how-to-convert-user-defined-objects-to-system-objects/
--Developed By: Muhammad Imran
--Date Created: 4 Mar 2013
--Date Modified: 5 Jan 2023

--Step-1

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Create procedure
Create Procedure SP_ColumnNames
@object_name nvarchar(Max)
as
Select (Case when [column_id] = 1 then ' ' else ',' end)
+ QuoteName([name]) As [Column Name]
from sys.columns
where object_id=Object_id(@Object_name)
GO

--End of step-1

--Step-2
--Use database AdventureWorks2012
Use AdventureWorks2012
Go
SP_ColumnNames 'Sales'

--End of step-2

--Step-3

--Use database test
Use test
GO
SP_ColumnNames 'Student'

--End of step-3

--Step-4

--Use database master
Use master
GO

--Create procedure
Create Procedure SP_ColumnNames
@object_name nvarchar(Max)
as

--Browse data
Select (Case when [column_id] = 1 then ' ' else ',' end)
+ QuoteName([name]) As [Column Name]
from sys.columns
where object_id=Object_id(@Object_name)
GO
sp_ms_marksystemobject  'SP_ColumnNames'

--End of step-4

--Step-5

--Use database AdventureWorks2012
Use AdventureWorks2012
Go
SP_ColumnNames 'dbo.sales'
GO
Use test
Go
SP_ColumnNames 'Student'

--End of step-5
