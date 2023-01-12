--Script Name: Convert a datetime to a short date format
--Script Type: Solution
--Article: https://raresql.com/2013/06/16/sql-server-convert-a-datetime-to-a-short-date-format/
--Developed By: Muhammad Imran
--Date Created: 16 Jun 2013
--Date Modified: 10 Jan 2023

--Method-1

--Use Convert() function

--Declare variable
DECLARE @datetime DATETIME

--Set value of variable
SET @datetime = GETDATE()
 
--Browse variable
SELECT @datetime AS [DATE TIME],
CONVERT(VARCHAR(11), @datetime, 100) AS [SHORT DATE TIME]
GO

--End of method-1

--Method-2
--Use Cast() function

--Declare variable
DECLARE @datetime DATETIME

--Set value of variable
SET @datetime = GETDATE()

--Browse variable
SELECT @datetime AS [DATE TIME],
CAST(@datetime AS VARCHAR(11)) AS [SHORT DATE TIME]
GO

--End of method-2

--Method-3
--Use Cast() function

--Declare variable
DECLARE @datetime DATETIME

--Set value of variable
SET @datetime = GETDATE()

--Browse variable
SELECT @datetime AS [DATE TIME],
FORMAT(@datetime, 'MMM dd yyyy') AS [SHORT DATE TIME]
GO

--End of method-3
