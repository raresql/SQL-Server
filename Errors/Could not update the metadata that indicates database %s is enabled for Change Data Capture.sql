--Script Name: Could not update the metadata that indicates database %s is enabled for Change Data Capture.
--Script Type: Error
--Article: https://raresql.com/2014/01/10/sql-server-2012-fix-error-11526-the-metadata-could-not-be-determined-because-statement-ls-in-procedure-ls-uses-a-temp-table/
--Developed By: Muhammad Imran
--Date Created: 10th January 2014
--Date Modified: 30th Dec 2022

--Create Sample

--Use Temporary database
USE tempdb
GO

--DROP PROCEDURE [dbo].[usp_sample]
--GO

--Create sample procedure
CREATE PROCEDURE [dbo].[usp_sample]
AS
BEGIN
CREATE TABLE #temp_Sample
(
 [ID] INT,
 [NAME] VARCHAR(32)
)
INSERT INTO #temp_Sample VALUES (1,'Bob')
 
SELECT * FROM #temp_Sample
END
GO

--Execute sample procedure 
EXEC [dbo].[usp_sample]
GO

--End of Sample

--Error
--View procedure's metadata

--Use Temporary database
USE tempdb
GO

Sp_describe_first_result_set @tsql =N'usp_sample'
GO

--Output returns error: The metadata could not be determined because statement ‘INSERT INTO #temp_Sample VALUES (1,’Bob’)’ in procedure ‘usp_sample’ uses a temp table.

--End of error

--Solution
--Convert local temporary table to table variable and view its metadata.

--Use Temporary database
USE tempdb
GO

--DROP PROCEDURE [dbo].[usp_sample]
--GO

--Create Sample Procedure
CREATE PROCEDURE [dbo].[usp_sample]
AS
BEGIN
DECLARE @temp_Sample TABLE
(
 [ID] INT,
 [NAME] VARCHAR(32)
)
INSERT INTO @temp_Sample VALUES (1,'Bob')
 
SELECT * FROM @temp_Sample
END;
GO
 
Sp_describe_first_result_set @tsql =N'usp_sample';
GO

--End of Solution
