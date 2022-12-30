--Script Name: Generate Series
--Script Type: Fuction
--Article: https://raresql.com/2022/11/16/sql-server-2022-generate_series-function/
--Develop By: Muhammad Imran
--Date Created: 16 Nov 2022
--Date Modified: 22 Dec 2022

--Old approach

DECLARE @StartRange INT = 1;
DECLARE @EndRange   INT = 10; 
 
;WITH CTE AS (
     SELECT @StartRange AS Sno 
     UNION ALL
     SELECT Sno+1 FROM CTE WHERE Sno+1 <= @EndRange ) 
SELECT * FROM CTE; 
GO

--End of old approach

--New approach

--Example-1
--Generate series in ascending Order

DECLARE @Start INT = 1;
DECLARE @Stop  INT = 10;
DECLARE @Step  INT = 1;
 
SELECT value FROM
GENERATE_SERIES(@Start,@Stop,@Step);
GO

--Generate series without passing step parameter

DECLARE @Start INT = 1;
DECLARE @Stop  INT = 10;
SELECT value FROM
GENERATE_SERIES(@Start,@Stop);
GO

--Issue

DECLARE @Start INT = 1;
DECLARE @Stop  INT = 10;
DECLARE @Step  INT = -1;
 
SELECT value FROM
GENERATE_SERIES(@Start,@Stop,@Step);
GO

--End of example-1

--Example-2
--Generate series in descending order

DECLARE @Start INT = 10;
DECLARE @Stop  INT = 1;
DECLARE @Step  INT = -1;
SELECT value FROM
GENERATE_SERIES(@Start,@Stop,@Step);
GO

--Generate series without passing step parameter

DECLARE @Start INT = 10;
DECLARE @Stop  INT = 1;
 
SELECT value FROM
GENERATE_SERIES(@Start,@Stop);
GO

--Issue

DECLARE @Start INT = 10;
DECLARE @Stop  INT = 1;
DECLARE @Step  INT = 1;
 
SELECT value FROM
GENERATE_SERIES(@Start,@Stop,@Step);
GO

--End of example-2

--Example-3
--Generate negative number series

DECLARE @Start INT = -1;
DECLARE @Stop  INT = -10;
DECLARE @Step  INT = -1;
 
SELECT * FROM
GENERATE_SERIES(@Start,@Stop,@Step);
GO

--End of example-3

--Example-4
--Generate odd number series

DECLARE @Start INT = 1;
DECLARE @Stop  INT = 10;
DECLARE @Step  INT = 2;
 
SELECT value FROM
GENERATE_SERIES(@Start,@Stop,@Step);
GO

--End of example-4

--Example-5
--Generate even numbers series

DECLARE @Start INT = 0;
DECLARE @Stop  INT = 10;
DECLARE @Step  INT = 2;
 
SELECT value FROM
GENERATE_SERIES(@start,@stop,@step);
GO

--End of example-5
--End of new approach
