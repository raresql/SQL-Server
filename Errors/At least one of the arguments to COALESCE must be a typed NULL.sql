--Script Name: At least one of the arguments to COALESCE must be a typed NULL
--Script Type: Error
--Article: https://raresql.com/2013/06/03/sql-server-fix-error-4127-at-least-one-of-the-arguments-to-coalesce-must-be-a-typed-null/
--Developed By: Muhammad Imran
--Date Created: 3 June 2013
--Date Modified: 30 Dec 2022

--Error
--At least one of the arguments to COALESCE must be a typed NULL

--End of error

--Error generation

--Sample
Select COALESCE(NULL,NULL,NULL)

--End of sample

--End of error generation

--Error resolution

--Solution-1

--Use CONVERT() function
SELECT COALESCE(NULL,NULL,CONVERT(INT,NULL))

--End of solution-1

--Solution-2

SELECT COALESCE(NULL,NULL,NULL,'N/A')

--End of solution-2

--End of error resolution
