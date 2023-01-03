--Script Name: How to recover the accidentally renamed object name
--Script Type: Solution
--Article: https://raresql.com/2013/12/24/sql-server-how-to-recover-the-accidentally-renamed-object-name/
--Developed By: Muhammad Imran
--Date Created: 24th December 2013
--Date Modified: 27th December 2022

--Note:It will only recover the object name if you renamed it through SSMS.

--Script

--Create Procedure
CREATE PROCEDURE Recover_Renamed_Object_Name_Proc
@Date_From DATETIME='1900/01/01',
@Date_To DATETIME ='9999/12/31'
AS

--Browse data
SELECT type_desc As [Object Type]
,REPLACE(Substring(A.[RowLog Contents 0]
,14,LEN(A.[RowLog Contents 0])),0x00,0x) as [Object Name Before Rename]
,REPLACE(Substring(B.[RowLog Contents 0]
,14,LEN(B.[RowLog Contents 0])),0x00,0x) as [Object Name After Rename]
FROM sys.fn_dblog(NULL, NULL) A
INNER Join sys.fn_dblog(NULL, NULL) B 
On A.[Transaction ID]=B.[Transaction ID]
And A.AllocUnitId = B.AllocUnitId
Left Join sys.objects S On CONVERT(BIGINT,CONVERT(VARBINARY(MAX)
,REVERSE(Substring(A.[RowLog Contents 0],7,4))))=S.object_id
WHERE
A.AllocUnitId IN (562949955649536) AND A.Context IN ('LCX_MARK_AS_GHOST')
AND A.Operation IN ('LOP_DELETE_ROWS') AND B.Context IN ('LCX_INDEX_LEAF')
AND B.Operation IN ('LOP_INSERT_ROWS') 
/*Use this subquery to filter the date*/
AND A.[TRANSACTION ID] IN (SELECT DISTINCT [TRANSACTION ID] FROM
sys.fn_dblog(NULL, NULL)
WHERE Context IN ('LCX_NULL') AND Operation IN ('LOP_BEGIN_XACT')
AND [Transaction Name]='user_transaction'
AND CONVERT(NVARCHAR(11),[Begin Time]) 
BETWEEN @Date_From AND @Date_To)
GO

--Execute Above created Procedure (Recover_Renamed_Object_Name_Proc 'yyyy/MM/dd','yyyy/MM/dd')
EXEC Recover_Renamed_Object_Name_Proc '2013/10/31','2014/12/31'

--End of Script

