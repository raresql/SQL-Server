--Script Name: How to convert a dd-mm-yyyy string to datetime
--Script Type: Solution
--Article: https://raresql.com/2013/08/21/sql-server-2012-how-to-convert-a-ddmmyyyy-string-to-datetime/
--Developed By: Muhammad Imran
--Date Created: 21 Aug 2013
--Date Modified: 27 Dec 2022

--Error

--Declare variable
DECLARE @Varchar_Date varchar(11)

--Set value of variable
SET @Varchar_Date='31/12/2012'

--Browse data
--Use CONVERT() function
SELECT CONVERT(datetime,@Varchar_Date)

--End of error

--Solution

--This script is compatible with SQL Server 2012 and above.

--Declare variable
DECLARE @Varchar_Date as varchar(11)

--Set value of variable
SET @Varchar_Date='31/12/2013'

--Browse data
--Use TRY_PARSE() function
SELECT TRY_PARSE(@Varchar_Date AS DATETIME USING 'en-GB')
As [Result]

--End of solution
