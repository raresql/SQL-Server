--Script Name: Find Weekdays Between Two Dates
--Script Type: Solution
--Article: https://raresql.com/2013/01/17/sql-server-find-weekdays-between-two-dates/
--Developed By: Muhammad Imran
--Date Created: 17 Jan 2013
--Date Modified: 10 Jan 2023

--Script

--Create function
CREATE FUNCTION dbo.GetWorkingDays
( @StartDate DATETIME,
  @EndDate DATETIME ,
  @Weekend VARCHAR(50)
 )
RETURNS INT
BEGIN
 
DECLARE @Xml AS XML  
DECLARE @WEEKDAYS_DAY AS INT
SET @Xml = cast(('<A>'+replace(@Weekend,',' ,'</A><A>')+'</A>') AS XML)  
 
;WITH N1 (n) AS (SELECT 1 UNION ALL SELECT 1),
N2 (n) AS (SELECT 1 FROM N1 AS X, N1 AS Y),
N3 (n) AS (SELECT 1 FROM N2 AS X, N2 AS Y),
N4 (n) AS (SELECT ROW_NUMBER() OVER(ORDER BY X.n)
FROM N3 AS X, N3 AS Y)
 
Select @WEEKDAYS_DAY=SUM(1) from n4
Where DateAdd(day,n-1,@startdate)<=@Enddate
And datename(dw,DateAdd(day,n-1,@startdate)) NOT In (
    SELECT A.value('.', 'varchar(max)') as [Column] FROM @Xml.nodes('A') AS FN(A)
)
 
RETURN @WEEKDAYS_DAY
END
GO
SELECT dbo.GetWorkingDays ('02/01/2013', '02/28/2013','Saturday,Sunday') 
as [Weekday Days]
 
GO

--Browse function
SELECT dbo.GetWorkingDays ('02/01/2013', '02/28/2013','Friday,Saturday') 
as [Weekday Days]
 
--End of script
