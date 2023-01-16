--Script Name: The culture parameter provided in the function call is not supported
--Script Type: Error
--Article: https://raresql.com/2013/03/22/sql-server-2012-fix-error-the-culture-parameter-provided-in-the-function-call-is-not-supported/
--Developed By: Muhammad Imran
--Date Created: 22 Mar 2013
--Date Modified: 11 Jan 2023

--Error generation

--Use FORMAT() function
SELECT FORMAT (Getdate() ,'dddd, MMMM dd, yyyy hh:mm:ss tt','e-US')
AS [English Culture]

--End of error generation

--Error resolution

--Use FORMAT() function
SELECT FORMAT (Getdate() ,'dddd, MMMM dd, yyyy hh:mm:ss tt','en-US')
AS [English Culture]

--End of error resolution
