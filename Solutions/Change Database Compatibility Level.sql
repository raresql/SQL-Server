--Script Name: Change Database Compatibility Level
--Script Type: Solution
--Article: https://raresql.com/2012/10/20/sql-server-change-database-compatibility-level/
--Developed By: Muhammad Imran
--Date Created: 20 Oct 2012
--Date Modified: 10 Jan 2023

--Method-1

ALTER DATABASE [AdventureWorks2012] SET COMPATIBILITY_LEVEL = 110
ALTER DATABASE [AdventureWorks2012] SET COMPATIBILITY_LEVEL = 100
ALTER DATABASE [AdventureWorks2012] SET COMPATIBILITY_LEVEL = 90

--Change Compatibility level in SQL SERVER 2012
ALTER DATABASE [AdventureWorks2012] SET COMPATIBILITY_LEVEL = 80

--End of method-1

--Method-2

EXEC sp_dbcmptlevel [AdventureWorks2012] , 110;

--Change Compatibility level in SQL SERVER 2005 / 2008
EXEC sp_dbcmptlevel [AdventureWorks] , 90;
--End of method-2

--Method-3


--End of method-3
