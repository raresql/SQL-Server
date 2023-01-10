--Script Name: How to RESTORE backup from the URL(Windows Azure Storage)
--Script Type: Solution
--Article: https://raresql.com/2014/12/28/sql-server-2014-how-to-restore-backup-from-url-windows-azure-storage-tsql/
--Developed By: Muhammad Imran
--Date Created: 28 Dec 2014
--Date Modified: 5 Jan 2023

--Create credential

--Use database master
USE master
GO
CREATE CREDENTIAL [My_Credential]
       WITH IDENTITY ='raresql'
     , SECRET = '/ByNUTZqJ6EcJR/VQcNmNj+zSu++iCfbcxlyWye6Ok9uY3L5nw3XkndmAnDjiKn'
GO

--Use database master
USE [master]

--Alter database
ALTER DATABASE [AdventureWorks2012] SET SINGLE_USER WITH ROLLBACK IMMEDIATE

--Restore database
RESTORE DATABASE [AdventureWorks2012] FROM  URL = N'https://raresql.blob.core.windows.net/sql-backup/AdventureWorks2012_25_Dec_2014.bak'
WITH  CREDENTIAL = N'My_Credential'
,  FILE = 1,  NOUNLOAD,  STATS = 5
ALTER DATABASE [AdventureWorks2012] SET MULTI_USER
GO

--End
