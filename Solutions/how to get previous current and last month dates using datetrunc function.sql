-- Script Name: how to get previous current and last month dates using datetrunc function
-- Script Type: Solution
-- Article: https://raresql.com/2022/12/07/sql-server-2022-tsql-how-to-get-previous-current-and-last-month-dates-using-datetrunc-function/ 
-- Developed By: Muhammad Imran
-- Date Created: 07 Dec 2022
-- Date Modified: 24 Dec 2022

--First date of previous month
--Old approach

--Declare variable
DECLARE @Date DATE;
--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT @Date                               AS [Current Date]
     , CONVERT(DATE
     , DATEADD(MONTH
     , DATEDIFF(MONTH, 0, @Date) -1, 0)) AS [First Date Of Previous Month];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date Date;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC() 
SELECT @Date                      AS [Current Date]
     , DATEADD(MONTH, -1 
     , DATETRUNC(MONTH, @Date)) AS [First Date Of Previous Month]; 
GO

--End of new approach
--End of first date of previous month

--Last date of previous month
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT @Date                                AS [Current Date]
     , CONVERT(DATE
     , DATEADD(MONTH
     , DATEDIFF(MONTH, 0, @Date) +0, -1)) AS [Last Date Of Previous Month];
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
     , DATETRUNC(MONTH, @Date)) AS [Last Date Of Previous Month];
GO
--End of new approach
--End of last date of previous month

--First date of current month
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                            AS [Current Date]
      , CONVERT(DATE
      , DATEADD(MONTH
      , DATEDIFF(MONTH, 0, @Date) +0, 0)) AS [First Date Of Current Month];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATETRUNC()
SELECT  @Date                  AS [Current Date]
      , DATETRUNC(MONTH, @Date) AS [First Date of Current Month];
GO

--End of new approach

--End of first date of current month

--Last date of current month
--Old approach


--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                             AS [Current Date]
      , CONVERT(DATE
      , DATEADD(MONTH
      , DATEDIFF(MONTH, 0, @Date) +1, -1)) AS [Last Date Of Current Month];
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
      , DATEADD(MONTH, 1
      , DATETRUNC(MONTH, @Date))) AS [Last Date Of Current Month];
GO

--End of new approach
--End of last date of current month

--First date of next month
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                            AS [Current Date]
      , CONVERT(DATE
      , DATEADD(MONTH
      , DATEDIFF(MONTH, 0, @Date) +1, 0)) AS [First Date Of Next Month];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC()
SELECT  @Date                    AS [Current Date]
      , DATEADD(MONTH, 1
      , DATETRUNC(MONTH, @Date))  AS [First Date Of Next Month];
GO

--End of new approach
--End of first date of next month

--Last date of next month
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                             AS [Current Date]
      , CONVERT(DATE
      , DATEADD(MONTH
      , DATEDIFF(MONTH, 0, @Date) +2, -1)) AS [Last Date Of Next Month];
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
      , DATEADD(MONTH, 2
      , DATETRUNC(MONTH, @Date))) AS [Last Date Of Next Month];
GO

--End of new approach
--End of last date of next month
