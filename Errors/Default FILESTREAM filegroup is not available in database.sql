--Script Name: Default FILESTREAM filegroup is not available in database.
--Script Type: Error
--Article: https://raresql.com/2013/05/17/sql-server-fix-error-1969-default-filestream-filegroup-is-not-available-in-database/
--Developed By: Muhammad Imran
--Date Created: 17 May 2013
--Date Modified: 30 Dec 2022

--Error
--Default FILESTREAM filegroup is not available in database ‘%.*ls’.

--End of error

--Error generation
--Sample

--Create a database
USE master ;
GO
CREATE DATABASE Musicdb
ON
(NAME = Musicdb_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Musicdbdat.mdf')
LOG ON
( NAME = Musicdb_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Musicdblog.ldf') ;
GO

--Use database Musicdb 
USE Musicdb
GO

--Create a table
CREATE TABLE tbl_music
(
[ID] uniqueidentifier not null rowguidcol
constraint PK_music primary key clustered,
[Music_files] varbinary(max) filestream
)

--End of sample

--End of error generation

--Error resolution

--Step-1

--Browse data
SELECT database_id,type_desc,name,physical_name
FROM sys.master_files WHERE database_id=DB_ID('Musicdb')

--End of step-1

--Step-2

--Use database master
USE [master]
GO

--Alter database Musicdb
ALTER DATABASE Musicdb
ADD FILEGROUP [MyMusicAlbum]
CONTAINS FILESTREAM
GO
ALTER DATABASE Musicdb
ADD FILE
(
 NAME = N'Album01',
 FILENAME = N'C:\music\Album01.ndf'
)
TO FILEGROUP [MyMusicAlbum]
GO

--End of step-2

--Step-3

--Use database Musicdb
USE Musicdb
GO

--Alter database
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'MyMusicAlbum')
ALTER DATABASE Musicdb MODIFY FILEGROUP [MyMusicAlbum] DEFAULT
GO

--End of step-3

--Step-4

--Use database Musicdb
--Create a table
USE Musicdb
GO

--Create table
CREATE TABLE tbl_music
(
 [ID] uniqueidentifier not null rowguidcol
 constraint PK_music primary key clustered,
 [Music_files] varbinary(max) filestream
)

--End of step-4
--End of error resolution
