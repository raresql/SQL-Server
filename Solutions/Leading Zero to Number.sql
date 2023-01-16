--Script Name: Leading Zero to Number
--Script Type: Solution
--Article: https://raresql.com/2012/10/09/sql-server-200520082012-leading-zero-to-number/
--Developed By: Muhammad Imran
--Date Created: 9 Oct 2012
--Date Modified: 11 Jan 2023

--Sample

--Create table
Create Table tbl_Sample
(
 [SNo] int
,[Values] int
)

--Insert records into table  
Insert into tbl_Sample Values (1,1)
Insert into tbl_Sample Values (2,22)
Insert into tbl_Sample Values (3,333)
Insert into tbl_Sample Values (4,4444)
Insert into tbl_Sample Values (5,55555)
Insert into tbl_Sample Values (6,666666)
Insert into tbl_Sample Values (7,7777777)
Insert into tbl_Sample Values (8,88888888)
Insert into tbl_Sample Values (9,999999999)
GO

--Unformated view

--Browse table
Select * from tbl_Sample

--End of sample

--End of unformated view

--Formatted view

--Create function
CREATE FUNCTION [dbo].[FN_LPAD_LEADING_ZERO](@Lenght int,@String varchar(Max)) 
RETURNS Varchar(Max) 
AS
Begin
      Declare @LPAD_STRING as varchar(Max) 
      Select @LPAD_STRING =(Case When Len(@String)<=@Lenght THEN
      Stuff(SPACE(@Lenght -Len(@String))+@String,1, @Lenght -Len(@String),Replicate(0,@Lenght -Len(@String)))
      ELSE @String END)
      Return @LPAD_STRING 
End
GO

--Browse table
Select [SNO],dbo.[FN_LPAD_LEADING_ZERO] (10,[Values]) as [RPAD_Values] from tbl_Sample 

--Use FORMAT() function
Select [SNO],FORMAT ([Values], '000000000#') as [RPAD_Values] from tbl_Sample

--End of formatted view
