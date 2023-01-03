--Script Name: How to remove first two characters from year
--Script Type: Solution
--Article: https://raresql.com/2013/06/07/sql-server-how-to-remove-first-two-characters-from-year/
--Developed By: Muhammad Imran
--Date Created: 7 June 2013
--Date Modified: 28 Dec 2022

--Method-1

--Declare variable
DECLARE @datetime DATETIME

--Set variable 
SET @datetime = GETDATE()

--Browse variable
SELECT RIGHT(YEAR(@datetime),2) AS [Two digit year]

--End of method-1

--Method-2

--Declare variable
DECLARE @datetime DATETIME

--Set variable
SET @datetime = GETDATE()

--Browse variable
SELECT FORMAT(@datetime,'yy') AS [Two digit year]

--End of method-2
