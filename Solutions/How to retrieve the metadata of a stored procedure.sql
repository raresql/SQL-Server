--Script Name: How to retrieve the metadata of a stored procedure
--Script Type: Solution
--Article: https://raresql.com/2014/01/18/sql-server-how-to-retrieve-the-metadata-of-a-stored-procedure/
--Developed By: Muhammad Imran
--Date Created: 18 Jan 2014
--Date Modified: 26 Dec 2022

--Solution-1

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Use sys.dm_exec_describe_first_result_set() function
SELECT * FROM sys.dm_exec_describe_first_result_set
(N'[dbo].[uspGetManagerEmployees] 16', null, 0) ;

--End of solution-1

--Solution-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Drop TABLE #temp1
DROP TABLE #temp1
GO

--Use OPENROWSET()
SELECT * INTO  #temp1
FROM OPENROWSET('SQLNCLI', 'Server=(local);uid=sa;pwd=test',
'EXEC AdventureWorks2012.[dbo].[uspGetManagerEmployees] 16');
GO

--Browse columns 
SELECT * FROM tempdb.sys.columns 
WHERE object_id=object_id('tempdb..#temp1');
GO
--View the column name / metadata of the above created temporary table.

--End of solution-2
