--Script Name: How to refresh all views related to modified tables
--Script Type: Solution
--Article: https://raresql.com/2014/06/15/sql-server-how-to-refresh-all-views-related-to-modified-tables/
--Developed By: Muhammad Imran
--Date Created: 15 Jun 2014
--Date Modified: 5 Jan 2023

--If one table has been modified

--Use database tempdb
USE tempdb
GO

--Browse data
SELECT DISTINCT 'EXEC sp_refreshview ''' + name + ''''  As [Text]
FROM sys.objects AS A
INNER JOIN sys.sql_expression_dependencies AS B
    ON A.object_id = B.referencing_id
WHERE A.type = 'V'
AND B.referenced_id = OBJECT_ID('tbl_A') --Change the table name
GO

--If multiple tables have been modified

--Use database tempdb
USE tempdb
GO

--Declare variable
DECLARE @Date AS DATETIME

--Set value of variable
SET @Date='2014-06-15'
--Change the table modification date
 
--Browse data
SELECT 'EXEC sp_refreshview ''' + name + ''''  As [Text]
 FROM sys.objects AS A
INNER JOIN sys.sql_expression_dependencies AS B
    ON A.object_id = B.referencing_id
WHERE A.type = 'V'
AND B.referenced_id IN (
    SELECT object_id FROM sys.tables
WHERE CONVERT(varchar(11),modify_date)=@Date)
GO
