--Script Name: EXECUTE statement failed
--Script Type: Error
--Article: https://raresql.com/2013/03/28/sql-server-fix-error-11536-execute-statement-failed-because-its-with-result-sets-clause-specified-result-sets-but-the-statement-only-sent-result-sets-at-run-time/
--Developed By: Muhammad Imran
--Date Created: 15 March 2013
--Date Modified: 30 Dec 2022

--Error
--EXECUTE statement failed because its WITH RESULT SETS clause specified %d result set(s), but the statement only sent %d result set(s) at run time.

--End of error

--Error generation

--Create procedure
CREATE Procedure UDP_Resultset
As
SELECT 'A' as [First Letter]
SELECT 'B' as [Second Letter]
GO

--Execute procedure
EXEC UDP_Resultset

--Execute procedure with result sets
EXEC UDP_Resultset
WITH RESULT SETS
(([1st Letter] varchar(50)
)
,([2nd Letter] varchar(50)
)
,([3rd Letter] varchar(50)
)
);

--End of error generation

--Error resolution

--Execute procedure with result sets
EXEC UDP_Resultset
WITH RESULT SETS
(([1st Letter] varchar(50)
)
,([2nd Letter] varchar(50)
));

--End of error resolution
