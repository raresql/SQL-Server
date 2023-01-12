--Script Name: Using Decode in SQL Server
--Script Type: Solution
--Article: https://raresql.com/2012/10/23/sql-server-using-decode-in-sql-server/
--Developed By: Muhammad Imran
--Date Created: 23 Oct 2012
--Date Modified: 10 Jan 2023

--Decode code in SQL Server

Declare @PoleDirection as varchar(10)
Set @PoleDirection= 'North'
 
SELECT CASE WHEN @PoleDirection = 'North' THEN 'N'
WHEN @PoleDirection = 'South' THEN 'S'
WHEN @PoleDirection = 'East' THEN 'E'
WHEN @PoleDirection = 'WEST' THEN 'W'
ELSE 'Not Applicable' END AS [Poles]

--Decode function in SQL server

--Create function
Create FUNCTION [dbo].[DECODE] (
    @Expression nvarchar(max),
    @String nvarchar(Max))
RETURNS nvarchar(Max)
AS
Begin
Declare @Delimiter as varchar(1)
Declare @ReturnValue as nvarchar(max)
Set @Delimiter=','
Declare @Xml AS XML 
  
Declare @Table TABLE(
    [ID] int Identity(1,1),
    Splitcolumn VARCHAR(MAX)
)   
SET @Xml = cast(('<A>'+replace(@String,@Delimiter,'</A><A>')+'</A>') AS XML)    
INSERT INTO @Table SELECT A.value('.', 'varchar(max)') as [Column] FROM @Xml.nodes('A') AS FN(A)   
 
IF (Select Count (*) from @Table A Where @Expression=A.[SplitColumn])=1
Begin
    Select top 1 @ReturnValue=B.[Splitcolumn] from @Table A
    Left Join @Table B On A.[ID]<B.[ID]
    Where @Expression=A.[SplitColumn]
    Order By A.[ID]
END
Else
BEGIN
    Select top 1 @ReturnValue=A.[Splitcolumn]  from @Table A
    Order By A.[ID] DESC
END
RETURN @ReturnValue
End
GO

--Example-1

--Create table
Create table tbl_Sample1
(
 [ID] varchar(6),
 [Employee Name] varchar(50),
 [Performance Evaluation] varchar(10)
)
GO

--Insert records into table
Insert into tbl_Sample1 values ('STD001','Bob','Excellent')  
Insert into tbl_Sample1 values ('STD002','Alexander','Good')  
Insert into tbl_Sample1  values ('STD003','Hosanna','Fair')  
GO

--Browse table
SELECT [ID],[Employee Name],[Performance Evaluation]
,dbo.Decode( [Performance Evaluation],'Excellent,100,Good,80,Fair,60,Unknown') 
as [Performace Index]
from tbl_Sample1
GO

--End of example-1

--Example-2

--Create table
Create table tbl_Sample2
(
 [ID] int ,
 [Country] varchar(50),
 [Short Name] varchar(3)
)
GO
 
--Insert records into table
Insert into tbl_Sample2 Values (1,'PAKISTAN','PAK')
Insert into tbl_Sample2 Values (2,'UNITED STATES OF AMERICA','USA')
Insert into tbl_Sample2 Values (3,'UNITED KINGDOM','UK')
Insert into tbl_Sample2 Values (4,'UNITED ARAB EMIRATES','UAE')
go
 
--Browse table
SELECT [ID],[Country],[Short Name]
,dbo.Decode([Short Name],'PAK,RS,USA,USD,UK,GBP,UAE,AED,Not Matched') 
as [Currency]
from tbl_Sample2

GO
--End of example-2
