--Script Name: Multiple ways to get Date and Time separately from DateTime
--Script Type: Solution
--Article: https://raresql.com/2013/03/19/sql-server-multiple-ways-to-get-date-and-time-separately-from-datetime/
--Developed By: Muhammad Imran
--Date Created: 19 Mar 2013
--Date Modified: 5 Jan 2023

--Method-1

--Declare variable
Declare @Datetime as datetime

--Set value of variable
Set @Datetime =getdate()

--Browse variables
Select @Datetime as [Datetime]
Select Convert(varchar(10),@Datetime,120) as [Date]
Select Convert(varchar(20),@Datetime,114) as [Time]

--End of method-1

--Method-2

--Declare variable
Declare @Datetime as datetime

--Set value of variable
Set @Datetime =getdate()

--Browse variables
Select @Datetime as [Datetime]
Select Convert(Date,@Datetime) as [Date]
Select Convert(Time,@Datetime) as [Time]
--End of method-2
