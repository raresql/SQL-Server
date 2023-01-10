--Script Name: Multiple ways to calculate the number of days in a Year
--Script Type: Solution
--Article: https://raresql.com/2013/03/27/sql-server-multiple-ways-to-calculate-the-number-of-days-in-a-year/
--Developed By: Muhammad Imran
--Date Created: 27 Mar 2013
--Date Modified: 5 Jan 2023

--Method-1

--Declare variable
DECLARE @year AS INT

--Set value of variable
SET @year=2012

--Browse data
Select DATEDIFF(DAY,DATEADD(YEAR,@year-1900,0)
,DATEADD(YEAR,@year-1900+1,0)) AS [TOTAL NO OF DAYS]
GO
--This technique is same as above but using new datefromparts
--function introduced in SQL Server 2012.
--This technique will work in SQL Server 2012 and above.

--Declare variable
DECLARE @Year INT =2012
SELECT DATEDIFF(DAY,DATEFROMPARTS(@Year,1,1)
, DATEFROMPARTS(@year+1,1,1)) AS [TOTAL NO OF DAYS]
GO

--End of method-1

--Method-2

--Declare variable
DECLARE @year AS INT

--Set value of variable
SET @year=2012

--Browse data
Select DATEPART(dy,(DATEADD(YEAR,@year-1899,0)-1))
AS [TOTAL NO OF DAYS]

--Declare variable
DECLARE @year AS INT

--Set value of variable
SET @year=2012
Select DATEPART(dy,DATEFROMPARTS(@Year,12,31))
AS [TOTAL NO OF DAYS]

--End of method-2
