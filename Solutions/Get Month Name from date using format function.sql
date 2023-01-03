--Script Name: Get Month Name from date using format function
--Script Type: Solution
--Article: https://raresql.com/2013/04/25/sql-server-get-month-name-from-date-using-format-function/
--Developed By: Muhammad Imran
--Date Created: 25 Apr 2013
--Date Modified: 28 Dec 2022

--Method-1

--Declare variable
Declare @Datetime as datetime

--Set value of variable
Set @Datetime =getdate()

--Browse data 
SELECT DATENAME(month, @Datetime) AS [Month Name]
--OR
SELECT DATENAME(mm, @Datetime) AS [Month Name]
--OR
SELECT DATENAME(m, @Datetime) AS [Month Name]

--End of method-1

--Method-2

--This script will work in SQL Server 2012 and above

--Declare variable
Declare @Datetime as datetime

--Set value of variable
Set @Datetime =getdate();
--Browse data 
Select FORMAT(@Datetime,'MMMM') AS [Month Name]

--End of method-2
