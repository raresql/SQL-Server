--Script Name: Proper Case User-Defined Function
--Script Type: Function
--Article: https://raresql.com/2012/12/13/sql-server-proper-case-user-defined-function/
--Developed By: Muhammad Imran
--Date Created: 13 Dec 2012
--Date Modified: 7 Jan 2023

--Sample

--Create table
Create Table Student
(
[Student ID] int Identity(1,1),
[Student Name] varchar(50)
) 
Go

--Insert records into table
Insert into Student Values ('Steve Masters')
Insert into Student Values ('david ortiz')
Insert into Student Values ('Michael sean ray')
Insert into Student Values ('Steven SElikoff')
Insert into Student Values ('Carole POLAND')
Insert into Student Values ('bjorn rettig')
Insert into Student Values ('Michiko OSAda')
Insert into Student Values ('carOL Philips')
Insert into Student Values ('Merav Netz') 
GO

--End of sample

--Create funtion
Create Function dbo.[UDF_PROPER_CASE]
(
@String VARCHAR(MAX)  -- Variable for string
)
RETURNS varchar(MAX)
BEGIN
Declare @Xml XML
Declare @ProperCase Varchar(Max)
Declare @delimiter Varchar(5)
Set @delimiter=' '
SET @Xml = cast(('<A>'+replace(@String,@delimiter,'</A><A>')+'</A>') AS XML)
 
;With CTE AS (SELECT A.value('.', 'varchar(max)') as [Column]
FROM @Xml.nodes('A') AS FN(A) )
Select @ProperCase =Stuff((Select ' ' + UPPER(LEFT([Column],1))
+ LOWER(SUBSTRING([Column], 2 ,LEN([Column]))) from CTE
for xml path('') ),1,1,'')
 
RETURN (@ProperCase)
END
GO

--Example
SELECT dbo.[UDF_PROPER_CASE]([Student Name]) as [Student Name]
from Student
GO
