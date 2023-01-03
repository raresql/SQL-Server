--Script Name: How to filter databases in sp_MSforeachdb
--Script Type: Solution
--Article: https://raresql.com/2014/02/11/sql-server-how-to-filter-databases-in-sp_msforeachdb/
--Developed By: Muhammad Imran
--Date Created: 11 Feb 2014
--Date Modified: 26 Dec 2022

--Execute sp_MSforeachdb
EXEC sp_MSforeachdb

--Use IF statement
@command1='IF ''?''
IN (''AdventureWorks2012'',''AdventureWorks2012_test'')
BEGIN
       SELECT name,object_id,modify_date
       FROM ?.sys.tables WHERE [name]=''Person''
END';
GO
