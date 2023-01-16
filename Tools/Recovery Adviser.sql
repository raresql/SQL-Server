--Script Name: Recovery Adviser
--Script Type: Tools
--Article: https://raresql.com/2013/04/16/sql-server-2012-forceseek-table-hint-enhancement/
--Developed By: Muhammad Imran
--Date Created: 24 Mar 2013
--Date Modified: 7 Jan 2023

--Step-1

--Use database test_db
use test_db
Go

--Create test
Create table test
(
[ID] int,
[Name] nvarchar(50)
)
Go

--Insert record into table
Insert into test Values(1,'Imran')

--End of step-1

--Step-2

BACKUP DATABASE [Test_DB] TO DISK = N'G:\DBBackup\test_DB_Full'
WITH NOFORMAT, NOINIT, NAME = N'Test_DB-Full Database Backup'
, SKIP, NOREWIND, NOUNLOAD, STATS = 10
GO

--End of step-2


--Step-3

--Use database test_db
use Test_DB
GO

--Insert records into table
insert into test values(2,'Bob')

BACKUP DATABASE [Test_DB] TO DISK = N'G:\DBBackup\test_DB_Differential'
WITH DIFFERENTIAL , NOFORMAT, NOINIT,
NAME = N'Test_DB-Differential Database Backup'
, SKIP, NOREWIND, NOUNLOAD, STATS = 10

--End of step-3


--Step-4

--Use database test_db
use Test_DB
GO

--Insert records into table
insert into test values(2,'Bob')

BACKUP LOG [Test_DB] TO DISK = N'G:\DBBackup\test_DB_Log'
WITH NOFORMAT, NOINIT, NAME = N'Test_DB-Transaction Log Backup'
, SKIP, NOREWIND, NOUNLOAD, STATS = 10

--End of step-4


--Step-5

--No query

--End of step-5

--Step-6

--No query

--End of step-6
