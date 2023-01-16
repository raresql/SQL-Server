--Script Name: Convert varbinary to numeric & vice versa
--Script Type: Solution
--Article: https://raresql.com/2012/10/07/sql-server-convert-varbinary-to-numeric-vice-versa/
--Developed By: Muhammad Imran
--Date Created: 7 Oct 2012
--Date Modified: 11 Jan 2023

--Example

--Convert from varbinary to numeric

--Declare variable
Declare @varbinary2 as varbinary(max)

--Set value of variable
Set @varbinary2=0x08040001B471BC00

--Browse variable
Select Convert(numeric(8,4),@varbinary2) as [Varbinary to Numeric]
 
--Convert from numeric to varbinary

--Declare variable
Declare @Numeric2 as numeric(8,4)

--Set value of variable
Set @Numeric2 =1234.9876

--Browse variable
Select Convert(varbinary(max),@Numeric2) as [Numeric to Varbinary]

--End of example

--Explanation

--Convert from varbinary to numeric

--Declare variable
Declare @varbinary1 as varbinary(max)

--Set value of variable
Set @varbinary1=0x08040001B471BC00

--Browse data
 
--Use Convert() function
Select Convert(int,0x08) as [Precision]
Select Convert(int,0x04) as [Scale]

Select @varbinary1 as [Varbinary]
,Convert(numeric(18,4),@varbinary1) as [Varbinary to Numeric]

--End of explanation
