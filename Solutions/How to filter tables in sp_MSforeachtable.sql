--Script Name: How to filter tables in sp_MSforeachtable
--Script Type: Solution
--Article: https://raresql.com/2013/12/07/sql-server-how-to-filter-tables-in-sp_msforeachtable/
--Developed By: Muhammad Imran
--Date Created: 7th December 2013
--Date Modified: 27th December 2022


--Script
--Use the @whereand parameter to filter any table object in sp_MSforeachtable 

--Use temporary database
USE tempdb
GO

--Execute sp_help sp_msforeachtable
EXEC sp_help sp_msforeachtable
--OUTPUT

--Execute sp_MSforeachtable function
EXEC sp_msforeachtable
 @command1 ='SELECT * FROM ?'
,@whereand = ' And Object_id In (Select Object_id From sys.objects
Where name like ''%_temp%'')'

--End of Script

--Note: It is not recommended to use sp_MSforeachtable on production databases.
