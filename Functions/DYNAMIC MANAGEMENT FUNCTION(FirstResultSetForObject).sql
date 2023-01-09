--Script Name: sys.dm_exec_describe_first_result_set_for_object – dynamic management function
--Script Type: Function
--Article: https://raresql.com/2013/01/15/sql-server-2012-sys-dm_exec_describe_first_result_set_for_object-dynamic-management-function/
--Developed By: Muhammad Imran
--Date Created: 24 Jan 2013
--Date Modified: 7 Jan 2023

--Syntax
sys.dm_exec_describe_first_result_set_for_object
    ( @object_id , @include_browse_information )
	
--End of syntax

--Example-1

--Use database AdventureWorks2012
Use AdventureWorks2012
GO
Select * from
sys.dm_exec_describe_first_result_set_for_object
(object_id('[dbo].[UDP_Employee]'),0)

--End of example-1

--Example-2

--Use database AdventureWorks2012
Use AdventureWorks2012
GO
Select * from
sys.dm_exec_describe_first_result_set_for_object
(object_id('[dbo].[UDP_Employee]'),1)

--End of example-2

--Example-3

Create Procedure SP_test
As
Select top 2 [DepartmentID],[Name] from [HumanResources].[Department] order by [DepartmentID]
 
Select top 2 [BusinessEntityID],[JobTitle] from [HumanResources].[Employee] order by [BusinessEntityID]
GO
EXEC SP_test

Use AdventureWorks2012
GO
Select * from
sys.dm_exec_describe_first_result_set_for_object
(object_id('[dbo].[SP_test]'),0)

--End of example-3

--Example-4

--Use database AdventureWorks2012
Use AdventureWorks2012
GO
Select * from
sys.dm_exec_describe_first_result_set_for_object
(object_id('[HumanResources].[vEmployee]'),1)

--End of example-4
