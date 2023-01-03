--Script Name: How to recover the dropped Indexes without Backup
--Script Type: Solution
--Article: https://raresql.com/2013/04/24/sql-server-how-to-recover-the-dropped-indexes-without-backup/
--Developed By: Muhammad Imran
--Date Created: 24 Apr 2013
--Date Modified: 28 Dec 2022

--Sample

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Create NONCLUSTERED INDEX
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderDetail_Sample]
ON [Purchasing].[PurchaseOrderDetail]
(
 [OrderQty],
 [ReceivedQty],
 [RejectedQty],
 [ProductID];
)
GO

--Drop index
DROP INDEX [IX_PurchaseOrderDetail_Sample]
ON [Purchasing].[PurchaseOrderDetail]

--End of sample

--Step-1

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Create function
CREATE FUNCTION [dbo].[UDF_Get_Index_Column_Name]
(@Object_id bigint,@Column_id bigint)
RETURNS varchar(Max)
AS
Begin
          Declare @Column_Name as varchar(Max)
      Select @Column_Name=[name] from sys.columns
          where object_id =@Object_id And column_id =@Column_id
      Return @Column_Name
End;
GO

--End of step-1

--Step-2

--Create procedure
CREATE PROCEDURE Recover_Dropped_Index_Proc
@Date_From DATETIME='1900/01/01',
@Date_To DATETIME ='9999/12/31'
AS
;With CTE AS (Select
Row_number() Over(Partition By A.[Transaction ID]
Order By [Transaction ID]) as [SNO]
,A.[Transaction ID]
,'CREATE ' +
(Case When Convert(int,Substring(A.[RowLog Contents 0],22,1)) =0
Then 'Heap'
When Convert(int,Substring(A.[RowLog Contents 0],22,1)) =1
Then 'Clustered'
When Convert(int,Substring(A.[RowLog Contents 0],22,1)) =2
Then 'Nonclustered'
When Convert(int,Substring(A.[RowLog Contents 0],22,1)) =3
Then 'XML'
When Convert(int,Substring(A.[RowLog Contents 0],22,1)) =4
Then 'Spatial'
When Convert(int,Substring(A.[RowLog Contents 0],22,1)) =6
Then 'Nonclustered columnstore'
end)
+ ' INDEX ' + Quotename(
Replace(Substring(
A.[RowLog Contents 0],47,LEN(A.[RowLog Contents 0])),0x00,0x))
+' ON ' + Sch.name +'.'
+ Object_Name(
Convert(varbinary,Reverse(Substring(A.[RowLog Contents 0],5,4))))
as [Command1]
 
, [dbo].[UDF_Get_Index_Column_Name] (
  Convert(bigint,
  Convert(varbinary,Reverse(Substring(A.[RowLog Contents 0],5,4))))
, Convert(bigint
, Convert(varbinary,Substring(A.[RowLog Contents 0],20,2))))
  as [Column Name]
 
, Convert(int,Substring(A.[RowLog Contents 0],22,1)) as [Type]
 
, SUM(1) OVER(Partition By A.[Transaction ID]) as [Total Rows]
 
From sys.fn_dblog(NULL, NULL) As A
Inner Join sys.tables As tbl
On Object_Name(Convert
(varbinary,Reverse(Substring(A.[RowLog Contents 0],5,4))))=tbl.name
Inner Join sys.schemas As Sch On tbl.schema_id =sch.schema_id
Where A.AllocUnitName In ('sys.sysiscols.clst','sys.sysidxstats.clst')
And Context In ('LCX_MARK_AS_GHOST', 'LCX_HEAP')
And Operation in ('LOP_DELETE_ROWS')
And A.[TRANSACTION ID] In (SELECT DISTINCT [TRANSACTION ID]
FROM  sys.fn_dblog(NULL, NULL)
Where Context IN ('LCX_NULL') And Operation In ('LOP_BEGIN_XACT')
And [Transaction Name] Like '%DROP INDEX%'
And  CONVERT(NVARCHAR(11),[Begin Time]) Between @Date_From And @Date_To)
)
Select (Case When [type]=0 And [SNo] =2 And [SNO]<>[Total rows]
Then '(' + [Column Name] +','
When [type]=0 And [SNo] =2 And [SNO]=[Total rows]
Then '(' + [Column Name] +')'
When [type]=0 And [SNo] >2 And [SNO]<>[Total rows]
Then  [Column Name] + ','
When [type]=0 And [SNo] >2 And [SNO]=[Total rows]
Then  [Column Name] + ')'
else Command1 end) AS [Text] from CTE;
GO

--End of step-2

--Step-3

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Execute procedure
EXEC [Recover_Dropped_Index_Proc] '2013/04/01','9999/12/31'

--End of step-3
