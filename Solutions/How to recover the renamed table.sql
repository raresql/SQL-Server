--Script Name: How to recover the renamed table
--Script Type: Solution
--Article: https://raresql.com/2012/10/08/sql-server-how-to-recover-the-renamed-table/
--Developed By: Muhammad Imran
--Date Created: 8th October 2012
--Date Modified: 28th Dec 2022

--Note : It will only recover the table name if you rename it through SSMS.

--Create Sample table

CREATE Table Table_test
([SNO] int);
GO

--End of Sample table

--Create Procedure
CREATE PROCEDURE Recover_Rename_Table_Name_Proc
@Date_From DATETIME='1900/01/01',
@Date_To DATETIME ='9999/12/31'
AS
SELECT REPLACE(Substring(A.[RowLog Contents 0],14,LEN(A.[RowLog Contents 0])),0x00,0x) as [Table Name Before Rename]
,REPLACE(Substring(B.[RowLog Contents 0],14,LEN(B.[RowLog Contents 0])),0x00,0x) as [Table Name After Rename]
FROM sys.fn_dblog(NULL, NULL) A
Inner Join sys.fn_dblog(NULL, NULL) B On A.[Transaction ID]=B.[Transaction ID]
And A.AllocUnitId = B.AllocUnitId
WHERE
A.AllocUnitId IN (562949955649536)
AND A.Context IN ('LCX_MARK_AS_GHOST')
AND A.Operation IN ('LOP_DELETE_ROWS')
AND B.Context IN ('LCX_INDEX_LEAF')
AND B.Operation IN ('LOP_INSERT_ROWS')
/*Use this subquery to filter the date*/
AND A.[TRANSACTION ID] IN (SELECT DISTINCT [TRANSACTION ID] FROM    sys.fn_dblog(NULL, NULL)
WHERE Context IN ('LCX_NULL') AND Operation IN ('LOP_BEGIN_XACT')
AND [Transaction Name]='user_transaction'
AND  CONVERT(NVARCHAR(11),[Begin Time]) BETWEEN @Date_From AND @Date_To)
/**********************************************************************/
GO

--End of Procedure

--Example
--EXEC Recover_Rename_Table_Name_Proc 'yyyy/MM/dd','yyyy/MM/dd'
EXEC Recover_Rename_Table_Name_Proc '2012/10/08','2012/10/09'

--End of Example

