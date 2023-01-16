--Script Name: Ability to return result sets from triggers
--Script Type: Trigger
--Article: https://raresql.com/2013/02/22/step-by-step-data-migration-from-excel-2007-and-above-to-sql-server/
--Developed By: Muhammad Imran
--Date Created: 8 Apr 2013
--Date Modified: 7 Jan 2023


--Step-1

--Use database tempdb
USE tempdb;
GO

--Create table
CREATE TABLE tbl_Employee(
EmployeeID int identity (1,1),
EmployeeName nvarchar(100) NULL
)
GO

--End of step-1

--Step-2

--Create trigger
CREATE TRIGGER trg_Insert ON tbl_Employee
FOR INSERT
AS
  SELECT INSERTED.EmployeeID, INSERTED.EmployeeName FROM inserted;
GO

--End of step-2

--Step-3

--Insert records into table
INSERT INTO tbl_Employee VALUES('Imran')
GO

--End of step-3

--Step-4

sp_configure 'disallow results from triggers',1
GO
RECONFIGURE

--End of step-4

--Step-5

--Insert records into table
INSERT INTO tbl_Employee VALUES('Bob')
GO

--End of step-5

--Step-6

--Alter trigger
ALTER TRIGGER trg_Insert ON tbl_Employee
FOR INSERT
AS
 
  Declare @EmployeeID int
  Declare @EmployeeName nvarchar(100)
 
  SELECT @EmployeeID=INSERTED.EmployeeID
  , @EmployeeName=INSERTED.EmployeeName FROM inserted;
 
  Print 'EmployeeID ' + Convert (varchar(10),@EmployeeID)
  Print 'Employee Name ' + @EmployeeName
GO

--End of step-6

--Step-7

--Insert records into table
INSERT INTO tbl_Employee VALUES('Sandra')
GO

--End of step-7
