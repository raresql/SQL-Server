--Script Name: How to retrieve the metadata of a stored procedure
--Script Type: Error
--Article: https://raresql.com/2014/01/18/sql-server-how-to-retrieve-the-metadata-of-a-stored-procedure/
--Developed By: Muhammad Imran
--Date Created: 18 Jan 2014
--Date Modified: 5 Jan 2023

--Solution-1

--Use database AdventureWorks2012
USE AdventureWorks2012;
GO

--Browse data
SELECT * FROM sys.dm_exec_describe_first_result_set
(N'[dbo].[uspGetManagerEmployees] 16', null, 0) ;

--End of solution-1

--Solution-2

--Use database AdventureWorks2012
USE AdventureWorks2012
GO
--DROP TABLE #temp1
GO

--Browse data
SELECT * INTO  #temp1
FROM OPENROWSET('SQLNCLI', 'Server=(local);uid=sa;pwd=test',
'EXEC AdventureWorks2012.[dbo].[uspGetManagerEmployees] 16');
GO

--Browse data 
SELECT * FROM tempdb.sys.columns 
WHERE object_id=object_id('tempdb..#temp1')
GO

--End of solution-2
