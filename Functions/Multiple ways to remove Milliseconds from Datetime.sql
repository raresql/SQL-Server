--Script Name: Multiple ways to remove Milliseconds from Datetime
--Script Type: Solution
--Article: https://raresql.com/2013/05/30/sql-server-multiple-ways-to-remove-milliseconds-from-datetime-truncate-datetime-till-second/
--Developed By: Muhammad Imran
--Date Created: 30 May 2013
--Date Modified: 5 Jan 2023

--Method-1
--Use CONVERT() function

--Declare and set value to variable
DECLARE @datetime DATETIME
SET @datetime = GETDATE()

--Browse table
SELECT
@datetime AS [Datetime with millisconds]
,CONVERT(DATETIME,CONVERT(VARCHAR(20),@datetime,120))
AS [Datetime without millisconds]
GO

--End of method-1

--Method-2
--USe FORMAT() function
--Declare and set value to variable
DECLARE @datetime DATETIME
SET @datetime = GETDATE()

--Browse data 
SELECT
 @datetime AS [Datetime with millisconds]
,CAST(FORMAT(@datetime,'yyyy-MM-dd HH:mm:ss') AS datetime)
AS [Datetime without millisconds]
GO

--End of method-2


