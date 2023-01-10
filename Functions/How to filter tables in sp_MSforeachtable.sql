--Script Name: How to filter tables in sp_MSforeachtable
--Script Type: Solution
--Article: https://raresql.com/2013/12/07/sql-server-how-to-filter-tables-in-sp_msforeachtable/
--Developed By: Muhammad Imran
--Date Created: 7 Dec 2013
--Date Modified: 5 Jan 2023

--Execute procedure
EXEC sp_help sp_msforeachtable

--Solution

--Use database tempdb
USE tempdb
 GO
 EXEC sp_msforeachtable
 @command1 ='SELECT * FROM ?'
,@whereand = ' And Object_id In (Select Object_id From sys.objects
Where name like ''%_temp%'')'

--End of solution
