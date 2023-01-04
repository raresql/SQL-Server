--Script Name:  EXECUTE statement failed because its WITH RESULT SETS clause specified column(s) for result set number, but the statement sent column(s) at run time.
--Script Type: Error
--Article: https://raresql.com/2013/06/22/sql-server-fix-error-11537-execute-statement-failed-because-its-with-result-sets-clause-specified-columns-for-result-set-number-but-the-statement-sent-columns-at-run-time/
--Developed By: Muhammad Imran
--Date Created: 22 June 2013
--Date Modified: 30 Dec 2022

--Error
--EXECUTE statement failed because its WITH RESULT SETS clause specified %d column(s) for result set number %d, but the statement sent %d column(s) at run time.

--End of error

--Error generation

--Sample

--Create procedure
CREATE PROCEDURE usp_Resultset
AS
SELECT 'A' AS [First Letter],
'B' as [Second Letter]
GO

--Execute procedure
EXEC usp_Resultset

--Use database tempdb
USE tempdb
GO

--Use resultset clause
--Execute procedure
EXEC usp_Resultset
WITH RESULT SETS
(([1st Letter] VARCHAR(1)
));

--End of sample

--End of error generation

--Error resolution

--Use database tempdb
USE tempdb
GO

--Use resultset clause
--Execute procedure
EXEC usp_Resultset
WITH RESULT SETS
(([1st Letter] VARCHAR(1)
, [2nd Letter] VARCHAR(1)
));

--End of error resolution
