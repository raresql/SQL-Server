--Script Name: How to search a string value in all columns in the table and in all tables in a database–Part 1
--Script Type: Solution
--Article: https://raresql.com/2013/04/28/sql-server-how-to-search-a-string-value-in-all-columns-in-the-table-and-in-all-tables-in-a-database-part-1/
--Developed By: Muhammad Imran
--Date Created: 28 Apr 2013
--Date Modified: 28 Dec 2022

--Step-1

--Sample

--Use database tempdb
Use tempdb
GO

--Create table
Create Table Result
(
  [Sno] int identity(1,1)
, [Database Name] sysname
, [Schema Name] sysname
, [Table Name] sysname
, [Column Name] sysname
, [Record Name] varchar(Max)
)

--End of sample
--End of step-1

--Step-2
--Create the store procedure to search a string across the tables.

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Create procedure
Create PROCEDURE Find_Record_Across_Tables_Proc
@Database sysname,
@Schema sysname,
@Table sysname,
@String VARCHAR(Max)
 
AS

--Declare Variables 
DECLARE @SqlString varchar(Max)
DECLARE @Table_Schema sysname
DECLARE @Table_Name sysname
DECLARE @Column_Name sysname
 
--Declare Cursor
SET @SqlString = 'DECLARE String_cursor CURSOR FOR
Select TABLE_SCHEMA, TABLE_NAME ,COLUMN_NAME from
' + @Database +'.INFORMATION_SCHEMA.COLUMNS
Where DATA_TYPE IN (''text'',''ntext'',''varchar''
,''nvarchar'',''char'',''nchar'')'
 
--Filter schema name
IF @schema IS NOT NULL
Begin
SET @SqlString = @SqlString + ' And TABLE_SCHEMA=''' + @Schema + ''''
End

--End of procedure

--Filter table name
IF @table IS NOT NULL
Begin
SET @SqlString = @SqlString + ' And TABLE_NAME=''' + @table + ''''
End
 
Print @SqlString
EXEC (@SqlString)
 
OPEN String_cursor
 
FETCH NEXT FROM String_cursor
INTO @Table_Schema, @Table_Name, @Column_Name
 
WHILE @@FETCH_STATUS = 0
BEGIN
SET @SqlString = 'IF EXISTS(SELECT ' + QUOTENAME(@Column_Name)
+ ' FROM ' + @Database + '.' + QUOTENAME(@Table_Schema)
+ '.' + QUOTENAME(@Table_Name)
+ ' WHERE ' + QUOTENAME(@Column_Name)
+ ' Like ''%' + @string + '%'')
Insert into tempdb.dbo.result
([Database Name],[Schema Name]
,[Table Name],[Column Name],[Record Name])
SELECT ''' + QUOTENAME(@Database) + ''','''
+ QUOTENAME(@Table_Schema) + ''','''
+ QUOTENAME(@Table_Name) + ''',''''
+ ''' + QUOTENAME(@Column_Name)
+ ''',' + QUOTENAME(@Column_Name)
+ ' FROM ' + @Database + '.'
+ QUOTENAME(@Table_Schema)
+ '.' + QUOTENAME(@Table_Name)
+ ' WHERE ' + QUOTENAME(@Column_Name)
+ ' Like ''%' + @string + '%'''
Print @SqlString
EXEC (@SqlString)
 
FETCH NEXT FROM String_cursor
INTO @Table_Schema, @Table_Name, @Column_Name
 
END
CLOSE String_cursor
DEALLOCATE String_cursor
GO

--End of step-2

--Step-3
--Example-1

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Delete table
Delete from tempdb.dbo.result
GO

--Execute procedure
EXEC Find_Record_Across_Tables_Proc
'AdventureWorks2012', NULL, NULL ,'Senior'
GO

--Browse table
Select * from tempdb.dbo.result
GO

--End of example-1

--Example-2

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Delete table
Delete from tempdb.dbo.result
GO

--Execute procedure
EXEC Find_Record_Across_Tables_Proc
'AdventureWorks2012', NULL, 'Employee' ,'Senior'
GO

--Browse table
Select * from tempdb.dbo.result
GO

--End of example-2

--Example-3

--Use database AdventureWorks2012
Use AdventureWorks2012
GO

--Delete table
Delete from tempdb.dbo.result
GO

--Execute procedure
EXEC Find_Record_Across_Tables_Proc
'AdventureWorks2012', 'HumanResources', 'Employee' ,'Senior'
GO

--Browse table
Select * from tempdb.dbo.result
GO

--End of example-3

--End of step-3
