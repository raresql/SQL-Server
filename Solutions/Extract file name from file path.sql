--Script Name: Extract file name from file path
--Script Type: Solution
--Article: https://raresql.com/2013/07/14/sql-server-extract-file-name-from-file-path/
--Developed By: Muhammad Imran
--Date Created: 14 July 2015
--Date Modified: 10 Jan 2023

--Sample

--Use database tempdb
USE Tempdb
GO

--Create table
CREATE TABLE tbl_Sample
(
 [ID] INT,
 [File Path] VARCHAR(200)
)
GO

--Insert records into table
INSERT INTO tbl_Sample ([ID],[File Path])
VALUES (1,'C:\Users\imran\Documents\worksheet.xlsx')
 
INSERT INTO tbl_Sample ([ID],[File Path])
VALUES (2,'C:\Users\imran\image.png')
 
INSERT INTO tbl_Sample ([ID],[File Path])
VALUES (3,'C:\Users\imran\Documents\Document.doc')
GO

--End of sample

--Seprate file name from path
SELECT
 [ID]
,[File Path]
,SUBSTRING([File Path],LEN([File Path])
- CHARINDEX('\',REVERSE([File Path]))+2,LEN([File Path]))
AS [File Name]
FROM tbl_Sample
GO

--End
