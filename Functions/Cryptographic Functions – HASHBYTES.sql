--Script Name: Cryptographic Functions – HASHBYTES
--Script Type: Function
--Article: https://raresql.com/2013/04/01/sql-server-cryptographic-functions-hashbytes-enhancement/
--Developed By: Muhammad Imran
--Date Created: 1 Apr 2013
--Date Modified: 11 Jan 2023

--Script

--Declare variable
DECLARE @String varchar(7);

--Set value of variable
Set @String ='raresql'
 
--This [Algorithm type] will work in SQL Server 2005 and above
SELECT 'MD2' AS [Algorithm type]
, HASHBYTES('MD2', @String) as [HashBytes]
, LEN(HASHBYTES('MD2', @String)) as [Length in Bytes]
UNION ALL
 
--This [Algorithm type] will work in SQL Server 2005 and above
SELECT 'MD4' AS [Algorithm type]
, HASHBYTES('MD4', @String) as [HashBytes]
, LEN(HASHBYTES('MD4', @String)) as [Length in Bytes]
UNION ALL
 
--This [Algorithm type] will work in SQL Server 2005 and above
SELECT 'MD5' AS [Algorithm type]
, HASHBYTES('MD5', @String) as [HashBytes]
, LEN(HASHBYTES('MD5', @String)) as [Length in Bytes]
UNION ALL
 
--This [Algorithm type] will work in SQL Server 2005 and above
SELECT 'SHA' AS [Algorithm type]
, HASHBYTES('SHA', @String) as [HashBytes]
, LEN(HASHBYTES('SHA', @String)) as [Length in Bytes]
UNION ALL
 
--This [Algorithm type] will work in SQL Server 2005 and above
SELECT 'SHA1' AS [Algorithm type]
, HASHBYTES('SHA1', @String) as [HashBytes]
, LEN(HASHBYTES('SHA1', @String)) as [Length in Bytes]
UNION ALL
 
--This [Algorithm type] will work in SQL Server 2012 and above
SELECT 'SHA2_256' AS [Algorithm type]
, HASHBYTES('SHA2_256', @String) as [HashBytes]
, LEN(HASHBYTES('SHA2_256', @String)) as [Length in Bytes]
UNION ALL
 
--This [Algorithm type] will work in SQL Server 2012 and above
SELECT 'SHA2_512' AS [Algorithm type]
, HASHBYTES('SHA2_512', @String) as [HashBytes]
, LEN(HASHBYTES('SHA2_512', @String)) as [Length in Bytes]
GO

--End of script
