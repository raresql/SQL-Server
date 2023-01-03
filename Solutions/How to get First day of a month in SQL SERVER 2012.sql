--Script Name: How to get First day of a month in SQL SERVER 2012 (FOMONTH)
--Script Type: Function
--Article: https://raresql.com/2012/09/10/how-to-get-first-day-of-a-month-in-sql-server-2012-fomonth/
--Developed By: Muhammad Imran
--Date Created: 10th September 2012
--Date Modified: 28th Dec 2022

--Old Approach

--SQL Server 2005/2008
DECLARE @DATE DATETIME
SET @DATE='2012-09-10'
 
--First date of the Previous Month
SELECT CONVERT(VARCHAR(10),DATEADD(MONTH, DATEDIFF(MONTH,0,@DATE)-1,0),120) AS [Previous Month]
 
--First date of the Current Month
SELECT CONVERT(VARCHAR(10),DATEADD(MONTH, DATEDIFF(MONTH,0,@DATE),0),120) AS [Current Month]
 
--First date of the Next Month
SELECT CONVERT(VARCHAR(10),DATEADD(MONTH, DATEDIFF(MONTH,0,@DATE)+1,0),120) AS [Next Month]

--End of Olld Approach

--New Approach

--Example-1
--Use EOMONTH 

Declare @Date as varchar(10) ='2012-09-10'
 
--First date of the Current Month
Select DateAdd(day,1,EOMONTH(Getdate(),-1)) as [Current Month]

--End of Example-1

--Example-2

CREATE Function [dbo].[FOMONTH]
(@start_date date, @month_to_add int=0)
Returns Date
AS
BEGIN
RETURN DATEADD(DAY,1,EOMONTH(@start_date,@month_to_add-1))
END
GO
--First day of the Previous Month
Select dbo.[FOMONTH] (Getdate(),-1)  AS [Previous Month]
 
--First day of the Current Month
Select dbo.[FOMONTH] ('2012-09-10',0) AS [Current Month]
 
--First day of the Next Month
Select dbo.[FOMONTH] (Getdate(),1)  AS [Next Month]
 
--First day of the Current Month WITH DEFAULT VALUE
Select dbo.[FOMONTH] (Getdate(),DEFAULT)  AS [Current Month]

--End of example-2

--End of New Approach
