--Script Name: Find Weekends between Two Dates
--Script Type: Solution
--Article: https://raresql.com/2013/07/12/sql-server-find-weekends-between-two-dates/
--Developed By: Muhammad Imran
--Date Created: 12 July 2013
--Date Modified: 28 Dec 2022

--Example

--Create function
CREATE FUNCTION dbo.GetWeekendDays
( @StartDate DATETIME,
  @EndDate DATETIME ,
  @Weekend VARCHAR(50)
 )
RETURNS INT
BEGIN

--Declare variables
DECLARE @Xml AS XML
DECLARE @WEEKEND_DAYS AS INT

--Set values of variable
SET @Xml =CAST(('<a>'+replace(@Weekend,',' ,'</a><a>')+'</a>') AS XML)
 
;WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
N2 (n) AS (SELECT 1 FROM N1 AS X, N1 AS Y),
N3 (n) AS (SELECT 1 FROM N2 AS X, N2 AS Y),
N4 (n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
FROM N3 AS X, N3 AS Y)
 
SELECT @WEEKEND_DAYS=SUM(1) FROM n4
WHERE DATEADD(day,n-1,@startdate)<=@Enddate
AND DATENAME(dw,DateAdd(day,n-1,@startdate)) In (
    SELECT A.value('.', 'varchar(max)') as [Column]
    FROM @Xml.nodes('A') AS FN(A)
)
 
RETURN @WEEKEND_DAYS
END
GO

--End of function

--Browse procedure
SELECT dbo.GetWeekendDays
('02/01/2013','02/28/2013','Saturday,Sunday')
as [Weekend Days]; 
GO

SELECT dbo.GetWeekendDays
('02/01/2013','02/28/2013','Friday,Saturday')
as [Weekend Days];
GO
 
--End of example
