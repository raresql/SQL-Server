--Script Name: How to use multiple values for IN clause using same parameter 
--Script Type: Solution
--Article: https://raresql.com/2011/12/21/how-to-use-multiple-values-for-in-clause-using-same-parameter-sql-server/
--Developed By: Muhammad Imran
--Date Created: 21 Dec 2011
--Date Modified: 11 Jan 2023

--Sample

--Create table
CREATE TABLE [dbo].[Student](
      [Student ID]   [varchar] (6) Not NULL ,
      [Student Name] [varchar](50) NOT NULL)
GO
 
--Insert records into table
Insert into dbo.[Student] values ('STD001','Bob')
Insert into dbo.[Student] values ('STD002','Alexander')
Insert into dbo.[Student] values ('STD003','Hosanna')
Insert into dbo.[Student] values ('STD004','William')
Insert into dbo.[Student] values ('STD005','Hulda')
Insert into dbo.[Student] values ('STD006','Jacoba')

--End of sample

--Old approach

--Declare variables
Declare  @SQL         VARCHAR(MAX)
Declare  @WhereClause VARCHAR(MAX)

--Set values of variables
Set @WhereClause='Bob,Hulda,Jacoba' 
SET @WhereClause=REPLACE(@WhereClause,',',''',''')
Set @SQL='Select * 
from dbo.[Student]
Where  [Student Name] In (''' + @WhereClause + ''')'

--Execute variables
EXEC (@SQL)

--End of old approach

--New approach

--Declare variables
Declare  @Xml AS XML
Declare  @WhereClause VARCHAR(MAX)

--Set value of variables
Set @WhereClause='Bob,Hulda,Jacoba'
SET @Xml = cast(('<A>'+replace(@WhereClause,',' ,'</A><A>')+'</A>') AS XML)
Select * 
from dbo.[Student]
Where  [Student Name] In (
SELECT A.value('.', 'varchar(max)') as [Column] FROM @Xml.nodes('A') AS FN(A)
)

--End of new approach

--Explanation

--Concert string to XML
SET @Xml = cast(('<A>'+replace(@WhereClause,',' ,'</A><A>')+'</A>') AS XML)
Select @Xml

--End of explanation
