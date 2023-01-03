--Script Name: DATETRUNC()
--Script Type: Solution
--Article: https://raresql.com/2022/12/08/sql-server-2022-tsql-how-to-get-previous-current-and-last-week-dates-using-datetrunc-function/
--Developed By: Muhammad Imran
--Date Created: 08 Dec 2022
--Date Modified: 3 Jan 2023

--First date of previous week
--Old approach

--Declare variable
DECLARE @Date DATE;
--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                            AS [Current Date]
      , CONVERT(DATE
      , DATEADD(WEEK
      , DATEDIFF(WEEK, 0, @Date) -1, 0)) AS [First Date Of Previous Week];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date Date;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC() 
SELECT  @Date                     AS [Current Date]
      , DATEADD(WEEK, -1
      , DATETRUNC(WEEK, @Date))   AS [First Date Of Previous Week];
GO

--End of new approach
--End of first date of previous week

--Last date of previous week
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                             AS [Current Date]
      , CONVERT(DATE
      , DATEADD(WEEK
      , DATEDIFF(WEEK, 0, @Date) +0, -1)) AS [Last Date Of Previous Week];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC()
SELECT  @Date                     AS [Current Date]
      , DATEADD(DAY, -1
      , DATEADD(WEEK, 0
      , DATETRUNC(WEEK, @Date)))  AS [Last Date Of Previous Week];
GO

--End of new approach
--End of last date of previous week

--First date of current week
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                            AS [Current Date]
      , CONVERT(DATE
      , DATEADD(WEEK
      , DATEDIFF(WEEK, 0, @Date) +0, 0)) AS [First Date Of Current Week];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATETRUNC()
SELECT  @Date                  AS [Current Date]
      , DATETRUNC(WEEK, @Date) AS [First Date of Current Week];
GO

--End of new approach

--End of first date of current week

--Last date of current week
--Old approach


--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                             AS [Current Date]
      , CONVERT(DATE
      , DATEADD(WEEK
      , DATEDIFF(WEEK, 0, @Date) +1, -1)) AS [Last Date Of Current Week];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC()
SELECT  @Date                    AS [Current Date]
      , DATEADD(DAY, -1
      , DATEADD(WEEK, 1
      , DATETRUNC(WEEK, @Date))) AS [Last Date Of Current Week];
GO

--End of new approach
--End of last date of current week

--First date of next week
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                            AS [Current Date]
      , CONVERT(DATE
      , DATEADD(WEEK
      , DATEDIFF(WEEK, 0, @Date) +1, 0)) AS [First Date Of Next Week];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC()
SELECT  @Date                    AS [Current Date]
      , DATEADD(WEEK, 1
      , DATETRUNC(WEEK, @Date))  AS [First Date Of Next Week];
GO

--End of new approach
--End of first date of next week

--Last date of next week
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                             AS [Current Date]
      , CONVERT(DATE
      , DATEADD(WEEK
      , DATEDIFF(WEEK, 0, @Date) +2, -1)) AS [Last Date Of Next Week];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC()
SELECT  @Date                    AS [Current Date]
      , DATEADD(DAY, -1
      , DATEADD(WEEK, 2
      , DATETRUNC(WEEK, @Date))) AS [Last Date Of Next Week];
GO

--End of new approach
--End of last date of next week
