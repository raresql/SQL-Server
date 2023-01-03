--Script Name: Shorter way to convert Minutes to Days, Hours, Minutes
--Script Type: Solution
--Article: https://raresql.com/2013/05/21/sql-server-shorter-way-to-convert-minutes-to-days-hours-minutes/
--Developed By: Muhammad Imran
--Date Created: 21 May 2013
--Date Modified: 28 Dec 2022

--Example

--This script will work on SQL Server 2005 and above.

--Declare variables
DECLARE @Minutes AS INT
DECLARE @SubtractDate AS DATETIME

--Enter Minutes here

--Set values of variables
SET @Minutes=2990
SET @SubtractDate=DATEADD(mi,@Minutes,GETDATE()) - GETDATE()
 
--Use CONVERT() function
SELECT CONVERT(VARCHAR(10),DATEDIFF(DAY,'1900-01-01',@SubtractDate))
+ ' Day(s) ' +
CONVERT(VARCHAR(10),DATEPART(hh,@SubtractDate))
+ ' Hour(s) ' +
CONVERT(VARCHAR(10),DATEPART(mi,@SubtractDate))
+ ' Minute(s) ' AS [Result];
Go

--End of example
