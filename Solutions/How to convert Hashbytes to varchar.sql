--Script Name: How to convert Hashbytes to varchar
--Script Type: Solution
--Article: https://raresql.com/2013/04/02/sql-server-how-to-convert-hashbytes-to-varchar/
--Developed By: Muhammad Imran
--Date Created: 2 Apr 2013
--Date Modified: 28 Dec 2022

--Example
-- Convert 'raresql' string into Hasbytes

--Declare variables
DECLARE @varchar varchar(Max);
DECLARE @hashbytes varbinary(20);

--Set value of variable
SET @hashbytes=HASHBYTES('SHA1','raresql');

-- Select Hasbytes value
SELECT @hashbytes as Hasbytes;
 
--Convert varbinary value to varchar value
SET @varchar='0x' + cast('' as xml).value
('xs:hexBinary(sql:variable("@hashbytes"))', 'varchar(max)');
 
--Select value declared
SELECT @varchar as [Varchar];
GO

--End of example
