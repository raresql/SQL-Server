--Script Name: Invalid data type %.*ls in function %.*ls.
--Script Type: Error
--Article: https://raresql.com/2013/07/11/sql-server-2012-fix-error-10761-invalid-data-type-ls-in-function-ls/
--Developed By: Muhammad Imran
--Date Created: 11 July 2013
--Date Modified: 30 Dec 2022

--Error
--Invalid data type %.*ls in function %.*ls.

--End of error

--Error generation

SELECT PARSE(GETDATE() AS varchar(11)  USING 'en-US') AS Result;

--End of error generation

--Error resolution

SELECT PARSE('2013-07-12' AS datetime USING 'en-US') AS Result;

--End of error resolution
