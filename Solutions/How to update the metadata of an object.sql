--Script Name: How to update the metadata of an object
--Script Type: Solution
--Article: https://raresql.com/2015/09/10/sql-server-sp_refreshsqlmodule-how-to-update-the-metadata-of-an-object/
--Developed By: Muhammad Imran
--Date Created: 10 Sep 2015
--Date Modified: 10 Jan 2023

--Sampe

--This script is compatible with SQL Server 2005 and above.

--Use database tempdb
USE tempdb
GO
--DROP TABLE [dbo].[tbl_Employee]
GO
--Create a table
CREATE TABLE [dbo].[tbl_Employee](
      [Employee ID] int ,
      [Employee name] [varchar](50) NOT NULL
)

--Insert records into table
Insert into dbo.[tbl_Employee] VALUES (1,'A1')
Insert into dbo.[tbl_Employee] VALUES (2,'B2')
GO
 
--DROP FUNCTION fn_Employee
--GO
--Create a table-valued function
CREATE FUNCTION fn_Employee( )
RETURNS TABLE
AS
RETURN
(SELECT * from tbl_Employee)
GO
 
--Get the data with the help of table-valued function
SELECT * FROM dbo.fn_Employee ()
GO

--End of sample

--Solution


--Step-1

--Use database tempdb
USE tempdb
GO

--Alter table
ALTER TABLE tbl_Employee ADD [Address] varchar(100)
GO

--Browse table
SELECT * FROM tbl_Employee
GO

--End of step-1


--Step-2

--Use database tempdb

--Browse table
Select * from dbo.fn_Employee ()
GO

--End of step-2


--Step-3

--Use database tempdb
USE tempdb
GO

--Executer function
EXEC sys.sp_refreshsqlmodule 'dbo.fn_Employee'
GO

--End of step-3


--Step-4

--Use database tempdb
USE tempdb
GO

--Browse table
Select * from dbo.fn_Employee ()
GO

--End of step-4

--End of solution
