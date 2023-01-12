--Script Name:  Get the first letter of each word in a String (Column)
--Script Type: Solution
--Article: https://raresql.com/2013/04/12/sql-server-get-the-first-letter-of-each-word-in-a-string-column/
--Developed By: Muhammad Imran
--Date Created: 12 Apr 2013
--Date Modified: 10 Jan 2023

--Sample

--Create table
Create Table Student
(
[Student ID] int Identity(1,1),
[Student Name] varchar(50)
)
Go

--Insert records into table
Insert into Student Values ('Steve Masters Bob')
Insert into Student Values ('David Ortiz')
Insert into Student Values ('Michael Sean Ray')
Insert into Student Values ('Steven SElikoff')
Insert into Student Values ('Carole POLAND')
Insert into Student Values ('Bjorn Rettig')
Insert into Student Values ('Michiko OSAda')
Insert into Student Values ('CarOL Philips')
Insert into Student Values ('Merav Netz')
GO

--Create function
Create Function dbo.[UDF_FIRST_LETTER_FROM_WORD]
(
   @String Varchar(Max) -- Variable for string
)
RETURNS Varchar(Max)
BEGIN
Declare @Xml Xml
Declare @firstletter Varchar(Max)
Declare @delimiter Varchar(5)
 
SET @delimiter=' '
SET @Xml = cast(('<a>'+replace(@String,@delimiter,'</a><a>')+'</a>') AS XML)
 
;With CTE AS (SELECT A.value('.', 'varchar(max)') as [Column]
FROM @Xml.nodes('a') AS FN(a) )
SELECT @firstletter =Stuff((SELECT '' + LEFT([Column],1)
FROM CTE
FOR XML PATH('') ),1,0,'')
 
RETURN (@firstletter)
END
GO
--End of sample

--Example-1

--Browse table
SELECT [Student Name],
dbo.[UDF_FIRST_LETTER_FROM_WORD] ([Student Name]) as [First Letters]
FROM Student
GO

--End of example-1

--Example-2

--Browse table
Declare @String as varchar(100)
Set @String ='My Best Friend'
SELECT @String as [String]
, dbo.[UDF_FIRST_LETTER_FROM_WORD] (@String) as [First Letters]

--End of example-2
