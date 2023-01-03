--Script Name: How to find SQL Server port number
--Script Type: Solution
--Article: https://raresql.com/2013/04/20/sql-server-how-to-find-sql-server-port-number/
--Developed By: Muhammad Imran
--Date Created: 20 Apr 2013
--Date Modified: 28 Dec 2022

--Method-1
--Use xp_instance_regread

--This script will work on SQL Server 2005 and above

--Declare variables
DECLARE @HkeyLocal nvarchar(18)
Declare @Instance varchar(100)
DECLARE @MSSqlServerRegPath nvarchar(200)
DECLARE @PortNumber nvarchar(100)

--Set values of variables
SET @Instance ='MSSQL11.MSSQLSERVER'
SET @HkeyLocal=N'HKEY_LOCAL_MACHINE'
SET @MSSqlServerRegPath=N'SOFTWARE\Microsoft\\Microsoft SQL Server\'
+ @Instance + '\MSSQLServer\SuperSocketNetLib\Tcp\IPAll'
 
Print @MSSqlServerRegPath

--Execute xp_instance_regread
EXEC xp_instance_regread @HkeyLocal
   , @MSSqlServerRegPath
   , N'TcpPort'
   , @PortNumber OUTPUT
SELECT @PortNumber as [Port Number];
GO

--End of method-1

--Method-2
--use sys.dm_server_registry

--Use database master
Use master
GO

--Browse data
Select value_data as [Port Number]
From sys.dm_server_registry
Where registry_key like '%IPALL%' and
value_name ='TcpPort';
GO

--End of method-2
