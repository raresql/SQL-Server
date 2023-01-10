--Script Name: Shorter way to convert Seconds to Days, Hours, Minutes, Seconds
--Script Type: Solution
--Article: https://raresql.com/2013/04/10/sql-server-shorter-way-to-convert-seconds-to-days-hours-minutes-seconds/
--Developed By: Muhammad Imran
--Date Created: 10 Apr 2013
--Date Modified: 5 Jan 2023

--Script

--Declare variables
Declare @Seconds as int
Declare @SubtractDate as datetime

--Set values of variables
Set @Seconds=9974501
Set @SubtractDate=DateAdd(s,@Seconds,getdate()) - Getdate()
 
Select Convert(varchar(10),DateDiff(day,'1900-01-01',@SubtractDate))
+ ' Day(s) ' +
Convert(varchar(10),DatePart(hh,@SubtractDate))
+ ' Hour(s) ' +
Convert(varchar(10),DatePart(mi,@SubtractDate))
+ ' Minute(s) ' +
Convert(varchar(10),DatePart(ss,@SubtractDate))
+ ' Second(s) ' AS [Result]

--End of script
