--Script Name: How to get previous current and last year dates using datetrunc function
--Script Type: Solution
--Article: https://raresql.com/2022/12/05/sql-server-2022-tsql-how-to-get-previous-current-and-last-year-dates-using-datetrunc-function/
--Developed By: Muhammad Imran
--Date Created: 05 Dec 2022
--Date Modified: 1 Jan 2023

--First date of previous year
--Old approach

--Declare variable
DECLARE @Date DATE;
--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT @Date                               AS [Current Date]
     , CONVERT(DATE
     , DATEADD(YEAR
     , DATEDIFF(YEAR, 0, @Date) -1, 0)) AS [First Date Of Previous Year];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date Date;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC() 
SELECT @Date                      AS [Current Date]
     , DATEADD(YEAR, -1 
     , DATETRUNC(YEAR, @Date)) AS [First Date Of Previous Year]; 
GO

--End of new approach
--End of first date of previous year

--Last date of previous year
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT @Date                                AS [Current Date]
     , CONVERT(DATE
     , DATEADD(YEAR
     , DATEDIFF(YEAR, 0, @Date) +0, -1)) AS [Last Date Of Previous Year];
GO
--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC()
SELECT @Date                      AS [Current Date]
     , DATEADD(DAY, -1
     , DATETRUNC(YEAR, @Date)) AS [Last Date Of Previous Year];
GO
--End of new approach
--End of last date of previous year

--First date of current year
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                            AS [Current Date]
      , CONVERT(DATE
      , DATEADD(YEAR
      , DATEDIFF(YEAR, 0, @Date) +0, 0)) AS [First Date Of Current Year];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATETRUNC()
SELECT  @Date                  AS [Current Date]
      , DATETRUNC(YEAR, @Date) AS [First Date of Current Year];
GO

--End of new approach

--End of first date of current year

--Last date of current year
--Old approach


--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                             AS [Current Date]
      , CONVERT(DATE
      , DATEADD(YEAR
      , DATEDIFF(YEAR, 0, @Date) +1, -1)) AS [Last Date Of Current Year];
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
      , DATEADD(YEAR, 1
      , DATETRUNC(YEAR, @Date))) AS [Last Date Of Current Year];
GO

--End of new approach
--End of last date of current year

--First date of next year
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                            AS [Current Date]
      , CONVERT(DATE
      , DATEADD(YEAR
      , DATEDIFF(YEAR, 0, @Date) +1, 0)) AS [First Date Of Next Year];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC()
SELECT  @Date                    AS [Current Date]
      , DATEADD(YEAR, 1
      , DATETRUNC(YEAR, @Date))  AS [First Date Of Next Year];
GO

--End of new approach
--End of first date of next year

--Last date of next year
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                             AS [Current Date]
      , CONVERT(DATE
      , DATEADD(YEAR
      , DATEDIFF(YEAR, 0, @Date) +2, -1)) AS [Last Date Of Next Year];
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
      , DATEADD(YEAR, 2
      , DATETRUNC(YEAR, @Date))) AS [Last Date Of Next Year];
GO

--End of new approach
--End of last date of next year
