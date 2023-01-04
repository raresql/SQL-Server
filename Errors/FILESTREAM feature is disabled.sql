--Script Name: FILESTREAM feature is disabled
--Script Type: Error
--Article: https://raresql.com/2013/11/19/sql-server-2012-fix-error-5591-filestream-feature-is-disabled/
--Developed By: Muhammad Imran
--Date Created: 19 Nov 2013
--Date Modified: 28 Dec 2022

--Error

--Message Number: 5591

--Severity : 16

--Error Message: FILESTREAM feature is disabled.

--End of error

--Sample

--Error generation

--Use database master
USE master
GO

--Create database
CREATE DATABASE [SampleDB]
ON PRIMARY
( NAME = N'SampleDB',
FILENAME = N'C:\DATA\SampleDB.mdf'
),
FILEGROUP SampleFileGroup CONTAINS FILESTREAM
(NAME = SampleFileTableFS,
FILENAME='C:\Data\SampleFileTable'
)
LOG ON
( NAME = N'SampleDB_log',
FILENAME = N'C:\DATA\SampleDB_log.ldf'
)
WITH FILESTREAM
( NON_TRANSACTED_ACCESS = FULL,
DIRECTORY_NAME = N'SampleFileTableDB'
)
GO

--End of sample
--End of error generation

