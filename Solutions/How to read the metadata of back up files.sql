--Script Name: How to read the metadata of back up files
--Script Type: Solution
--Article: https://raresql.com/2014/02/18/sql-server-how-to-read-the-metadata-of-backup-files/
--Developed By: Muhammad Imran
--Date Created: 16 Feb 2014
--Date Modified: 26 Dec 2022

--Restore files

--Use database master
USE master
GO

--Use Restore()
RESTORE FILELISTONLY
FROM DISK = N'C:\data\Testing Backup.bak';
GO

--End of restore files
