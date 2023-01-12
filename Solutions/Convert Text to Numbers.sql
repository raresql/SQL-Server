--Script Name: Convert Text to Numbers
--Script Type: Solution
--Article: https://raresql.com/2012/10/14/sql-server-2012-convert-text-to-numbers/
--Developed By: Muhammad Imran
--Date Created: 14 Oct 2012
--Date Modified: 10 Jan 2023

--Example-1
--if text have numeric data only

--Declare variable
Declare @string as varchar(5)

--Set value of variable
Set @string ='12345'

--Use Convert(), Cast() function
Select Convert(int,@string) as [Convert Text to Integer]
Select Cast(@string as int) as [Cast Text to Integer] 

--End of example-1


--Example-2
--if text have string data

--Declare variable
Declare @string as varchar(5)

--Set value of variable
Set @string ='raresql'

--Use Convert(), Cast() function 
Select Convert(int,@string) as [Convert Text to Integer]
Select Cast(@string as int) as [Cast Text to Integer]

--End of example-2


--Example-3
--if text have numeric data

--Declare variable
Declare @string as varchar(5)

--Set value of variable
Set @string ='12345'

--Use Try_Convert(), Try_Cast() function 
Select Try_Convert(int,@string) as [Convert Text to Integer]
Select Try_Cast(@string as int) as [Cast Text to Integer]

--End of example-3

--Example-4
--if text have string data

--Declare variable
Declare @string as varchar(7)

--Set value of variable
Set @string ='raresql'

--Use Try_Convert(), Try_Cast() function  
Select Try_Convert(int,@string) as [Convert Text to Integer]
Select Try_Cast(@string as int) as [Cast Text to Integer]
--End of example-4
