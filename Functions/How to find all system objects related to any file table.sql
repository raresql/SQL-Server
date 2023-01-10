--Script Name: How to find all system objects related to any file table
--Script Type: Solution
--Article: https://raresql.com/2013/04/09/sql-server-2012-shortcut-how-to-find-all-system-objects-related-to-any-file-table/
--Developed By: Muhammad Imran
--Date Created: 9 Apr 2013
--Date Modified: 5 Jan 2023

--Method-1

--Declare variable
Declare @FileTableName as varchar(50)='dbo.Databank'

--Browse data
Select B.[name] as [File Table Name]
,A.[name] as [Related objects]
from sys.objects A
Inner Join sys.objects B
On A.[parent_object_id] =B.[object_id]
Where B.[type] ='U'
And B.object_id=object_id(@FileTableName)
GO

--End of method-1

--Method-2

--Declare variable
Declare @FileTableName as varchar(50)='dbo.Databank'

--Browse data
Select object_name(parent_object_id) as [File Table Name]
,object_name(object_id) as [Related objects]
from sys.filetable_system_defined_objects
Where parent_object_id =object_id(@FileTableName)
GO

--End of method-2
