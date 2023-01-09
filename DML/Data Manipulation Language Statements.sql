--Script Name: Data Manipulation Language (DML) Statements
--Script Type: DML
--Article: https://raresql.com/2013/02/05/sql-server-2012-filetables-data-manipulation-language-dml-statements/
--Developed By: Muhammad Imran
--Date Created: 5 Feb 2013
--Date Modified: 7 Jan 2023

--Insert record via Transact SQL
INSERT INTO [dbo].[databank] ([name],[file_stream])
SELECT'Test file',
* FROM OPENROWSET(BULK N'C:\abc-2.txt', SINGLE_BLOB) AS FileData
GO

--Browse table
Select * from dbo.DataBank

--Update table
Update Databank set [name]='test file-2' where [name]='test file'

--Browse table
Select * from dbo.DataBank

--Delete records from table
Delete from DataBank where [name]='test file-2'

--Browse table
Select * from dbo.DataBank
