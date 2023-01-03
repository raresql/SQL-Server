--Script Name: How sequence works in SQL Server 2012
--Script Type: Solution
--Article: https://raresql.com/2012/04/29/how-sequence-works-in-sql-server-2012/
--Developed By: Muhammad Imran
--Date Created: 29th April 2012
--Date Modified: 28th Dec 2022


--Step-1

--Create sequence
CREATE SEQUENCE [dbo].[Ticket] 
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 1000
 CYCLE 
 CACHE;
GO

--End of Step-1

--Step-2

--Create table
CREATE table tbl_Renewal_Application(
[TicketNo] INT NOT NULL,
[App Date] datetime,
[Comments] varchar(max))
 
CREATE table tbl_New_Application(
[TicketNo] INT NOT NULL,
[App Date] datetime,
[Comments] varchar(max));
GO

--End of Step-2

--Step-3

--Insert records into table
INSERT tbl_Renewal_Application ([TicketNo], [App Date],[Comments])
VALUES
(NEXT VALUE FOR [Ticket], Getdate(),'Renewal-1')
GO
INSERT tbl_New_Application ([TicketNo], [App Date],[Comments])
VALUES
(NEXT VALUE FOR [Ticket] , Getdate(),'New App-1')
GO
INSERT tbl_Renewal_Application ([TicketNo], [App Date],[Comments])
VALUES
(NEXT VALUE FOR [Ticket] , Getdate(),'Renewal-2')
GO
INSERT tbl_New_Application ([TicketNo], [App Date],[Comments])
VALUES
(NEXT VALUE FOR [Ticket] , Getdate(),'New App-2')

--End of Step-3

--Step-4
--Browse data

Select * from tbl_Renewal_Application
Select * from tbl_New_Application;
GO

--End of step-4
