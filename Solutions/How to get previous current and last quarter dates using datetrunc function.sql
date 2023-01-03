--Script Name: How to get previous current and last quarter dates using datetrunc function
--Script Type: Solution
--Article: https://raresql.com/2022/12/06/sql-server-2022-tsql-how-to-get-previous-current-and-last-quarter-dates-using-datetrunc-function/
--Developed By: Muhammad Imran
--Date Created: 06 Dec 2022
--Date Modified: 1 Jan 2023

--First date of previous quarter
--Old approach

--Declare variable
DECLARE @Date DATE;
--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT @Date                               AS [Current Date]
     , CONVERT(DATE
     , DATEADD(QUARTER
     , DATEDIFF(QUARTER, 0, @Date) -1, 0)) AS [First Date Of Previous Quarter];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date Date;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC() 
SELECT @Date                      AS [Current Date]
     , DATEADD(QUARTER, -1 
     , DATETRUNC(QUARTER, @Date)) AS [First Date Of Previous Quarter]; 
GO

--End of new approach
--End of first date of previous quarter

--Last date of previous quarter
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT @Date                                AS [Current Date]
     , CONVERT(DATE
     , DATEADD(QUARTER
     , DATEDIFF(QUARTER, 0, @Date) +0, -1)) AS [Last Date Of Previous Quarter];
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
     , DATETRUNC(QUARTER, @Date)) AS [Last Date Of Previous Quarter];
GO
--End of new approach
--End of last date of previous quarter

--First date of current quarter
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                            AS [Current Date]
      , CONVERT(DATE
      , DATEADD(QUARTER
      , DATEDIFF(QUARTER, 0, @Date) +0, 0)) AS [First Date Of Current Quarter];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATETRUNC()
SELECT  @Date                  AS [Current Date]
      , DATETRUNC(QUARTER, @Date) AS [First Date of Current Quarter];
GO

--End of new approach

--End of first date of current quarter

--Last date of current quarter
--Old approach


--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                             AS [Current Date]
      , CONVERT(DATE
      , DATEADD(QUARTER
      , DATEDIFF(QUARTER, 0, @Date) +1, -1)) AS [Last Date Of Current Quarter];
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
      , DATEADD(QUARTER, 1
      , DATETRUNC(QUARTER, @Date))) AS [Last Date Of Current Quarter];
GO

--End of new approach
--End of last date of current quarter

--First date of next quarter
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                            AS [Current Date]
      , CONVERT(DATE
      , DATEADD(QUARTER
      , DATEDIFF(QUARTER, 0, @Date) +1, 0)) AS [First Date Of Next Quarter];
GO

--End of old approach

--New approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use DATEADD(), DATETRUNC()
SELECT  @Date                    AS [Current Date]
      , DATEADD(QUARTER, 1
      , DATETRUNC(QUARTER, @Date))  AS [First Date Of Next Quarter];
GO

--End of new approach
--End of first date of next quarter

--Last date of next quarter
--Old approach

--Declare variable
DECLARE @Date DATE;

--Set value of variable
SET @Date = GETDATE();

--Use CONVERT(), DATEADD(), DATEDIFF()
SELECT  @Date                             AS [Current Date]
      , CONVERT(DATE
      , DATEADD(QUARTER
      , DATEDIFF(QUARTER, 0, @Date) +2, -1)) AS [Last Date Of Next Quarter];
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
      , DATEADD(QUARTER, 2
      , DATETRUNC(QUARTER, @Date))) AS [Last Date Of Next Quarter];
GO

--End of new approach
--End of last date of next quarter
