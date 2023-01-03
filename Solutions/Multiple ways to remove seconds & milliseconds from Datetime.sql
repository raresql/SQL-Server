--Script Name: Multiple ways to remove seconds & milliseconds from Datetime (Truncate Datetime till minute)
--Script Type: Solution
--Article: https://raresql.com/2013/09/18/sql-server-multiple-ways-to-remove-seconds-milliseconds-from-datetime-truncate-datetime-till-minute/
--Developed By: Muhammad Imran
--Date Created: 18th September 2013
--Date Modified: 27th December 2022


--Method-1
--Use Convert() function

--Declare Variables & set variable values
DECLARE @datetime DATETIME
SET @datetime = GETDATE()

--Use Convert function to convert datetime value 
SELECT @datetime AS [Datetime with seconds and millisconds]
     , CONVERT(DATETIME,CONVERT(VARCHAR(13),@datetime,120)+ ':00') AS [Datetime without seconds & millisconds];
GO

--End of method-1

--Method-2
--Use Format() & Cast() function

--Declare & set variable values
DECLARE @datetime DATETIME
SET @datetime = GETDATE()
 
SELECT @datetime AS [Datetime with seconds and millisconds]
     , CAST(FORMAT(@datetime,'yyyy-MM-dd HH:0') AS datetime) AS [Datetime without seconds & millisconds];
GO

--End of method-2
