--Script Name: sys.dm_db_database_page_allocations – dynamic management function
--Script Type: Function
--Article: https://raresql.com/2013/01/24/sql-server-2012-sys-dm_db_database_page_allocations-dynamic-management-function/
--Developed By: Muhammad Imran
--Date Created: 24 Jan 2013
--Date Modified: 7 Jan 2023

--Syntax
sys.dm_db_database_page_allocations
(@DatabaseId , @TableId , @IndexId , @PartionID , @Mode)

--End of syntax

--Example-1

Select * from sys.dm_db_database_page_allocations(DB_ID(), object_id('Sales'),NULL,NULL,'DETAILED')

--End of example-1

--Example-2

Select * from sys.dm_db_database_page_allocations(DB_ID(), NULL ,NULL,NULL,'DETAILED')

--End of example-2

