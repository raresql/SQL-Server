--Script Name: Find stored procedure across databases
--Script Type: Procedure
--Article: https://raresql.com/2012/10/03/sql-server-find-stored-procedure-across-databases/
--Developed By: Muhammad Imran
--Date Created: 3 Oct 2013
--Date Modified: 7 Jan 2023

--Create procedure 
Create Procedure Sp_Search_Procedure_Across_Databases
@ProcedureName nvarchar(Max)
As
BEGIN
DECLARE @SQL nvarchar(MAX)     --Declare variable to store dynamic query result
DECLARE @DB_NAME nvarchar(200) --Declare variable to store Database name
 
SET @SQL=''
 
--Create table to store the result of each database

CREATE TABLE #SearchResult
(
[DB_Name] nvarchar(max),
[Procedure Name] nvarchar(max),
[Status] varchar(50)
)
 
--Declare cusrsor to loop across all databases

DECLARE DB_Cursor CURSOR FOR
--Pick the list of all database
SELECT QUOTENAME([name]) from sys.databases order by [name]
 
OPEN DB_Cursor
FETCH NEXT FROM DB_Cursor INTO @DB_NAME
 
WHILE @@FETCH_STATUS = 0
BEGIN
 
SET @SQL= 'Insert into #SearchResult
SELECT ''' + @DB_NAME + ''' as [Database Name],'''',''Not Available''
from ' + @DB_NAME + '. sys.procedures
Where [name] like ''%' + @ProcedureName + '%'' Having Count(*)=0
UNION ALL
SELECT ''' + @DB_NAME + ''' as [Database Name],[name],''Available''
from ' + @DB_NAME + '.sys.procedures
Where [name] like ''%' + @ProcedureName + '%'' Group By [name]
Having Count(*)>0'
 
EXEC(@SQL)
 
FETCH NEXT FROM DB_Cursor INTO @DB_NAME
END
CLOSE DB_Cursor
DEALLOCATE DB_Cursor

--We can browse the table to view the results
Select * from #SearchResult Order by [DB_Name],[Procedure Name]
END
GO

 
--Example

Sp_Search_Procedure_Across_Databases 'SP_Employee'
