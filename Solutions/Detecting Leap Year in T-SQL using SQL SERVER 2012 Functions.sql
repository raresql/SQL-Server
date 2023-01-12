--Script Name: Detecting Leap Year in T-SQL using SQL SERVER 2012 Functions
--Script Type: Solution
--Article: https://raresql.com/2013/01/23/sql-server-2012-detecting-leap-year-in-t-sql-using-sql-server-2012-functions/
--Developed By: Muhammad Imran
--Date Created: 23 Jan 2013
--Date Modified: 10 Jan 2023

--Method-1
--Use EOMONTH() function

--Declare variable
DECLARE @Year INT =2012
SELECT IIF(DAY(EOMONTH(DATEFROMPARTS(@Year,2,28)))=29 ,'YES','NO') AS [LEAP YEAR]

--End of method-1

--Method-2
--Use IIF() function

--Declare variable
DECLARE @Year INT =2012
SELECT IIF(DATEDIFF(DAY,DATEFROMPARTS(@Year,1,1), DATEFROMPARTS(@year,12,31))+1=366 ,'YES','NO') AS [LEAP YEAR]

--End of method-2


--Method-3
--Use IIF() function

--Declare variable
DECLARE @Year INT =2012
SELECT IIF(DAY(DATEADD(DAY,1,DATEFROMPARTS(@Year,2,28)))=29 ,'YES','NO') AS [LEAP YEAR]

--End of method-3
