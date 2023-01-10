--Script Name: How to take backup to URL (Windows Azure Storage)
--Script Type: Solution
--Article: https://raresql.com/2014/12/06/sql-server-2014-how-to-take-backup-to-url-windows-azure-storage-tsql/
--Developed By: Muhammad Imran
--Date Created: 6 Dec 2014
--Date Modified: 5 Jan 2023

--Use database master
USE master
GO

--Create credential
CREATE CREDENTIAL [My_Credential]
     WITH IDENTITY ='raresql'
    ,SECRET = '/ByNUTZqJ6EcJR/VQcNmNj+zSu++iCfbcxlyWye6Ok9uY3L5nw3XkndmAnDjiKn'
GO

--Backup

--Use database AdventureWorks2012
BACKUP DATABASE AdventureWorks2012
TO URL = 'https://raresql.blob.core.windows.net/sql-backup/AdventureWorks2012.bak'
      WITH CREDENTIAL = 'My_Credential'
     ,STATS = 5;
GO

--End
