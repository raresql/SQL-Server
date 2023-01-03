--Script Name: How to get the list of all triggers using sp_MSforeachtable
--Script Type: Solution
--Article: https://raresql.com/2014/01/05/sql-server-how-to-get-the-list-of-all-triggers-using-sp_msforeachtable/
--Developed By: Muhammad Imran
--Date Created: 5th January 2014
--Date Modified: 27th December 2022


--Example-1
--Use sp_MSforeachtable & sp_helptrigger 

--This script is compatible with SQL Server 2005 and above.
--Use AdventureWorks database
USE AdventureWorks2012
GO

--Use sp_MSforeachtable() & sp_helptrigger() function
EXEC sp_MSforeachtable
 @command1 = 'sp_helptrigger ''?'''
,@whereand = 'And Object_id In (Select parent_id From sys.triggers)';
GO

--End of example-1

