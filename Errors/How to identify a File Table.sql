--Script Name: How to identify a File Table
--Script Type: Error
--Article: https://raresql.com/2013/02/06/sql-server-2012-how-to-identify-a-file-table/
--Developed By: Muhammad Imran
--Date Created: 6 Feb 2013
--Date Modified: 10 Jan 2023

--Error generation

Select 'Alter Table ' + quotename(schema_name([schema_id])) +'.' + quotename([name])
+ ' ADD [GUID] uniqueidentifier default newid()' from sys.tables

--End of error generation

--Error resolution

Select 'Alter Table ' + quotename(schema_name([schema_id])) +'.' + quotename([name])
+ ' ADD [GUID] uniqueidentifier default newid()' from sys.tables

--End of error resolution
