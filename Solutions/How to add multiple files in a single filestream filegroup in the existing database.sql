--Script Name: How to add multiple files in a single filestream filegroup in the existing database
--Script Type: Solution
--Article: https://raresql.com/2013/07/28/sql-server-2012-how-to-add-multiple-files-in-a-single-filestream-filegroup-in-the-existing-database/
--Developed By: Muhammad Imran
--Date Created: 28 July 2013
--Date Modified: 28 Dec 2022

--Example

--Use database master
USE [master]
GO

--Create database
CREATE DATABASE [Sample_DB]
CONTAINMENT = NONE
ON PRIMARY
(
NAME = N'Sample_DB',
FILENAME = N'C:\Data\Sample_DB.mdf',
SIZE = 500MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 10MB
),
FILEGROUP [FS] CONTAINS FILESTREAM DEFAULT
(
NAME = N'Filestream1',
FILENAME = N'C:\Data\FileStream1',
MAXSIZE = UNLIMITED
)
LOG ON
(NAME = N'Sample_DB_log'
,FILENAME = N'C:\Data\Sample_DB_log.ldf',
SIZE = 500MB,
MAXSIZE = 1GB,
FILEGROWTH = 10MB
)
GO

--Alter database
ALTER DATABASE [Sample_DB]
ADD FILE
(
NAME = N'Filestream2',
FILENAME = N'C:\Data\Filestream2',
MAXSIZE = 100MB
)TO FILEGROUP [FS]
GO

--Browse database
Select * from sys.master_files where database_id =db_id('Sample_DB')
GO

--End of example
