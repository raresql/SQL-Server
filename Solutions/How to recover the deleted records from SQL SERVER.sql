--Script Name: How to recover the deleted records from SQL SERVER
--Script Type: Solution
--Article: https://raresql.com/2012/10/10/how-to-recover-the-deleted-records-from-sql-server/
--Developed By: Muhammad Imran
--Date Created: 10 Oct 2012
--Date Modified: 10 Jan 2023

--Step-1

BACKUP DATABASE test
  TO DISK = 'c:\TEST_FULL_BACKUP.bak'
GO

--End of step-1

--Step-2

--Create table
Create Table Test_Table
(
 [ID] int,
 [Designation] varchar(50)
)

--Insert records into table
Insert into Test_Table ([ID],[Designation]) Values(1,'Officer')
Insert into Test_Table ([ID],[Designation]) Values(2,'Manager')
Insert into Test_Table ([ID],[Designation]) Values(3,'Director')

--End of step-2

--Step-3

--Delete records from table
Delete from Test_Table

--End of step-3

--Step-4

--Browse table
Select * from Test_Table

--End of step-4

--Step-5

BACKUP LOG TEST
   TO DISK = 'C:\TEST_TRANSACTION_LOG.bak'
   WITH NORECOVERY;
GO

--End of step-5

--Step-6

--Restore database
RESTORE DATABASE test
   FROM DISK = 'c:\TEST_FULL_BACKUP.bak'
   WITH NORECOVERY;
GO

--End of step-6

--Step-7

--Restore database
RESTORE LOG test
    FROM DISK = 'C:\TEST_TRANSACTION_LOG.bak'
    WITH RECOVERY, 
    STOPAT = 'Oct 09, 2012 09:59:00 AM'

--End of step-7

--Step-8

--Browse table
Select * from Test_Table

--End of step-8
