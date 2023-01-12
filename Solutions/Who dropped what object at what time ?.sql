--Script Name: Who dropped what object at what time ?
--Script Type: Solution
--Article: https://raresql.com/2014/02/26/sql-server-who-dropped-what-object-at-what-time/
--Developed By: Muhammad Imran
--Date Created: 26 Feb 2014
--Date Modified: 10 Jan 2023

--Solution

--This script is compatible with SQL Server 2005 and above.

--Use database tempdb
USE tempdb
GO
--Create Schema
CREATE SCHEMA HumanResources
GO
 
--Create Table
CREATE TABLE HumanResources.[tbl_Employee](
      [Sno] [int] NOT NULL,
      [ID] nvarchar(6) Not NULL ,
      [name] [varchar](50) NOT NULL,
      [Date of Birth]  datetime not null,
      [Weight] [int] NULL)
 
GO
 
--Create View
Create View HumanResources.[vw_Employee]
as
Select * from HumanResources.[tbl_Employee]
GO
 
--Create Procedure
Create Procedure HumanResources.[usp_Employee]
@EmployeeID nvarchar(6)
as
Select * from HumanResources.[tbl_Employee] Where [ID] =@EmployeeID
GO
 
--Create function
Create FUNCTION HumanResources.[fn_Employee](@EmployeeID nvarchar(6))
RETURNS int
AS
Begin
    Declare @Weight int
    Select  @Weight = [Weight]
        from HumanResources.[tbl_Employee] Where ID =@EmployeeID
    Return  @Weight
End
GO
 
--Create Trigger
CREATE TRIGGER HumanResources.trg_Employee
ON [tbl_Employee]
FOR INSERT
AS RAISERROR (50009, 16, 10)
GO
 
--Drop all objects
DROP TRIGGER HumanResources.trg_Employee
DROP VIEW HumanResources.[vw_Employee]
DROP PROCEDURE HumanResources.[usp_Employee]
DROP FUNCTION HumanResources.[Fn_Employee]
DROP TABLE HumanResources.[tbl_Employee]
GO

--This script is compatible with SQL Server 2005 and above.

--Use database tempdb
USE tempdb
GO
--DROP PROCEDURE Recover_Dropped_Objects_Detail_Proc
--GO

--Create procedure
CREATE PROCEDURE Recover_Dropped_Objects_Detail_Proc
@Date_From DATETIME='1900/01/01',
@Date_To DATETIME ='9999/12/31'
AS
 
;WITH CTE AS (Select B.name AS [Schema Name]
,REPLACE(SUBSTRING(A.[RowLog Contents 0],14,LEN(A.[RowLog Contents 0])),0x00,0x) AS [Object Name]
,[Transaction ID]
,A.[RowLog Contents 0]
FROM fn_dblog(NULL,NULL) A
LEFT JOIN sys.schemas B
ON CONVERT(INT,SUBSTRING([RowLog Contents 0],2,2))= B.schema_id
WHERE A.[AllocUnitName] ='sys.sysschobjs.nc1'AND
A.[Transaction ID] IN (
SELECT DISTINCT [TRANSACTION ID] FROM  sys.fn_dblog(NULL, NULL)
WHERE Context IN ('LCX_NULL') AND Operation IN ('LOP_BEGIN_XACT')
AND [Transaction Name] LIKE '%DROP%'
AND CONVERT(NVARCHAR(11),[Begin Time]) BETWEEN @Date_From AND @Date_To))

--Browse data
SELECT
[Schema Name]
,[Object Name]
,B.[Begin Time]  AS [Dropped Date & Time]
,C.[name] AS [Dropped By User Name]
FROM CTE A
INNER JOIN fn_dblog(NULL,NULL) B
ON A.[Transaction ID] =B.[Transaction ID]
AND Context IN ('LCX_NULL') AND Operation IN ('LOP_BEGIN_XACT')
AND [Transaction Name]LIKE '%DROP%'
INNER JOIN sys.sysusers  C ON B.[Transaction SID]=C.[Sid]
GO

--Example

--Use database tempdb
USE tempdb
GO
EXEC Recover_Dropped_Objects_Detail_Proc  '2014/02/26','2014/02/26'
GO

--End of example

--End of solution
