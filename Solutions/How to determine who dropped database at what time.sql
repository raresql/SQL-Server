--Script Name: How to determine who dropped database at what time ?
--Script Type: Solution
--Article: https://raresql.com/2015/05/31/sql-server-how-to-determine-who-dropped-database-at-what-time/
--Developed By: Muhammad Imran
--Date Created: 31 May 2015
--Date Modified: 3 Jan 2023

--Script

--This script is compatible with SQL Server 2005 and above.

--Use database master
USE master
GO

--drop the procedure
DROP PROCEDURE Recover_Dropped_Database_Detail_Proc
GO

--Create procedure

--Use CTE(Common Table Expresion)
--Use LEN(), REPLACE()
CREATE PROCEDURE Recover_Dropped_Database_Detail_Proc
@Date_From DATETIME='1900/01/01',
@Date_To DATETIME ='9999/12/31'
AS
;WITH CTE AS (
Select REPLACE(SUBSTRING(A.[RowLog Contents 0],9
,LEN(A.[RowLog Contents 0])),0x00,0x) AS [Database Name]
,[Transaction ID]
FROM fn_dblog(NULL,NULL) A
WHERE A.[AllocUnitName] ='sys.sysdbreg.nc1'AND
A.[Transaction ID] IN (
SELECT DISTINCT [TRANSACTION ID] FROM  sys.fn_dblog(NULL, NULL)
WHERE Context IN ('LCX_NULL') AND Operation IN ('LOP_BEGIN_XACT')
AND [Transaction Name] LIKE '%dbdestroy%'
AND CONVERT(NVARCHAR(11),[Begin Time]) BETWEEN @Date_From AND @Date_To))
 
--Use INNER JOIN
SELECT
A.[Database Name]
,B.[Begin Time] AS [Dropped Date & Time]
,C.[name] AS [Dropped By User Name]
FROM CTE A
INNER JOIN fn_dblog(NULL,NULL) B
ON A.[Transaction ID] =B.[Transaction ID]
AND Context IN ('LCX_NULL') AND Operation IN ('LOP_BEGIN_XACT')
AND [Transaction Name] LIKE '%dbdestroy%'
INNER JOIN sys.sysusers C ON B.[Transaction SID]=C.[Sid]
 
GO

--Execute procedure
EXEC Recover_Dropped_Database_Detail_Proc
GO

--End of script
