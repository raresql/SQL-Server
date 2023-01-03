--Script Name: Multiple ways to find identity column
--Script Type: Solution
--Article: https://raresql.com/2012/10/22/sql-server-multiple-ways-to-find-identity-column/
--Developed By: Muhammad Imran
--Date Created: 22nd October 2012
--Date Modified: 28th Dec 2022

--Method-1
--sys.columns

--Use database AdventureWorks
USE Adventureworks
GO

--Browse Data 
SELECT Object_Name([object_id]) as [Table Name]
     , [name] as [Column Name]
     , is_identity
FROM sys.columns
WHERE is_identity=1 And Objectproperty(object_id,'IsUSErTable')=1;
GO

--End of Method-1

--Method-2
--sys.objects & sys.all_columns

--Use database AdventureWorks
USE Adventureworks
GO

--Browse Data  
SELECT A.[name] as [Table Name]
     , B.[name] as [Column Name]
     , B.is_identity
FROM sys.objects A 
INNER JOIN sys.all_columns B 
On A.[object_id]=B.[object_id]
WHERE A.type='U' And is_identity=1;
GO

--End of Method-2

--Method-3
--sys.tables & sys.all_columns

--Use database AdventureWorks
USE Adventureworks
GO

--Browse Data
SELECT A.[name] as [Table Name]
     , B.[name] as [Column Name]
     , B.is_identity
FROM sys.tables A 
INNER JOIN sys.all_columns B 
On A.[object_id]=B.[object_id]
WHERE A.type='U' And is_identity=1;
GO

--End of Method-3

--Method-4
--sys.objects & sys.identity_columns

--Use database AdventureWorks
USE Adventureworks
GO

--Browse data 
SELECT A.[name] as [Table Name]
     , B.[name] as [Column Name]
     , B.is_identity
FROM sys.objects A 
INNER JOIN sys.identity_columns B 
On A.[object_id]=B.[object_id]
WHERE A.type='U';
GO

--End of Method-4

--Method-5
--sys.tables & sys.identity_columns

--Use database AdventureWorks
USE Adventureworks
GO

--Browse data 
SELECT A.[name] as [Table Name]
     , B.[name] as [Column Name]
     , B.is_identity
FROM sys.tables A 
INNER JOIN sys.identity_columns B 
On A.[object_id]=B.[object_id]
WHERE A.type='U' And is_identity=1;
GO

--End of Method-5

--Method-6
--INFORMATION_SCHEMA.COLUMNS

--Use database AdventureWorks
USE Adventureworks
GO

--Create New CTE
;With CTE AS 
    (SELECT Table_Schema+'.'+Table_Name as [Table_Name],[Column_name] 
     FROM INFORMATION_SCHEMA.COLUMNS)

--Browse Data
SELECT Table_Name
     , [Column_name]
     , COLUMNPROPERTY(OBJECT_ID(Table_Name),[Column_name],'IsIdentity')AS 'IsIdentity'
FROM CTE WHERE
COLUMNPROPERTY( OBJECT_ID(Table_Name),[Column_name],'IsIdentity')=1

--End of Method-6
