--Script Name: BCC SHRINKFILE for FILESTREAM containers requires EMPTYFILE option and does not allow any other options
--Script Type: Solution
--Article: https://raresql.com/2013/03/02/sql-server-dbcc-shrinkfile-for-filestream-containers-requires-emptyfile-option-and-does-not-allow-any-other-options/
--Developed By: Muhammad Imran
--Date Created: 2 Mar 2013
--Date Modified: 5 Jan 2023

--Sample

--Create database
CREATE DATABASE [MyFileTableDB]
ON PRIMARY
( NAME = N'MyFileTableDB', FILENAME = N'C:\DATA\MyFileTableDB.mdf'),
FILEGROUP MyFileGroup CONTAINS FILESTREAM (NAME = MyFileTableFS,FILENAME='C:\Data\MyFileTable')
LOG ON
( NAME = N'MyFileTableDB_log', FILENAME = N'C:\DATA\MyFileTableDB_log.ldf')
WITH FILESTREAM ( NON_TRANSACTED_ACCESS = FULL, DIRECTORY_NAME = N'MyFileTableDB' )
GO

--End of sample

--End of step-1

--Error generation

--Step-2
-- Shrink the data file

--Use database My_FileTableDB
USE My_FileTableDB
GO
DBCC SHRINKFILE (N'MyFileTableDB' , 0, TRUNCATEONLY)

--End of step-2

--Step-3

-- Shrink the log file

--Use database My_FileTableDB
USE My_FileTableDB
GO
DBCC SHRINKFILE (N'MyFileTableDB_log' , 0, TRUNCATEONLY)

--End of step-3

--Step-4

-- Shrink the FileStream file

--Use database My_FileTableDB
USE My_FileTableDB
GO
DBCC SHRINKFILE (N'MyFileTableFS' , 0, TRUNCATEONLY)

--End of step-4

--End of error generation

--Resolution

DBCC SHRINKFILE (N'MyFileTableFS' , EMPTYFILE)

--End of error resolution
