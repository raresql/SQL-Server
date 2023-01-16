--Script Name: FILESTREAM Filegroups Can Contain Multiple Files
--Script Type: Performance
--Article: https://raresql.com/2013/06/12/sql-server-2012-scalability-and-performance-enhancements-filestream-filegroups-can-contain-multiple-files/
--Developed By: Muhammad Imran
--Date Created: 12 Jun 2013
--Date Modified: 12 Jan 2023

--Script

--Create database
CREATE DATABASE [Personal_DB]
CONTAINMENT = NONE
ON PRIMARY
(
NAME = N'Personal_DB',
FILENAME = N'C:\Data\Personal_DB.mdf',
SIZE = 100MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 1MB
),
FILEGROUP [FS] CONTAINS FILESTREAM DEFAULT
(
NAME = N'Music',
FILENAME = N'C:\Data\Music',
MAXSIZE = UNLIMITED
),
(
NAME = N'Videos',
FILENAME = N'C:\Data\Videos',
MAXSIZE = 100MB
)
LOG ON
(
NAME = N'Personal_DB_log',
FILENAME = N'C:\Data\Personal_DB_log.ldf',
SIZE = 100MB,
MAXSIZE = 1GB,
FILEGROWTH = 1MB
)
GO

--End of script
