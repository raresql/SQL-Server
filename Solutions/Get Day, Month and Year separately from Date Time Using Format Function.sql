--Script Name: Get Day, Month and Year separately from Date Time Using Format Function
--Script Type: Solution
--Article: https://raresql.com/2013/04/03/sql-server-2012-get-day-month-and-year-separately-from-date-time-using-format-function/
--Developed By: Muhammad Imran
--Date Created: 3 Apr 2013
--Date Modified: 10 Jan 2023

--Method-1

--Declare variable
DECLARE @Date_Time DATETIME

--Set value to variable
SET @Date_Time = '2013-12-31 10:49:59.460'
 
--Browse variable
SELECT DATEPART(DAY, @Date_Time) as [Day],
       DATEPART(MONTH, @Date_Time) as [Month],
       DATEPART(YEAR, @Date_Time) as [Year]
	   
--End of method-1

--Method-3

--Declare variable
DECLARE @Date_Time DATETIME

--Set value to variable
SET @Date_Time = '2013-12-31 10:49:59.460'
 
--Browse variable
SELECT DAY(@Date_Time) as [Day],
       MONTH(@Date_Time) as [Month],
       YEAR(@Date_Time) as [Year]

--End of method-2

--Method-3

--Declare variable
DECLARE @Date_Time DATETIME

--Set value to variable
SET @Date_Time = '2013-12-31 10:49:59.460'
 
--Browse variable
SELECT FORMAT(@Date_Time,'dd') as [Day],
       FORMAT(@Date_Time,'MM') as [Month],
       FORMAT(@Date_Time,'yyyy') as [Year]

--End of method-3
