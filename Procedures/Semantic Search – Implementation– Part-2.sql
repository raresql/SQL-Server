--Script Name: Semantic Search – Implementation– Part-2
--Script Type: Procedure
--Article: https://raresql.com/2013/05/06/sql-server-2012-semantic-search-implementation-part-2/
--Developed By: Muhammad Imran
--Date Created: 6 May 2013
--Date Modified: 7 Jan 2023

--Step-1

--Create database

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

--End of step-1

--Step-2

--Use database SampleDB
USE SampleDB
GO

--Create table
CREATE TABLE CVBank AS FileTable
WITH
(
FileTable_Directory = 'CVFileTable_Dir'
);
GO

--End of step-2


--Step-3

--Use database SampleDB
USE SampleDB
GO

--Insert into table
INSERT INTO [dbo].[CVBank] ([name],[file_stream])
SELECT'Muhammad Imran -CV.doc',
* FROM OPENROWSET
(
BULK N'C:\Cv\Muhammad Imran -CV.doc', SINGLE_BLOB
) AS FileData
GO
 
INSERT INTO [dbo].[CVBank] ([name],[file_stream])
SELECT 'Salman Tahir -CV.doc',
* FROM OPENROWSET
(
BULK N'C:\Cv\Salman Tahir -CV.doc', SINGLE_BLOB
) AS FileData
GO
 
INSERT INTO [dbo].[CVBank] ([name],[file_stream])
SELECT 'Syed Kamran Ali -CV.doc',
* FROM OPENROWSET
(
BULK N'C:\Cv\Syed Kamran Ali -CV.doc', SINGLE_BLOB
) AS FileData
GO

--End of step-3


--Step-4

--Example-1

--Use database SampleDB
USE SampleDB
GO

--Browse table
SELECT
D.name
,KEYP_TBL.score
,KEYP_TBL.Keyphrase
FROM dbo.CVBank D
INNER JOIN SEMANTICKEYPHRASETABLE
(
dbo.CVBank,(name,file_stream)
) AS KEYP_TBL
ON D.path_locator = KEYP_TBL.document_key
WHERE KEYP_TBL.keyphrase like '%sharepoint%'
ORDER BY KEYP_TBL.score DESC

--End of example-1

--Example-2

--Use database SampleDB
USE SampleDB
GO
SELECT
D.name
,KEYP_TBL.score
,KEYP_TBL.Keyphrase
FROM dbo.CVBank D
INNER JOIN SEMANTICKEYPHRASETABLE
(
dbo.CVBank,(name,file_stream)
) AS KEYP_TBL
ON D.path_locator = KEYP_TBL.document_key
WHERE KEYP_TBL.keyphrase like '%sql%'
ORDER BY KEYP_TBL.score DESC

--End of example-2

--End of step-4
