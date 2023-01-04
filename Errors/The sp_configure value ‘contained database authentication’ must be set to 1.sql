--Script Name: The sp_configure value ‘contained database authentication’ must be set to 1.
--Script Type: Error
--Article: https://raresql.com/2013/11/07/sql-server-2012-fix-error-12824-the-sp_configure-value-contained-database-authentication-must-be-set-to-1/
--Developed By: Muhammad Imran
--Date Created: 7 Nov 2013
--Date Modified: 28 Dec 2022

--Error

--The sp_configure value ‘contained database authentication’ must be set to 1 in order to %S_MSG a contained database. You may need to use RECONFIGURE to set the value_in_use.

--End of error

--Error resolution:

sp_configure 'contained database authentication', 1;
GO
RECONFIGURE;
GO

--End of error resolution
