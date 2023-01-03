--Script Name:  How to search a string value in all columns in the table and in all tables in all databases in all databases – Part 2
--Script Type: Solution
--Article: https://raresql.com/2013/04/29/sql-server-how-to-search-a-string-value-in-all-columns-in-the-table-and-in-all-tables-in-all-databases-in-all-databases-part-2/
--Developed By: Muhammad Imran
--Date Created: 29 Apr 2013
--Date Modified: 28 Dec 2022

--Step-1
--Prerequisite of Step 1 & Step 2 from previous article.

--End of step-1

--Step-2
--Create procedure
CREATE PROCEDURE Find_Record_Across_Databases_Proc
@string VARCHAR(Max)
AS
 
DECLARE @sqlString varchar(Max)
DECLARE @Database_Name sysname
 
--Declare Cursor
DECLARE Database_Cursor CURSOR LOCAL FORWARD_ONLY STATIC READ_ONLY FOR
SELECT [name] FROM sys.databases
WHERE NAME NOT IN ('master','tempdb','model','msdb') ORDER BY NAME
 
OPEN Database_Cursor
 
FETCH NEXT FROM Database_Cursor INTO @Database_Name
WHILE @@FETCH_STATUS = 0
BEGIN
 
EXEC UDP_Find_Record_Across_Tables
@Database_Name, NULL, NULL ,@string
 
FETCH NEXT FROM Database_Cursor INTO @Database_Name
END
 
CLOSE Database_Cursor
DEALLOCATE Database_Cursor
 
--End procedure

--Browse table
SELECT * FROM tempdb.dbo.result
GO

--Example

--Execute procedure
EXEC Find_Record_Across_Databases_Proc 'senior'

--End of example
--End of step-2

