--Script Name: How to change the Default SQL Server backup folder
--Script Type: Solution
--Article: https://raresql.com/2012/04/17/how-to-change-the-default-database-backup-folder-insql-server/
--Developed By: Muhammad Imran
--Date Created: 17th April 2012
--Date Modified: 28th Dec 2022

--Script

--Declare Variables
DECLARE @HkeyLocal nvarchar(18)
DECLARE @BackupDirectory nvarchar(512)
DECLARE @InstanceRegPath sysname
DECLARE @MSSqlServerRegPath nvarchar(31)
DECLARE @NewPath nvarchar(100)

--Set Variable values 
SET @HkeyLocal=N'HKEY_LOCAL_MACHINE'
SET @MSSqlServerRegPath=N'SOFTWARE\Microsoft\MSSQLServer'
SET @InstanceRegPath=@MSSqlServerRegPath + N'\MSSQLServer'
 
EXEC xp_instance_regread @HkeyLocal, @InstanceRegPath, N'BackupDirectory', @BackupDirectory OUTPUT 
SELECT @BackupDirectory -- Read the default backup directory path
 
-- Update/Change the default backup directory path to @NewPath
SET @NewPath='D:\DBBackup' -- Change the new default backup folder here 
EXEC xp_instance_regwrite @HkeyLocal,@InstanceRegPath, N'BackupDirectory', REG_SZ,@NewPath 

--End of Script
