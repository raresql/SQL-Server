--Script Name: How to get First and Last day of the Year Using FORMAT function
--Script Type: Solution
--Article: https://raresql.com/2013/09/15/sql-server-2012-how-to-get-first-and-last-day-of-the-year-using-format-function/
--Developed By: Muhammad Imran
--Date Created: 15 Sep 2013
--Date Modified: 27 Dec 2022

--This script is compatible with SQL Server 2012 and above.

--Use DATEADD() function
--Use FORMAT() function
SELECT DATEADD(YEAR,-1,FORMAT(Getdate(),'yyyy')) As [Result]
	 , 'First Day of Previous Year' As [Type]
 UNION ALL
SELECT DATEADD(ms,-3,FORMAT(GETDATE(),'yyyy'))
	 , 'Last Day of Previous Year'
UNION ALL
SELECT FORMAT(GETDATE(),'yyyy')
	 , 'First Day of Current Year'
UNION ALL
SELECT DATEADD(ms,-3,FORMAT(DATEADD(YEAR,1,GETDATE()),'yyyy'))
	 , 'Last Day of Current Year'
UNION ALL
SELECT DATEADD(YEAR,1,FORMAT(Getdate(),'yyyy'))
	 , 'First Day of Previous Year'
UNION ALL
SELECT DATEADD(ms,-3,FORMAT(DATEADD(YEAR,2,GETDATE()),'yyyy'))
	 , 'Last Day of Previous Year'

--End
