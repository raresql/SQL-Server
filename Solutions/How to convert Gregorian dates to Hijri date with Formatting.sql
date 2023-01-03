--Script Name: How to convert Gregorian dates to Hijri date with Formatting
--Script Type: Solution
--Article: https://raresql.com/2013/05/08/sql-server-how-to-convert-gregorian-dates-to-hijri-date-with-formatting/
--Developed By: Muhammad Imran
--Date Created: 8 May 2013
--Date Modified: 28 Dec 2022

--Method-1
--Use CONVERT() function

--Declare variable
DECLARE @DateTime AS DATETIME

--Set value of variable
SET @DateTime=GETDATE()
SELECT @DateTime AS [Gregorian Date]
     , CONVERT(VARCHAR(11),@DateTime,131) AS [Gregorian date to Hijri date];
GO

--End of method-1

--Method-2
--This script is compatible with SQL Server 2012 and above.
--Use FORMAT() function

--Declare variable
DECLARE @DateTime AS DATETIME;

--Set value of variable
SET @DateTime=GETDATE();
 
--Browse time
SELECT @DateTime AS [Gregorian Date]
     , FORMAT(@DateTime,'dd-MM-yyyy','ar')
AS [Gregorian date to Hijri date]
 
UNION ALL
 
SELECT @DateTime AS [Gregorian Date]
     , FORMAT(@DateTime,'dd/MM/yyyy','ar')
AS [Gregorian date to Hijri date]
 
UNION ALL
 
SELECT @DateTime AS [Gregorian Date]
     , FORMAT(@DateTime,'yyyy-MM-dd','ar')
AS [Gregorian date to Hijri date]
 
UNION ALL
 
SELECT @DateTime AS [Gregorian Date]
     , FORMAT(@DateTime,'dddd/MMMM/yyyy','ar')
AS [Gregorian date to Hijri date]
 
UNION ALL
 
SELECT @DateTime AS [Gregorian Date]
     , FORMAT(@DateTime,'dd-MM-yyyy','ar')
AS [Gregorian date to Hijri date];
GO

--End of method-2
