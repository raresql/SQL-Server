--Script Name: How to run sp_spaceused for all tables in a database
--Script Type: Solution
--Article: https://raresql.com/2013/02/27/sql-server-how-to-run-sp_spaceused-for-all-tables-in-a-database/
--Developed By: Muhammad Imran
--Date Created: 27 Feb 2013
--Date Modified: 28 Dec 2022

--Method-1

EXECUTE sp_MSforeachtable 'EXECUTE sp_spaceused [?]';

--End of method-1

--Method-2

--Time on
Set statistics time on

--Create table
CREATE TABLE #TempTable
(  name nvarchar(128)
 , rows char(11)
 , reserved varchar(18)
 , data varchar(18)
 , index_size varchar(18)
 , unused varchar(18)
)

--Declare variables
declare @UserTableName nvarchar(40)
declare UserTableSize cursor for
select rtrim(name) from dbo.sysobjects
where OBJECTPROPERTY(id, N'IsUserTable') = 1 order by name
 
open UserTableSize
fetch next from UserTableSize into @UserTableName
while @@fetch_status = 0
begin
    Insert ##TempTable
    exec sp_spaceused @UserTableName
    fetch next from UserTableSize into @UserTableName
end
close UserTableSize
deallocate UserTableSize

--Browse table
Select *  from ##TempTable

Set statistics time off
GO

--End of method-2

--Method-3

Set statistics time on

--Declare variable
Declare @PageSize float
Select @PageSize=v.low/1024.0 from master.dbo.spt_values v where v.number=1 and v.type='E'

--Browse table
Select object_Name(i.object_id) as [name]
     , p.rows
     , Convert(varchar(50),@PageSize * SUM(total_pages)) + ' KB' as [reserved]
     , Convert(varchar(50),@PageSize * SUM(CASE WHEN a.type <> 1 THEN a.used_pages WHEN p.index_id < 2 THEN a.data_pages ELSE 0 END)) + ' KB' as [data]
     , Convert(varchar(50),@PageSize * SUM(a.used_pages - CASE WHEN a.type <> 1 THEN a.used_pages WHEN p.index_id < 2 THEN a.data_pages ELSE 0 END)) +  ' KB' as [index_size]
     , Convert(varchar(50),@PageSize * SUM(total_pages-used_pages)) +  ' KB' as [unused]
FROM sys.indexes as i
JOIN sys.partitions as p ON p.object_id = i.object_id and p.index_id = i.index_id
JOIN sys.allocation_units as a ON a.container_id = p.partition_id
JOIN sys.tables t ON i.object_id=t.object_id
Where i.type<=1 and a.type=1
and
t.type='U' and is_ms_shipped=0
Group By i.object_id,p.rows;
GO

Set statistics time off

--End of method-3

--database clean up
DROP TABLE #TempTable;
GO



