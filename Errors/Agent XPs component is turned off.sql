--Script Name: Agent XPs component is turned off
--Script Type: Error
--Article: https://raresql.com/2013/10/30/sql-server-fix-error-agent-xps-component-is-turned-off/
--Developed By: Muhammad Imran
--Date Created: 30 Oct 2013
--Date Modified: 28 Dec 2022

--Error
--‘Agent XPs’ component is turned off as part of the security configuration for this server. A system administrator can enable the use of ‘Agent XPs’ by using sp_configure. For more information about enabling ‘Agent XPs’, see “Surface Area Configuration” in SQL Server Books Online. (Microsoft.SqlServer.Management.MaintenancePlanWizard)

--End of error

--Error resolution

sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'Agent XPs', 1;
GO
RECONFIGURE
GO

--End of error resolution
