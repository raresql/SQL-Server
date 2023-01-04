--Script Name: EXECUTE statement failed because its WITH RESULT SETS clause
--Script Type: Error
--Article: https://raresql.com/2013/07/26/sql-server-fix-error-11538-execute-statement-failed-because-its-with-result-sets-clause/
--Developed By: Muhammad Imran
--Date Created: 26 July 2013
--Date Modified: 30 Dec 2022

--Error
--EXECUTE statement failed because its WITH RESULT SETS clause specified type ‘%ls’ for column #%d in result set #%d, and the corresponding type sent at run time was ‘%ls’; there is no conversion between the two types.

--End of error

--Error generation

--Sample

--Use database tempdb
USE tempdb
GO

--Create procedure
CREATE Procedure Usp_Resultset
AS
SELECT 1 as [Number]
GO
EXEC Usp_Resultset
GO

--Use database tempdb
USE tempdb
GO

--Execute procedure
EXEC Usp_Resultset
WITH RESULT SETS
(([Number] xml
));

--End of error generation

--Error resolution

--Use database tempdb
USE tempdb
GO

--Execute procedure
EXEC Usp_Resultset
WITH RESULT SETS
(([Number] int
));

--End of error resolution
