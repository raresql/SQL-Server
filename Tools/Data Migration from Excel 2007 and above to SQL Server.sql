--Script Name:  Data Migration from Excel 2007 and above to SQL Server
--Script Type: Tools
--Article: https://raresql.com/2013/02/22/step-by-step-data-migration-from-excel-2007-and-above-to-sql-server/
--Developed By: Muhammad Imran
--Date Created: 22 Feb 2013
--Date Modified: 7 Jan 2023

--Script

SELECT * FROM  OPENROWSET('Microsoft.Jet.OLEDB.4.0'
,'Excel 4.0;Database=D:\test.xls','SELECT * FROM [sheet1$]')

SELECT * FROM  OPENROWSET('Microsoft.Jet.OLEDB.4.0'
,'Excel 4.0;Database=D:\test.xlsx','SELECT * FROM [sheet1$]')

--Step-1

--NO Query

--End of step-1

--Step-2

--NO Query

--End of step-2

--Step-3

--NO Query

--End of step-3

--Step-4

--Enable Ad hoc queries

sp_configure 'show advanced options', 1;
RECONFIGURE;
sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;
GO

--End of step-4

--Step-5

--NO Query

--End of step-5

--Step-6

SELECT * FROM OPENROWSET ('Microsoft.ACE.OLEDB.12.0',
'Excel 12.0;Database=E:\test.xlsx;HDR=YES;IMEX=1',
'SELECT * FROM [sheet1$]');

SELECT * into Temp FROM OPENROWSET ('Microsoft.ACE.OLEDB.12.0',
'Excel 12.0;Database=E:\test.xlsx;HDR=YES;IMEX=1',
'SELECT * FROM [sheet1$]');

--End of step-6

--End of script
