--Script Name: Get day of week in SQL 2005-2008-2012
--Script Type: Solution
--Article: https://raresql.com/2013/04/18/sql-server-get-day-of-week-in-sql-200520082012/
--Developed By: Muhammad Imran
--Date Created: 18 Apr 2013
--Date Modified: 10 Jan 2023

--Method-1

--Declare variable
Declare @Datetime as datetime

--Set value of variable
Set @Datetime =getdate()

--Browse variable
Select DATENAME(dw , @Datetime) as [Weekday Name]
--OR
Select DATENAME(weekday, @Datetime) as [Weekday Name]

--End of method-1

--Method-2

--Declare variable
Declare @Datetime as datetime

--Set value of variable
Set @Datetime =getdate()

--Browse variable
Select FORMAT(@Datetime,'dddd') as [Weekday Name]

--End of method-2
