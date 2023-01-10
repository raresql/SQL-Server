--Script Name: EXECUTE statement failed because its WITH RESULT SETS clause specified result set(s)
--Script Type: Solution
--Article: https://raresql.com/2013/03/08/sql-server-execute-statement-failed-because-its-with-result-sets-clause-specified-result-sets-and-the-statement-tried-to-send-more-result-sets-than-this/
--Developed By: Muhammad Imran
--Date Created: 8 Mar 2013
--Date Modified: 5 Jan 2023

--Error generation

--Sample

--Create procedure
Create Procedure UDP_Resultset
As
Select 'A' as [First Letter]
Select 'B' as [Second Letter]
GO
EXEC UDP_Resultset

--End of sample

EXEC UDP_Resultset
WITH RESULT SETS
(([1st Letter] varchar(50)
));

--End of error generation

--Error resolution

--Ececute procedure
EXEC UDP_Resultset
WITH RESULT SETS
(([1st Letter] varchar(50)
)
,([2nd Letter] varchar(50)
));
