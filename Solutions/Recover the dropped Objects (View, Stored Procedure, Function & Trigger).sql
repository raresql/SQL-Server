--Script Name: Recover the dropped Objects (View, Stored Procedure, Function & Trigger)
--Script Type: Solution
--Article: https://raresql.com/2012/12/04/sql-server-recover-the-dropped-objects-view-stored-procedure-function-trigger/
--Developed By: Muhammad Imran
--Date Created: 4 Dec 2012
--Date Modified: 10 Jan 2023

--Step-1
--Sample

--Create table
CREATE TABLE [dbo].[Student](
      [Sno] [int] NOT NULL,
      [Student ID] nvarchar(6) Not NULL ,
      [Student name] [varchar](50) NOT NULL,
      [Date of Birth]  datetime not null,
      [Weight] [int] NULL)
 
GO

--Create view
Create View Vw_Student
as
Select * from [Student]
GO

--Create procedure
Create Procedure SP_Student
@StudentID nvarchar(6)
as
Select * from Student Where [Student ID] =@StudentID
GO

--Create function
Create FUNCTION [dbo].[Fn_Student](@StudentID nvarchar(6))
RETURNS int
AS
Begin
    Declare @Weight int
    Select  @Weight = [Weight]
        from Student Where [Student ID] =@StudentID
    Return  @Weight
End
GO

--Create Trigger
CREATE TRIGGER trg_Student
ON Student
FOR INSERT
AS RAISERROR (50009, 16, 10)
GO

--End of sample

--End of step-1


--Step-2

--Drop items
Drop View [dbo].[Vw_Student]
GO
Drop Procedure [dbo].SP_Student
GO
Drop Function [dbo].[Fn_Student]
GO
Drop Trigger [dbo].[trg_Student]
GO
--End of step-2

--Step-3

--Browse table
Select * from [Vw_Student]
GO

--Execute SP_Student
EXEC SP_Student 1
GO
Select dbo.[Fn_Student](1)

--End of step-3

--Step-4

Create PROCEDURE Recover_Dropped_Objects_Proc
@Database_Name NVARCHAR(MAX),
@Date_From DATETIME='1900/01/01',
@Date_To DATETIME ='9999/12/31'
AS
 
DECLARE @Compatibility_Level INT
SELECT @Compatibility_Level=dtb.compatibility_level
FROM
master.sys.databases AS dtb WHERE dtb.name=@Database_Name
 
IF ISNULL(@Compatibility_Level,0)<=80
BEGIN
    RAISERROR('The compatibility level should be equal to or greater SQL SERVER 2005 (90)',16,1)
    RETURN
END
 
Select Convert(varchar(Max),Substring([RowLog Contents 0],33,LEN([RowLog Contents 0]))) as [Script]
from fn_dblog(NULL,NULL)
Where [Operation]='LOP_DELETE_ROWS' And [Context]='LCX_MARK_AS_GHOST'
And [AllocUnitName]='sys.sysobjvalues.clst'
AND [TRANSACTION ID] IN (SELECT DISTINCT [TRANSACTION ID] FROM    sys.fn_dblog(NULL, NULL) 
WHERE Context IN ('LCX_NULL') AND Operation in ('LOP_BEGIN_XACT')  
And [Transaction Name]='DROPOBJ'
And  CONVERT(NVARCHAR(11),[Begin Time]) BETWEEN @Date_From AND @Date_To)
And Substring([RowLog Contents 0],33,LEN([RowLog Contents 0]))<>0
GO
 
--Execute the procedure like
--EXEC Recover_Dropped_Data_Proc 'Database Name'
 
----EXAMPLE #1 : FOR ALL Dropped Objects
EXEC Recover_Dropped_Objects_Proc 'test'
--GO
------EXAMPLE #2 : FOR ANY SPECIFIC DATE RANGE
EXEC Recover_Dropped_Objects_Proc 'test','2011/12/01','2013/01/30'

--End of step-4
