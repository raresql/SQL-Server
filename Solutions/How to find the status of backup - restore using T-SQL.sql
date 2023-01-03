--Script Name: How to find the status of backup \ restore using T-SQL
--Script Type: Solution
--Article: https://raresql.com/2015/05/31/sql-server-how-to-find-the-status-of-backup-restore-using-t-sql/
--Developed By: Muhammad Imran
--Date Created: 31 May 2015
--Date Modified: 3 Jan 2023

--Use database master
USE master;
GO

--Use DATEADD(), GETDATE()
--Use INNER JOIN
SELECT
A.session_id As [Session ID]
, login_name As [Login Name]
, [command] As [Command]
, [text] AS [Script]
, [start_time] As [Start Time]
, [percent_complete] AS [Percentage]
, DATEADD(SECOND,estimated_completion_time/1000, GETDATE())
as [Estimated Completion time]
, [program_name] As [Program Name]
FROM sys.dm_exec_requests A
CROSS APPLY sys.dm_exec_sql_text(A.sql_handle) B
INNER JOIN sys.dm_exec_sessions C ON A.session_id=C.session_id
WHERE A.command in ('BACKUP DATABASE','RESTORE DATABASE')
GO

--Backup

--Use database master
USE master;
GO

--Backup database
BACKUP DATABASE AdventureWorks2012
TO DISK = 'C:\Data\AdventureWorks2012.Bak'
WITH FORMAT,
MEDIANAME = 'SQLServerBackups',
NAME = 'Full Backup of AdventureWorks2012';
GO

--End of backup

--Restore Backup

--Use database master
USE master;
GO

--Restore database
RESTORE DATABASE AdventureWorks2012
FROM DISK = 'C:\Data\AdventureWorks2012.BAK'
WITH NORECOVERY
GO

--End of restore
