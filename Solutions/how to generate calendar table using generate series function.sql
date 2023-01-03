--Script Name: how to generate calendar table using generate series function
--Script Type: Solution
--Article: https://raresql.com/2022/11/23/sql-server-2022-how-to-generate-calendar-table-using-generate_series-function/%22
--Developed By: Muhammad Imran
--Date Created: 23 Nov 2022
--Date Modified: 3 Jan 2023

--Example
--Sample

--Create table
CREATE TABLE tbl_Calendar
(
  [ID]             INT IDENTITY
, [Date]           DATE
, [Day]            INT
, [DayShortName]   VARCHAR(100)
, [DayName]        VARCHAR(100)
, [Week]           INT
, [MonthShortName] VARCHAR(100)
, [Month]          INT
, [MonthName]      VARCHAR(100)
, [Quarter]        INT
, [QuarterName]    VARCHAR(100)
, [Year]           INT
);
GO

--Declare variables
DECLARE @SetStartDate DATE, @Start INT, @Stop INT, @Step INT;

--Set values of variable
SET @SetStartDate = '2022-01-01' --Start date of the calender;
SET @Start   = 0;
SET @Stop    = 365 -- No of days(one year) ;
SET @Step    = 1;

--Insert record into table
INSERT INTO tbl_Calendar
( 
  [Date]
, [Day]
, [DayShortName]
, [DayName]
, [Week]
, [MonthShortName]
, [Month]
, [MonthName]
, [Quarter]
, [QuarterName] 
, [Year]
)

--End of sample

--Use DATEADD(), DATEPART(), FORMAT(), DATENAME(), CONCAT()
--Use GENERATE_SERIES()
SELECT DATEADD(DAY,value,@SetStartDate) AS [Date]
     , DATEPART(DAY,DATEADD(DAY,value,@SetStartDate)) AS [Day]
     , FORMAT(DATEADD(DAY,value, @SetStartDate) ,'ddd') AS [DayShortName]
     , DATENAME(WEEKDAY,DATEADD(WEEKDAY,value,@SetStartDate)) AS [DayName]
     , DATEPART(WEEK,DATEADD(DAY,value,@SetStartDate)) AS [Week]
     , FORMAT(DATEADD(DAY,value, @SetStartDate) ,'MMM') AS [MonthShortName]
     , MONTH(DATEADD(DAY,value,@SetStartDate)) AS [Month]
     , DATENAME(MONTH,DATEADD(DAY,value,@SetStartDate)) AS [MonthName]
     , DATEPART(QUARTER,DATEADD(DAY,value,(@SetStartDate))) AS [Quarter]
     , CONCAT('Quarter - ',DATEPART(QUARTER,DATEADD(DAY,value,(@SetStartDate)))) AS [QuarterName]
     , YEAR(DATEADD(DAY,value,@SetStartDate)) AS [Year]
FROM GENERATE_SERIES(@Start,@Stop,@Step) 
GO

--Browse the data
SELECT * FROM tbl_Calendar;
GO
 
--End of Example
