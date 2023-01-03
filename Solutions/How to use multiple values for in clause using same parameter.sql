--Script Name: How to use multiple values for in clause using same parameter (SQL Server)
--Script Type: Solution
--Article: https://raresql.com/2011/12/21/how-to-use-multiple-values-for-in-clause-using-same-parameter-sql-server/
--Developed By: Muhammad Imran
--Date Created: 21st Dec 2011
--Date Modified: 28th Dec 2022

--Sample

--Create Table
CREATE TABLE [dbo].[Student](
       [Student ID]   [varchar] (6) Not NULL 
     , [Student Name] [varchar](50) NOT NULL);
GO

--Insert records into table
INSERT INTO dbo.[Student] VALUES ('STD001','Bob')
INSERT INTO dbo.[Student] VALUES ('STD002','Alexander')
INSERT INTO dbo.[Student] VALUES ('STD003','Hosanna')
INSERT INTO dbo.[Student] VALUES ('STD004','William')
INSERT INTO dbo.[Student] VALUES ('STD005','Hulda')
INSERT INTO dbo.[Student] VALUES ('STD006','Jacoba')

--End of Sample

--Old Approach

--Declare Variables
DECLARE  @SQL         VARCHAR(MAX);
DECLARE  @WHEREClause VARCHAR(MAX);

--Set values of variables
SET @WHEREClause='Bob,Hulda,Jacoba' 
SET @WHEREClause=REPLACE(@WHEREClause,',',''',''')
SET @SQL='SELECT * 
          FROM dbo.[Student]
          WHERE  [Student Name] In (''' + @WHEREClause + ''')'
 
EXEC (@SQL)

--End of old Approach

--New Approach

--Declare Variables
DECLARE  @Xml AS XML
DECLARE  @WHEREClause VARCHAR(MAX)

--Set values of variables
SET @WHEREClause='Bob,Hulda,Jacoba'
SET @Xml = cASt(('<A>'+replace(@WHEREClause,',' ,'</A><A>')+'</A>') AS XML)
SELECT * 
FROM dbo.[Student]
WHERE  [Student Name] In (
SELECT A.value('.', 'varchar(max)') AS [Column] FROM @Xml.nodes('A') AS FN(A)
)

--End of New Approach
