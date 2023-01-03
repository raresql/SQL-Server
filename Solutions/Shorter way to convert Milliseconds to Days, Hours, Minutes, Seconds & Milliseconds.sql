--Script Name: Shorter way to convert Milliseconds to Days, Hours, Minutes, Seconds & Milliseconds
--Script Type: Solution
--Article: https://raresql.com/2013/09/06/sql-server-shorter-way-to-convert-milliseconds-to-days-hours-minutes-seconds-milliseconds/
--Developed By: Muhammad Imran
--Date Created: 6 Sep 2013
--Date Modified: 27 Dec 2022

--This script will work on SQL Server 2005 and above.

--Declare variables
Declare @Milliseconds as bigint;
Declare @SubtractDate as datetime;
--Enter Number of Milliseconds here

--Set values of variables
Set @Milliseconds=91234567;
Set @SubtractDate=DateAdd(ms,@Milliseconds,getdate()) - Getdate();

--Use convert() function
Select Convert(varchar(10),DateDiff(day,'1900-01-01',@SubtractDate))
+ ' Day(s) ' +
Convert(varchar(10),DatePart(hh,@SubtractDate))
+ ' Hour(s) ' +
Convert(varchar(10),DatePart(mi,@SubtractDate))
+ ' Minute(s) ' +
Convert(varchar(10),DatePart(ss,@SubtractDate))
+ ' Second(s) ' +
Convert(varchar(10),DatePart(ms,@SubtractDate))
+ ' milliseconds(s) '
AS [Result]

--End
