--Script Name: Mass renaming of sql tables
--Script Type: Solution
--Article: https://raresql.com/2013/01/28/sql-server-mass-renaming-of-sql-tables/
--Developed By: Muhammad Imran
--Date Created: 28 Jan 2013
--Date Modified: 10 Jan 2023

--Syntax

--Declare variable
Declare @char varchar(1)

--Set value
Set @char='_'
SELECT 'EXEC sp_rename ''' + NAME +  ''', ' + ''''
+ Substring(name ,CharIndex(@char,name)+1,LEN(name)) + ''''
As [Script]
FROM dbo.sysobjects 
WHERE xtype = 'U' And CharIndex(@char,name)>0
Order By [Name]

--End of syntax
