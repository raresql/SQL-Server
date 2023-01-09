--Script Name:  Breaking Changes – ALTER TABLE statements
--Script Type: DML
--Article: https://raresql.com/2013/03/07/sql-server-2012-alter-table-statements/
--Developed By: Muhammad Imran
--Date Created: 7 Mar 2013
--Date Modified: 7 Jan 2023

--Sample

--Use database test
USE [test]
GO

--Create table
CREATE TABLE [dbo].[t_Student](
    [Student ID] [int] IDENTITY(1,1) NOT NULL,
    [Student Name] [nvarchar](50) NULL
)

--End of sample

--SQL SERVER 2005 / 2008

--Method-1

Alter table .[test].dbo.[t_Student] Add [Contact Details] varchar(50) NULL

--End of Method-1

--Method-2

--Use database test
use test
GO
Alter table ..dbo.[t_Student] Add [Date of Birth] Datetime NULL

--End of Method-2

--Method-3

--Use database test
use test
GO
Alter table dbo.[t_Student] Add [Date of Admission] Datetime NULL

--End of Method-3

--End of SQL SERVER 2005 / 2008

--SQL SERVER 2012

--Method-1

Alter table .[test].dbo.[t_Student] Add [Contact Details] varchar(50) NULL

--End of method-1

--Method-2

--Use database test
use test
GO
Alter table ..dbo.[t_Student] Add [Date of Birth] Datetime NULL

--End of method-2

--Method-3

--Use database test
use test
GO
Alter table dbo.[t_Student] Add [Date of Admission] Datetime NULL

--End of method-3

--End of SQL SERVER 2012
