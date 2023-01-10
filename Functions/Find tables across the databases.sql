--Script Name: Find tables across the databases
--Script Type: Solution
--Article: https://raresql.com/2013/03/25/sql-server-find-tables-across-the-databases/
--Developed By: Muhammad Imran
--Date Created: 25 Mar 2013
--Date Modified: 5 Jan 2023

--Script

--Create procedure
Create Procedure Search_Table_Across_Databases_Proc

@TableName nvarchar(Max)
As
BEGIN
DECLARE @SQL nvarchar(MAX)     --Declare variable to store dynamic query result
DECLARE @DB_NAME nvarchar(200) --Declare variable to store Database name
 
SET @SQL=''
 
--Create table
CREATE TABLE #SearchResult
(
[DB_Name] nvarchar(max),
[Table Name] nvarchar(max),
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
--In this dynamic query, two select statements are built because
--one statement will check the unavailability and the
--second statement will check the availability of the
--tables in the database and insert the result in the #SearchResult table
 
SET @SQL= 'Insert into #SearchResult
SELECT ''' + @DB_NAME + ''' as [Database Name],'''',''Not Available''
from ' + @DB_NAME + '. sys.tables
Where [name] =''' + @TableName + ''' Having Count(*)=0
UNION ALL
SELECT ''' + @DB_NAME + ''' as [Database Name],[name],''Available''
from ' + @DB_NAME + '.sys.tables
Where [name] =''' + @TableName + ''' Group By [name]
Having Count(*)>0'
 
EXEC(@SQL)
 
FETCH NEXT FROM DB_Cursor INTO @DB_NAME
END
CLOSE DB_Cursor
DEALLOCATE DB_Cursor
--We can browse the table to view the results
Select * from #SearchResult Order by [DB_Name],[Table Name]
END
GO
--EXEC Search_Table_Across_Databases_Proc 'Table Name'
--Example
EXEC Search_Table_Across_Databases_Proc 'employee'

--End of script
