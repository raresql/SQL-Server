--Script Name: PERCENT_RANK()
--Script Type: Function
--Developed By: Muhammad Imran
--Date Created: 08 Jan 2013
--Date Modified: 22 Dec 2022

--Example-1

--Create table
Create table [Daily_Gold_Rate]
(
[S.No] int,
[Date] datetime,
[Carat] int,
[Gold Rate] numeric(18,2)
)

--Insert values
Insert into [Daily_Gold_Rate] values(1,'2013-01-03',18,155.00)
Insert into [Daily_Gold_Rate] values(4,'2013-01-04',18,153.00)
Insert into [Daily_Gold_Rate] values(7,'2013-01-05',18,152.00)
Insert into [Daily_Gold_Rate] values(10,'2013-01-06',18,154.50)
Insert into [Daily_Gold_Rate] values(13,'2013-01-07',18,154.50) 
GO

--Use PERCENT_RANK() 
Select
Row_Number() OVER (ORDER BY [Carat],[Gold Rate]) as [Row Number]
,[Date]
,[Carat]
,[Gold Rate]
,PERCENT_RANK () OVER (ORDER BY [Carat],[Gold Rate]) AS [PERCENT_RANK]
from [Daily_Gold_Rate]

--End of example-1

--Example-2
--Use BY clause

--Insert values
Insert into [Daily_Gold_Rate] values(2,'2013-01-03',22,190.50)
Insert into [Daily_Gold_Rate] values(3,'2013-01-03',24,202.23)
 
Insert into [Daily_Gold_Rate] values(5,'2013-01-04',22,191.00)
Insert into [Daily_Gold_Rate] values(6,'2013-01-04',24,202.25)
 
Insert into [Daily_Gold_Rate] values(8,'2013-01-05',22,190.00)
Insert into [Daily_Gold_Rate] values(9,'2013-01-05',24,203.25)
 
Insert into [Daily_Gold_Rate] values(11,'2013-01-06',22,189.50)
Insert into [Daily_Gold_Rate] values(12,'2013-01-06',24,201.50)
 
Insert into [Daily_Gold_Rate] values(14,'2013-01-07',22,189.00)
Insert into [Daily_Gold_Rate] values(15,'2013-01-07',24,201.00)

--Use PERCENT_RANK()
Select
Row_Number() OVER (Partition by [Carat] ORDER BY [Carat],[Gold Rate])
as [Row Number]
,[Date]
,[Carat]
,[Gold Rate]
,PERCENT_RANK () OVER (Partition by [Carat] ORDER BY [Carat],[Gold Rate])
AS [PERCENT_RANK]
from [Daily_Gold_Rate]

--End of example-2
