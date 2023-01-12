--Script Name: How to update the metadata of view
--Script Type: Solution
--Article: https://raresql.com/2014/02/25/sql-server-sp_refreshview-how-to-update-the-metadata-of-view/
--Developed By: Muhammad Imran
--Date Created: 25 Feb 2014
--Date Modified: 10 Jan 2023


--Step-1

--Use database tempdb
USE tempdb
GO
--DROP TABLE [dbo].[tbl_Student]
--GO

--Create table
CREATE TABLE [dbo].[tbl_Student](
      [Sno] [int] NOT NULL,
      [Student ID] nvarchar(6) NOT NULL ,
      [Student name] [varchar](50) NOT NULL
)

-Insert records into table
Insert into dbo.[tbl_Student] VALUES (1,'STD001','Bob')
Insert into dbo.[tbl_Student] VALUES (2,'STD002','Alexander')
GO

--Browse table
SELECT * FROM [tbl_Student]
GO
--End of step-1


--Step-2

--Use database tempdb
USE tempdb
GO
--DROP VIEW vw_Student
--GO

--Create view
CREATE VIEW vw_Student
AS

--Browse table
SELECT * FROM [tbl_Student]
GO

--Browse view
SELECT * FROM vw_Student
GO
--End of step-2


--Step-3

--Use database tempdb
USE tempdb
GO

--Alter table
ALTER TABLE [tbl_Student] ADD [Address] varchar(100)
GO

--Browse table
SELECT * FROM [tbl_Student]
GO

--Browse view
SELECT * FROM vw_Student
GO
--End of step-3


--Step-4

--Use database tempdb
USE tempdb
GO
EXEC sp_refreshview N'dbo.vw_Student'
GO

--Browse table
SELECT * FROM [tbl_Student]
GO

--Browse view
SELECT * FROM vw_Student
GO
--End of step-4
