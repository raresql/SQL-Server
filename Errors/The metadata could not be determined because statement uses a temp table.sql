--Script Name: The metadata could not be determined because statement uses a temp table.
--Script Type: Error
--Article: https://raresql.com/2013/06/15/sql-server-2012-fix-error-11525-the-metadata-could-not-be-determined-because-statement-uses-a-temp-table/
--Developed By: Muhammad Imran
--Date Created: 15 June 2013
--Date Modified: 30 Dec 2022

--Error
--The metadata could not be determined because statement ‘%.*ls’ uses a temp table.

--End of error

--Error generation

--Use database tempdb
USE tempdb
GO

--Create table
CREATE TABLE #temp_Sample
(
 [ID] INT,
 [NAME] VARCHAR(32)
)
GO

--Browse table
SELECT * FROM #temp_Sample
GO

--View metadata
USE tempdb
GO
Sp_describe_first_result_set @tsql =N'Select * from #temp_Sample'
GO

--End of error generation

--Error resolution

-- Convert the temporary table to global temporary table.
SELECT * into ##temp_Sample FROM #temp_Sample
 
-- View the metadeta
Sp_describe_first_result_set @tsql =N'Select * from ##temp_Sample'
GO

--End of error resolution
