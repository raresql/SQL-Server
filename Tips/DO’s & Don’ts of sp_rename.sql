--Script Name: DO’s & Don’ts of sp_rename
--Script Type: Tips
--Article: https://raresql.com/2012/10/17/sql-server-dos-donts-of-sp_rename/
--Developed By: Muhammad Imran
--Date Created: 17 Oct 2012
--Date Modified: 7 Jan 2023

--Script

--Sample
--Create table
Create table tbl_Sample
([Sno] int,
 [Dept_Name] varchar(50)
)
Go

--Create view
Create View vw_Sample
As
Select * from tbl_Sample

--End of sample

Select A.[object_id],B.[object_id],A.[name],[Definition]
from sys.Objects  A
Inner Join sys.sql_modules B on A.[object_id]=B.[object_id]
And A.[Type]='V'

--Use database Test
USE Test
GO
--Syntax sp_rename 'Old View name', 'New view Name'
EXEC sp_rename 'dbo.vw_Sample', 'vw_Sample2';

Select A.[object_id],B.[object_id],A.[name],[Definition]
from sys.Objects  A
Inner Join sys.sql_modules B on A.[object_id]=B.[object_id]
And A.[Type]='V'

--End of script
