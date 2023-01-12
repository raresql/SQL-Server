--Script Name: Remove Duplicate Entry from Comma Delimited String
--Script Type: Solution
--Article: https://raresql.com/2013/01/07/sql-server-remove-duplicate-entry-from-comma-delimited-string/
--Developed By: Muhammad Imran
--Date Created: 6 Jan 2013
--Date Modified: 10 Jan 2023


--Old approach

--Declare variable
DECLARE @DATE DATETIME

--Set value of variable
SET @DATE='2012-12-10'

--Browse variable
SELECT DAY(DATEADD(ms,-2,DATEADD(MONTH, DATEDIFF(MONTH,0,@DATE)+1,0))) 
AS [Current Month]

--End of old approach

--New approach

--Declare variable
DECLARE @DATE DATETIME

--Set value of variable
SET @DATE='2012-12-10'

--Browse variable
Select Day(EOMONTH(@DATE)) AS [Current Month]

--End of new approach
