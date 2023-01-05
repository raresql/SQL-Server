--Script Name: SQL Server blocked access to %S_MSG ‘%ls’ of component ‘%.*ls’
--Script Type: Error
--Article: https://raresql.com/2014/01/19/sql-server-fix-error-15281-sql-server-blocked-access-to-s_msg-ls-of-component-ls-because-this-component-is-turned-off-as-part-of-the-security-configuration-for-this-server/
--Developed By: Muhammad Imran
--Date Created: 19 Jan 2014
--Date Modified: 5 Jan 2023

--Error message

SQL Server blocked access to %S_MSG ‘%ls’ of component ‘%.*ls’ because this component is turned off as part of the security configuration for this server. A system administrator can enable the use of ‘%.*ls’ by using sp_configure. For more information about enabling ‘%.*ls’, see “Surface Area Configuration” in SQL Server Books Online.

--End of error message

--Error generation

--Use database AdventureWorks2012
USE AdventureWorks2012
GO

--Browse data
SELECT * FROM OPENROWSET('SQLNCLI', 'Server=(local);uid=test;pwd=test',
'EXEC AdventureWorks2012.[dbo].[uspGetManagerEmployees] 16');

--End of error generation

--Error resolution

--Use database master
USE master
GO

--configure sp_configure
sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;
GO

--End of error resolution
