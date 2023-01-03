--Script Name: How to trim all columns in a table
--Script Type: Solution
--Article: https://raresql.com/2013/11/28/sql-server-how-to-trim-all-columns-in-a-table/
--Developed By: Muhammad Imran
--Date Created: 28th November 2013
--Date Modified: 27th December 2022


--Solution

--Use database AdventureWorks
USE AdventureWorks2012
GO

--Create Procedure
CREATE PROCEDURE usp_trim_all_string_columns
@schema_Table_name VARCHAR(MAX)
AS
DECLARE @SQL AS VARCHAR(MAX) --Declare Variables
 
SET @SQL=STUFF((SELECT ', ' + QUOTENAME([name])  --Set Variable values
+ ' = LTRIM(RTRIM(' + QUOTENAME([name]) + '))' FROM
sys.columns WHERE object_id=object_id(@schema_Table_name)
AND system_type_id IN(35,99,167,175,231,29)
FOR XML PATH('')),1,1,'')
PRINT @SQL
 
SET @SQL = 'UPDATE ' + @schema_Table_name + ' SET' + @SQL
PRINT @SQL

EXEC(@SQL)
GO

--End of Solution

--Example

--Use database AdventureWorks
USE AdventureWorks2012
GO

--Execute Procedure
EXEC usp_trim_all_string_columns '[HumanResources].[Employee]'
GO

--End of Example
