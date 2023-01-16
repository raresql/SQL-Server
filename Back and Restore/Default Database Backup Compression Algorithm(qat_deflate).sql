--Script Name: Default Database Backup Compression Algorithm(qat_deflate)
--Script Type: Backup and Restore
--Article: https://raresql.com/2022/12/15/sql-server-2022-tsql-qat_deflate-default-database-backup-compression-algorithm/
--Developed By: Muhammad Imran
--Date Created: 15 Dec 2022
--Date Modified: 11 Jan 2023

Step-1

--Use database SampleDB
USE SampleDB;
GO

--Browse table
SELECT DB_NAME()  AS DatabaseName
     , name       AS FileName
     , size/128.0 AS CurrentSizeInMBs
FROM sys.database_files; 
GO

--End of step-1

Step-2

--Take backup
BACKUP DATABASE [SampleDB] 
TO  DISK = 'D:\Backup\FullBackupSampleDB.BAK';
GO

--End of step-2

Step-3

--Check backup detail

--Browse backup
SELECT bs.database_name,
    backuptype = CASE
        WHEN bs.type = 'D' AND bs.is_copy_only = 0 THEN 'Full Database'
        WHEN bs.type = 'D' AND bs.is_copy_only = 1 THEN 'Full Copy-Only Database'
        WHEN bs.type = 'I' THEN 'Differential database backup'
        WHEN bs.type = 'L' THEN 'Transaction Log'
        WHEN bs.type = 'F' THEN 'File or filegroup'
        WHEN bs.type = 'G' THEN 'Differential file'
        WHEN bs.type = 'P' THEN 'Partial'
        WHEN bs.type = 'Q' THEN 'Differential partial'
        END + ' Backup',
    BS.compression_algorithm,
    backup_size_mb = CONVERT(DECIMAL(10, 2), bs.backup_size / 1024. / 1024.),
    compressed_backup_size_mb = CONVERT(DECIMAL(10, 2), bs.compressed_backup_size / 1024. / 1024.),
    bs.backup_start_date ,
    bs.backup_finish_date,
    DATEDIFF(second, backup_start_date, backup_finish_date) AS time_in_seconds
FROM msdb.dbo.backupset bs
LEFT JOIN msdb.dbo.backupmediafamily bf
    ON bs.[media_set_id] = bf.[media_set_id]
INNER JOIN msdb.dbo.backupmediaset bms
    ON bs.[media_set_id] = bms.[media_set_id]
WHERE bs.backup_start_date > DATEADD(MONTH, - 2, sysdatetime()) --only look at last two months
ORDER BY bs.database_name ASC,
    bs.Backup_Start_Date DESC;
	
--End of step-3

Step-4

--NO QUERY

--End of step-4

Step-5

-Configuration
EXEC sp_configure 'backup compression algorithm', 2;   
RECONFIGURE; 
GO

--End of step-5

Step-6

--Check configuration
SELECT configuration_id
     , name
     , description
     , value   
FROM sys.configurations   
WHERE name = 'backup compression algorithm' ;  
GO

--End of step-6

Step-7

--Configure hardware_offload option
EXEC sp_configure 'show advanced options', 1;
GO
 
RECONFIGURE
GO
 
EXEC sp_configure 'hardware offload enabled', 1;
GO
 
RECONFIGURE
GO
 
ALTER SERVER CONFIGURATION SET HARDWARE_OFFLOAD = ON(ACCELERATOR = QAT); 
GO

--End of step-7

Step-8

--NO QUERY

--End of step-8

--Step-9

--Take full backup
BACKUP DATABASE [SampleDB] 
TO  DISK = 'D:\BackupFullBackupSampleDBWithCompression.BAK'
WITH COMPRESSION;
GO

--End of step-9

--Step-10

SELECT bs.database_name,
    backuptype = CASE
        WHEN bs.type = 'D' AND bs.is_copy_only = 0 THEN 'Full Database'
        WHEN bs.type = 'D' AND bs.is_copy_only = 1 THEN 'Full Copy-Only Database'
        WHEN bs.type = 'I' THEN 'Differential database backup'
        WHEN bs.type = 'L' THEN 'Transaction Log'
        WHEN bs.type = 'F' THEN 'File or filegroup'
        WHEN bs.type = 'G' THEN 'Differential file'
        WHEN bs.type = 'P' THEN 'Partial'
        WHEN bs.type = 'Q' THEN 'Differential partial'
        END + ' Backup',
    CASE bf.device_type
        WHEN 2 THEN 'Disk'
        WHEN 5 THEN 'Tape'
        WHEN 7 THEN 'Virtual device'
        WHEN 9 THEN 'Azure Storage'
        WHEN 105 THEN 'A permanent backup device'
        ELSE 'Other Device'
        END AS DeviceType,
 
    BS.compression_algorithm,
    backup_size_mb = CONVERT(DECIMAL(10, 2), bs.backup_size / 1024. / 1024.),
    compressed_backup_size_mb = CONVERT(DECIMAL(10, 2), bs.compressed_backup_size / 1024. / 1024.),
    bs.backup_start_date ,
    bs.backup_finish_date
FROM msdb.dbo.backupset bs
LEFT JOIN msdb.dbo.backupmediafamily bf
    ON bs.[media_set_id] = bf.[media_set_id]
INNER JOIN msdb.dbo.backupmediaset bms
    ON bs.[media_set_id] = bms.[media_set_id]
WHERE bs.backup_start_date > DATEADD(MONTH, - 2, sysdatetime()) --only look at last two months
ORDER BY bs.database_name ASC,
    bs.Backup_Start_Date DESC;

--End of step-10
